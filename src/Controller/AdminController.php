<?php

namespace Watson\Controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Watson\Domain\Link;
use Watson\Domain\User;
use Watson\Domain\Tag;
use Watson\Form\Type\LinkType;
use Watson\Form\Type\UserType;
use \DateTime;

class AdminController {

    /**
     * Admin home page controller.
     *
     * @param Request $request Incoming request
     * @param Application $app Silex application
     */
    public function indexAction(Request $request, Application $app) {
        // Get the page number from the query
        $currentPageLinks = $request->query->get('pageLinks', 1);
        $currentPageUsers = $request->query->get('pageUsers', 1);
        $byPageLinks = 3;
        $byPageUsers = 2;

        // Get links paginated
        $links = $app['dao.link']->findByPage($currentPageLinks, $byPageLinks);
        // Get the total number of links
        $totalLinks = $app['dao.link']->getTotalLinks();
        // Get Number of pages necessary (links)
        $totalPagesLinks = ceil($totalLinks / $byPageLinks);

        // Get Users paginated
        $users = $app['dao.user']->findByPage($currentPageUsers, $byPageUsers);
        // Get the total number of users
        $totalUsers = $app['dao.user']->getTotalUsers();
        // Get Number of pages necessary (users)
        $totalPagesUsers = ceil($totalUsers / $byPageUsers);

        return $app['twig']->render('admin.html.twig', array(
            'links' => $links,
            'users' => $users,
            'totalPagesLinks' => $totalPagesLinks,
            'totalPagesUsers' => $totalPagesUsers,
            'currentPageLinks' => $currentPageLinks,
            'currentPageUsers' => $currentPageUsers
        ));
    }

    /**
     * Get paginated content in JSON format.
     *
     * @param Request $request Incoming request
     * @param Application $app Silex application
     * @return JsonResponse
     */
    public function getContentAction(Request $request, Application $app)
    {
        // Content type from the request (links or users)
        $contentType = $request->query->get('contentType');

        // Initialisation variables for pagination
        $page = $request->query->get('page', 1);

        // Type of content requested
        switch ($contentType) {
            case 'links':
                $byPage = 3;
                $links = $app['dao.link']->findByPage($page, $byPage);
                $totalLinks = $app['dao.link']->getTotalLinks();
                $totalPages = ceil($totalLinks / $byPage);

                $responseData = [
                    'content' => $links,
                    'totalPages' => $totalPages,
                    'currentPage' => $page,
                ];

                break;

            case 'users':
                $byPage = 2;
                $users = $app['dao.user']->findByPage($page, $byPage);
                $totalUsers = $app['dao.user']->getTotalUsers();
                $totalPages = ceil($totalUsers / $byPage);

                $responseData = [
                    'content' => $users,
                    'totalPages' => $totalPages,
                    'currentPage' => $page,
                ];
                break;

        }
        error_log(print_r($responseData, true));

        // Return the data as a JSON response
        return new JsonResponse($responseData);
    }



    /**
     * Add link controller.
     *
     * @param Request $request Incoming request
     * @param Application $app Silex application
     */
    public function addLinkAction(Request $request, Application $app) { 
        $link     = new Link();
        $linkForm = $app['form.factory']->create(new LinkType(), $link);
        $linkForm->handleRequest($request);

        if ($linkForm->isSubmitted() && $linkForm->isValid()) {
            // Store data in object
            $linkData = $linkForm->getData();

            // Transform tags (string) into array of objects "Tag"
            $str_tags = $linkData->getTags();
            $_tags    = array();

            if(!is_null($str_tags) && !empty($str_tags)){
                $array_tags = explode(' ', $str_tags);
                if(count($array_tags)){
                    foreach($array_tags as $row){
                        $word = new Tag();
                        $word->setTitle($row);
                        $app['dao.tag']->save($word);
                        array_push($_tags, $word);
                    }
                }
            }

            $user = $app['user'];
            $link->setUser($user);
            $app['dao.link']->save($link);
            $idLink = $link->getId();

            // Save connection between link and tag(s)
            if(count($_tags)){
                foreach($_tags as $tag){
                    $app['dao.tag']->saveConnection($idLink, $tag);
                }
            }

            // Update RSS file
            $linksRss = $app['dao.link']->findLastLinks();
            date_default_timezone_set('Europe/Paris');
            $date = new DateTime("");
            $repertoire = dirname(__DIR__, 2) . '/rss.xml';
            $fichier = fopen($repertoire, "w");
            $xml = '<?xml version="1.0" encoding="UTF-8" ?>' . PHP_EOL;
            $xml .= '<rss version="2.0" xmlns:content="http://purl.org/rss/1.0/modules/content/"
                        xmlns:wfw="http://wellformedweb.org/CommentAPI/"
                        xmlns:dc="http://purl.org/dc/elements/1.1/"
                        xmlns:atom="http://www.w3.org/2005/Atom"
                        xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
                        xmlns:slash="http://purl.org/rss/1.0/modules/slash/">' . PHP_EOL;
            $xml .= '   <channel>' . PHP_EOL;
            $xml .= '       <title>Watson - Liens</title>' . PHP_EOL;
            $xml .= '       <atom:link href="' . __DIR__ . '/rss.xml" rel="self" type="application/rss+xml" />' . PHP_EOL;
            $xml .= '       <link>https://www.watson.com</link>' . PHP_EOL;
            $xml .= '       <language>fr-FR</language>' . PHP_EOL;
            $xml .= '       <description>Ce flux répertorie les 15 derniers liens de Watson</description>' . PHP_EOL;
            $xml .= '       <lastBuildDate>' . $date->format('D, d M Y H:i:s O') . '</lastBuildDate>' . PHP_EOL;
    
            foreach ($linksRss as $linkRss) {
                $user = $app['dao.user']->find($linkRss['user_id']);
                $xml .= '       <item>' . PHP_EOL;
                $xml .= '           <title>' . $linkRss["lien_titre"] . '</title>' . PHP_EOL;
                $xml .= '           <link>' . $linkRss["lien_url"] . '</link>' . PHP_EOL;
                $xml .= '           <description><![CDATA[' . $linkRss["lien_desc"] . ']]></description>' . PHP_EOL;
                $xml .= '           <dc:creator><![CDATA[' . $user->getUsername() . ']]></dc:creator>' . PHP_EOL;
                $xml .= '           <guid isPermaLink="false">http://www.watson.com/link/' . $linkRss["lien_id"] . '</guid>' . PHP_EOL;
    
                $xml .= '       </item>' . PHP_EOL;
            }
    
            $xml .= '   </channel>' . PHP_EOL;
            $xml .= '</rss>';
            fwrite($fichier, $xml);
            fclose($fichier);

            
            $app['session']->getFlashBag()->add('success', 'The link was successfully created.');
        }

        return $app['twig']->render('link_form.html.twig', array(
            'title' => 'New link',
            'linkForm' => $linkForm->createView()));
    }

    /**
     * Edit link controller.
     *
     * @param integer $id Link id
     * @param Request $request Incoming request
     * @param Application $app Silex application
     */
    public function editLinkAction($id, Request $request, Application $app) {
        $link     = $app['dao.link']->find($id);
        $linkForm = $app['form.factory']->create(new LinkType(), $link);

        $linkForm->handleRequest($request); // match avant/modif

        // Get tag associated to link
        $str_tags = $link->getTags();

        // If type is array, we need convert to string for show form...
        if(is_array($str_tags)){
            $_tags = $app['dao.tag']->find($id);

            // For convert tag array to tag string 
            if($_tags && count($_tags)){
                $array_tags = [];
                foreach ($_tags as $row) {
                    array_push($array_tags, $row->getTitle());
                }
                $new_value = implode(' ', $array_tags);

                // Update value
                $link->setTags($new_value);
                $linkForm->get('tags')->setData($new_value);
            }
        } 
        
        if ($linkForm->isSubmitted() && $linkForm->isValid()) {
            // ... else it's a string sented by user and we need save it in db
            if(is_string($str_tags) && !empty($str_tags)){
                $array_tags = explode(' ', $str_tags);

                // Remove old connection
                $app['dao.tag']->removeConnecion($id);
                
                if(count($array_tags)){
                    foreach($array_tags as $tag){
                        $word = new Tag();
                        $word->setTitle($tag);
                        $app['dao.tag']->save($word);
                        $app['dao.tag']->saveConnection($id, $word);
                    }
                }
            }

            $app['dao.link']->save($link);
            $app['session']->getFlashBag()->add('success', 'The link was succesfully updated.');
        }
        return $app['twig']->render('link_form.html.twig', array(
            'title' => 'Edit link',
            'linkForm' => $linkForm->createView()));
    }

    /**
     * Delete link controller.
     *
     * @param integer $id Link id
     * @param Application $app Silex application
     */
    public function deleteLinkAction($id, Application $app) {
        // Delete the link
        $app['dao.link']->delete($id);
        $app['session']->getFlashBag()->add('success', 'The link was succesfully removed.');
        
        // Redirect to admin home page
        return $app->redirect($app['url_generator']->generate('admin'));
    }

    /**
     * Add user controller.
     *
     * @param Request $request Incoming request
     * @param Application $app Silex application
     */
    public function addUserAction(Request $request, Application $app) {
        $user     = new User();
        $userForm = $app['form.factory']->create(new UserType(), $user);
        $userForm->handleRequest($request);
        if ($userForm->isSubmitted() && $userForm->isValid()) {
            // Generate a random salt value
            $salt = substr(md5(time()), 0, 23);
            $user->setSalt($salt);
            $plainPassword = $user->getPassword();
           
            // Find the default encoder
            $encoder = $app['security.encoder.digest'];

            // Compute the encoded password
            $password = $encoder->encodePassword($plainPassword, $user->getSalt());
            $user->setPassword($password); 
            $app['dao.user']->save($user);
            $app['session']->getFlashBag()->add('success', 'The user was successfully created.');
        }

        return $app['twig']->render('user_form.html.twig', array(
            'title' => 'New user',
            'userForm' => $userForm->createView()));
    }

    /**
     * Edit user controller.
     *
     * @param integer $id User id
     * @param Request $request Incoming request
     * @param Application $app Silex application
     */
    public function editUserAction($id, Request $request, Application $app) {
        $user     = $app['dao.user']->find($id);
        $userForm = $app['form.factory']->create(new UserType(), $user);
        $userForm->handleRequest($request);
        if ($userForm->isSubmitted() && $userForm->isValid()) {
            $plainPassword = $user->getPassword();
            // Find the encoder for the user
            $encoder = $app['security.encoder_factory']->getEncoder($user);
          
            // Compute the encoded password
            $password = $encoder->encodePassword($plainPassword, $user->getSalt());
            $user->setPassword($password); 
            $app['dao.user']->save($user);
            $app['session']->getFlashBag()->add('success', 'The user was succesfully updated.');
        }
        return $app['twig']->render('user_form.html.twig', array(
            'title' => 'Edit user',
            'userForm' => $userForm->createView()));
    }

    /**
     * Delete user controller.
     *
     * @param integer $id User id
     * @param Application $app Silex application
     */
    public function deleteUserAction($id, Application $app) {
        // Delete all associated links
        $app['dao.link']->deleteAllByUser($id);

        // Delete the user
        $app['dao.user']->delete($id);
        $app['session']->getFlashBag()->add('success', 'The user (and associated links) was succesfully removed.');

        // Redirect to admin home page
        return $app->redirect($app['url_generator']->generate('admin'));
    }
}
