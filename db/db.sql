-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 172.17.0.2
-- Généré le : dim. 17 déc. 2023 à 17:38
-- Version du serveur : 8.0.35-0ubuntu0.20.04.1
-- Version de PHP : 8.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `watson`
--

-- --------------------------------------------------------

--
-- Structure de la table `tl_liens`
--

CREATE TABLE `tl_liens` (
  `lien_id` int NOT NULL,
  `lien_url` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `lien_titre` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `lien_desc` text COLLATE utf8mb3_unicode_ci,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `tl_liens`
--

INSERT INTO `tl_liens` (`lien_id`, `lien_url`, `lien_titre`, `lien_desc`, `user_id`) VALUES
(1, 'https://cvtic.unilim.fr/', 'Campus Virtuel TIC', 'Site internet du CvTIC.', 1),
(2, 'https://duckduckgo.com/', 'Duck Duck Go', 'Le moteur de recherche qui ne trace pas ses utilisateurs.', 1),
(3, 'https://framasoft.org/', 'Framasoft 12', 'Un réseau dédié à la promotion du « libre » en général et du logiciel libre en particulier.', 1),
(12, 'https://developer.mozilla.org/fr/docs/Learn', 'MDN Web Docs', 'Un ensemble d’articles pour fournir aux développeurs web débutants tout ce dont ils ont besoin pour commencer à développer des sites web simples.', 3),
(13, 'https://www.wampserver.com/', 'WampServer', 'WampServer est une plate-forme de développement Web sous Windows pour des applications Web dynamiques à l’aide du serveur Apache2, du langage de scripts PHP et d’une base de données MySQL.', 3),
(14, 'https://www.net-concept.fr/developpement-web/le-developpement-web-cest-quoi/', 'Net Concept', 'Le développement Web désigne de manière générale les tâches associées au développement de sites Web destinés à être hébergés via un intranet ou Internet.', 3),
(15, 'https://www.cnil.fr/fr', 'CNIL', 'Le site de la CNIL offre des informations sur vos droits en matière de données personnelles et comment les exercer. Il propose également des conseils sur la protection de vos données sur Internet.', 3),
(16, 'https://www.ionos.fr', 'IONOS', 'IONOS est un fournisseur de services Internet offrant des solutions d’hébergement, de création de sites Web et de commerce en ligne.', 3),
(20, 'https://www.letelegramme.fr/', 'Le Télégramme', 'Le Télégramme est un média régional français de Bretagne, dont le siège se trouve à Morlaix. Sa version imprimée est diffusée dans le Finistère, les Côtes-d\'Armor, le Morbihan et dans le pays de Saint-Malo. Il emploie 550 personnes, dont près de 220 journalistes.', 8),
(21, 'https://cnes.fr/fr', 'CNES', 'Le Centre national d\'études spatiales est un établissement public à caractère industriel et commercial chargé d’élaborer et de proposer au gouvernement français le programme spatial français, puis de le mettre en œuvre.', 8),
(23, 'https://www.legifrance.gouv.fr/', 'Legifrance', 'Légifrance est le site web officiel du gouvernement français pour la diffusion des textes législatifs et réglementaires et des décisions de justice des cours suprêmes et d\'appel de droit français', 8),
(24, 'https://www.reddit.com/', 'Reddit', 'Reddit est un site web communautaire américain de discussion et d’actualités sociales. Les liens les plus appréciés du moment se trouvent affichés en page d’accueil par le vote des utilisateurs. Fondé en 2005, Reddit contient alors surtout du contenu sur la programmation et la science.', 8),
(25, 'https://www.lemonde.fr/', 'Le Monde', 'Le Monde est un quotidien français de l\'après-midi. C\'est la principale publication du groupe Le Monde et a fait état d\'un tirage moyen de 479 243 exemplaires par numéro en 2022, dont environ 40 000 ont été vendus à l\'étranger.', 8),
(26, 'https://discord.com/', 'Discord', 'Discord est un logiciel propriétaire gratuit de VoIP et de messagerie instantanée.', 3),
(27, 'https://google.com', 'Google', 'Google est une entreprise américaine de services technologiques', 3),
(29, 'https://www.bing.com/', 'Bing', 'Microsoft Bing, est un moteur de recherche élaboré par la société Microsoft.', 3),
(30, 'https://www.deepl.com/translator', 'DeepL', 'DeepL est un service de traduction automatique en ligne de la société DeepL GmbH, lancé le 28 août 2017 par l\'équipe de Linguee.', 3),
(31, 'https://fr.wikipedia.org', 'Wikipedia', 'Un projet d’encyclopédie collective en ligne, universelle, multilingue et fonctionnant sur le principe du wiki.', 3),
(32, 'https://www.onisep.fr', 'Onisep', 'Onisep produit et diffuse toute l\'information sur les formations et les métiers.', 3),
(33, 'https://www.ldlc.com', 'LDLC', '\"N°1 du high-tech et du matériel informatique, Élu Service Client de l\'Année.\"', 3),
(34, 'https://www.rueducommerce.fr', 'Rue du Commerce', 'Une entreprise française de grande distribution, acteur du secteur du commerce en ligne en France.', 3),
(35, 'https://wordpress.com/fr/', 'WordPress', 'Créez et développez un site internet avec WordPress.', 3),
(36, 'https://www.php.net/manual/fr/index.php', 'Support - PHP', 'Aide et assistance pour PHP en ligne', 3),
(37, 'https://www.https://validator.w3.org/.net/manual/fr/index.php', 'Validator W3C', 'Le Markup Validation Service est un validateur du World Wide Web Consortium qui permet aux utilisateurs Internet de vérifier les documents HTML et XHTML pré-HTML5 pour un balisage bien formé par rapport à une définition de type de document.', 3),
(38, 'https://www.postman.com/', 'Postman', 'Postman est une application permettant de tester des API.', 3),
(39, 'https://phpcodechecker.com/', 'Checker PHP', 'Un vérificateur de code PHP avancé et personnalisé qui recherche dans votre code les fautes de frappe et les erreurs les plus courantes et les plus difficiles à trouver ; comprend une vérification de la syntaxe.', 3),
(40, 'https://www.virtualbox.org/', 'Virtualbox', 'Oracle VM VirtualBox est un logiciel libre de virtualisation créé par la société Innotek rachetée par Sun Microsystems et aujourd\'hui publié par Oracle.', 3),
(41, 'https://www.debian.org/index.fr.html', 'Debian', 'Debian est une distribution Linux, composée presqu\'exclusivement de logiciels libres.', 3),
(42, 'https://www.linux.org/', 'Linux', 'Linux ou GNU/Linux — plus rarement GNU+Linux — est une famille de systèmes d\'exploitation open source de type Unix fondés sur le noyau Linux créé en 1991 par Linus Torvalds.', 3),
(43, 'https://www.sublimetext.com/', 'Sublime text', 'Sublime Text est un éditeur de texte générique codé en C++ et Python, disponible sur Windows, Mac et Linux. Le logiciel a été conçu tout d\'abord comme une extension pour Vim, riche en fonctionnalités.', 3),
(44, 'https://code.visualstudio.com/', 'Visual Studio Code', 'Visual Studio Code est un éditeur de code extensible développé par Microsoft pour Windows, Linux et macOS.', 3),
(45, 'https://www.jetbrains.com/fr-fr/phpstorm/', 'PhpStorm', 'L\'IDE PHP intelligent et ultra rapide', 3);

-- --------------------------------------------------------

--
-- Structure de la table `tl_tags`
--

CREATE TABLE `tl_tags` (
  `tag_id` int NOT NULL,
  `tag_name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `tl_tags`
--

INSERT INTO `tl_tags` (`tag_id`, `tag_name`) VALUES
(1, 'fac'),
(2, 'vieprivee'),
(3, 'opensource'),
(4, 'apprendre'),
(5, 'google'),
(6, 'recherche'),
(7, 'channel'),
(10, 'développement'),
(12, 'apprentissage'),
(13, 'web'),
(14, 'windows'),
(15, 'apache2'),
(16, 'php'),
(17, 'mysql'),
(18, 'html'),
(19, 'css'),
(20, 'intranet'),
(21, 'internet'),
(22, 'codage'),
(23, 'données'),
(24, 'hébergement'),
(25, 'googleg'),
(26, 'Informations'),
(27, 'Bretagne'),
(28, 'Journal'),
(29, 'Astronomie'),
(30, 'Spatial'),
(31, 'France'),
(32, 'Droit'),
(33, 'Justice'),
(34, 'Informatique'),
(35, 'Social'),
(36, 'communication'),
(37, 'traduction'),
(38, 'anglais'),
(39, 'définition'),
(40, 'aide'),
(41, 'wiki'),
(42, 'métiers'),
(43, 'achat'),
(44, 'commerce'),
(45, 'service'),
(46, 'site'),
(47, 'support'),
(48, 'validation'),
(49, 'test'),
(50, 'api'),
(51, 'ssh'),
(52, 'distance'),
(53, 'distribution'),
(54, 'linux'),
(55, 'terminal'),
(56, 'shell'),
(57, 'text'),
(58, 'editeur'),
(59, 'python'),
(60, 'c++'),
(61, 'macos'),
(62, 'ide');

-- --------------------------------------------------------

--
-- Structure de la table `tl_tags_liens`
--

CREATE TABLE `tl_tags_liens` (
  `tag_id` int NOT NULL,
  `lien_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `tl_tags_liens`
--

INSERT INTO `tl_tags_liens` (`tag_id`, `lien_id`) VALUES
(1, 1),
(5, 4),
(5, 5),
(2, 2),
(3, 2),
(3, 3),
(5, 6),
(6, 7),
(6, 8),
(7, 9),
(7, 10),
(7, 11),
(18, 12),
(19, 12),
(10, 12),
(13, 12),
(12, 12),
(10, 13),
(13, 13),
(14, 13),
(15, 13),
(16, 13),
(17, 13),
(10, 14),
(13, 14),
(20, 14),
(21, 14),
(22, 14),
(23, 15),
(21, 15),
(10, 16),
(13, 16),
(24, 16),
(5, 17),
(25, 18),
(26, 19),
(27, 19),
(28, 19),
(26, 20),
(27, 20),
(28, 20),
(29, 22),
(30, 22),
(6, 22),
(31, 23),
(32, 23),
(33, 23),
(34, 24),
(35, 24),
(26, 25),
(28, 25),
(31, 25),
(29, 21),
(30, 21),
(6, 21),
(7, 26),
(36, 26),
(6, 27),
(21, 27),
(13, 27),
(6, 28),
(21, 28),
(13, 28),
(13, 29),
(21, 29),
(6, 29),
(37, 30),
(38, 30),
(39, 31),
(40, 31),
(41, 31),
(42, 32),
(40, 32),
(26, 32),
(43, 33),
(34, 33),
(43, 34),
(34, 34),
(44, 34),
(13, 35),
(45, 35),
(46, 35),
(47, 36),
(40, 36),
(16, 36),
(48, 37),
(13, 37),
(18, 37),
(19, 37),
(49, 38),
(50, 38),
(49, 39),
(16, 39),
(48, 39),
(13, 40),
(21, 40),
(51, 40),
(52, 40),
(53, 41),
(13, 41),
(52, 41),
(54, 42),
(13, 42),
(55, 42),
(56, 42),
(57, 43),
(18, 43),
(19, 43),
(58, 43),
(59, 43),
(60, 43),
(57, 44),
(18, 44),
(19, 44),
(58, 44),
(54, 44),
(14, 44),
(61, 44),
(62, 45),
(58, 45),
(16, 45);

-- --------------------------------------------------------

--
-- Structure de la table `tl_users`
--

CREATE TABLE `tl_users` (
  `usr_id` int NOT NULL,
  `usr_name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `usr_password` varchar(88) COLLATE utf8mb3_unicode_ci NOT NULL,
  `usr_salt` varchar(23) COLLATE utf8mb3_unicode_ci NOT NULL,
  `usr_role` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'ROLE_ADMIN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `tl_users`
--

INSERT INTO `tl_users` (`usr_id`, `usr_name`, `usr_password`, `usr_salt`, `usr_role`) VALUES
(1, 'admin', 'LsJKppRTEPz4uKrkhScOE6HBSvHuaIcFbAX9FWC7h/f5HffX4TBcFt7p8M0hqvGzFXL+JV8TzEYePoimaosfMQ==', '>=28!7NLw!S37zLjs7Uu[nC', 'ROLE_ADMIN'),
(3, 'siham', 'x7f2YI75e/YZiElXZlkDlNAQD52NNMx/Wu3lx09V9PoDvk+0v63FewiTuuyCVjkh4owv9UZKL8RWgrJS6yF3Uw==', '262583b7564f4e36511f8bc', 'ROLE_ADMIN'),
(6, 'watson', 'n1jHV3sIhxeEReVLnIZRibFM8q9AhBS6wzgPyz/YveNF7Q7h/hQ08hbMaT2aeKyVIo2A8SqrVw/SXfOEaPcuDQ==', '78627d9acf81fa84ab8f5c5', 'ROLE_ADMIN'),
(8, 'valentine', 'Ulic8XEACHw8DQg6NEEYGj+9CH8r9IpUekyW+Kx8l8LMuA2l/QN8Cj/OP8Th3lQwbQZz/DiPay15bRPWuikrVg==', '38d8e79ddac6df3f2753b50', 'ROLE_ADMIN'),
(9, 'dylan', 'kqVYGOPyKi15oiJbyfvPBWAEyKDVxlJXfbIurI4A41DnqnG3HGiWQLVFkevV1dykuomFRG8YHMypBrcrBzQeWA==', 'c8873291f50b2e5e27cb1a0', 'ROLE_ADMIN');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `tl_liens`
--
ALTER TABLE `tl_liens`
  ADD PRIMARY KEY (`lien_id`);

--
-- Index pour la table `tl_tags`
--
ALTER TABLE `tl_tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Index pour la table `tl_users`
--
ALTER TABLE `tl_users`
  ADD PRIMARY KEY (`usr_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `tl_liens`
--
ALTER TABLE `tl_liens`
  MODIFY `lien_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `tl_tags`
--
ALTER TABLE `tl_tags`
  MODIFY `tag_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT pour la table `tl_users`
--
ALTER TABLE `tl_users`
  MODIFY `usr_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
