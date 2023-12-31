<?php

namespace Watson\Controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class HomeController {

    /**
     * Home page controller.
     *
     * @param Request $request Incoming request
     * @param Application $app Silex application
     */
    public function indexAction(Request $request, Application $app) {
        // Get the page number from the query
        $currentPageLinks = $request->query->get('pageLinks', 1);
        $byPageLinks = 15;

        // Get links paginated
        $links = $app['dao.link']->findByPage($currentPageLinks, $byPageLinks);
        // Get the total number of links
        $totalLinks = $app['dao.link']->getTotalLinks();
        // Get Number of pages necessary (links)
        $totalPagesLinks = ceil($totalLinks / $byPageLinks);

        $links = $app['dao.link']->findByPage($currentPageLinks, $byPageLinks);
        return $app['twig']->render('index.html.twig', array(
            'links' => $links,
            'totalPagesLinks' => $totalPagesLinks,
            'currentPageLinks' => $currentPageLinks
        ));
    }

    /**
     * @return Response RSS File
     */

    public function rssAction(){
        $rssContent = file_get_contents(__DIR__.'/../../web/rss.xml');
        return new Response($rssContent, 200, array('Content-Type' => 'text/xml'));
    }

    /**
     * Link details controller.
     *
     * @param integer $id Link id
     * @param Request $request Incoming request
     * @param Application $app Silex application
     */
    public function linkAction($id, Request $request, Application $app) {
        $link = $app['dao.link']->find($id);
        if ($app['security.authorization_checker']->isGranted('IS_AUTHENTICATED_FULLY')) {
            // A user is fully authenticated : he can add comments
            // Check if he's author for manage link

        }
        return $app['twig']->render('link.html.twig', array(
            'link' => $link
        ));
    }

    /**
     * Links by tag controller.
     *
     * @param integer $id Tag id
     * @param Request $request Incoming request
     * @param Application $app Silex application
     */
    public function tagAction($id, Request $request, Application $app) {
        $page = $request->query->get('page', 1);
        $byPage = 3;

        $totalLinks = $app['dao.link']->countByTag($id);
        $needPage = ceil($totalLinks / $byPage);

        $links = $app['dao.link']->findAllByTag($id, $page, $byPage);
        $tag   = $app['dao.tag']->findTagName($id);

        return $app['twig']->render('result_tag.html.twig', array(
            'links' => $links,
            'tag'   => $tag,
            'page'  => $page,
            'maxPages' => $needPage,
        ));
    }



    /**
     * User login controller.
     *
     * @param Request $request Incoming request
     * @param Application $app Silex application
     */
    public function loginAction(Request $request, Application $app) {
        return $app['twig']->render('login.html.twig', array(
            'error'         => $app['security.last_error']($request),
            'last_username' => $app['session']->get('_security.last_username'),
            )
        );
    }
}
