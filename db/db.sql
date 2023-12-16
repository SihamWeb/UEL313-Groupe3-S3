-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : sam. 16 déc. 2023 à 17:23
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

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
  `lien_id` int(11) NOT NULL,
  `lien_url` varchar(255) NOT NULL,
  `lien_titre` varchar(255) NOT NULL,
  `lien_desc` text DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(25, 'https://www.lemonde.fr/', 'Le Monde', 'Le Monde est un quotidien français de l\'après-midi. C\'est la principale publication du groupe Le Monde et a fait état d\'un tirage moyen de 479 243 exemplaires par numéro en 2022, dont environ 40 000 ont été vendus à l\'étranger.', 8);

-- --------------------------------------------------------

--
-- Structure de la table `tl_tags`
--

CREATE TABLE `tl_tags` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(35, 'Social');

-- --------------------------------------------------------

--
-- Structure de la table `tl_tags_liens`
--

CREATE TABLE `tl_tags_liens` (
  `tag_id` int(11) NOT NULL,
  `lien_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(6, 21);

-- --------------------------------------------------------

--
-- Structure de la table `tl_users`
--

CREATE TABLE `tl_users` (
  `usr_id` int(11) NOT NULL,
  `usr_name` varchar(50) NOT NULL,
  `usr_password` varchar(88) NOT NULL,
  `usr_salt` varchar(23) NOT NULL,
  `usr_role` varchar(50) NOT NULL DEFAULT 'ROLE_ADMIN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `tl_users`
--

INSERT INTO `tl_users` (`usr_id`, `usr_name`, `usr_password`, `usr_salt`, `usr_role`) VALUES
(1, 'admin', 'LsJKppRTEPz4uKrkhScOE6HBSvHuaIcFbAX9FWC7h/f5HffX4TBcFt7p8M0hqvGzFXL+JV8TzEYePoimaosfMQ==', '>=28!7NLw!S37zLjs7Uu[nC', 'ROLE_ADMIN'),
(3, 'siham', 'x7f2YI75e/YZiElXZlkDlNAQD52NNMx/Wu3lx09V9PoDvk+0v63FewiTuuyCVjkh4owv9UZKL8RWgrJS6yF3Uw==', '262583b7564f4e36511f8bc', 'ROLE_ADMIN'),
(6, 'watson', 'n1jHV3sIhxeEReVLnIZRibFM8q9AhBS6wzgPyz/YveNF7Q7h/hQ08hbMaT2aeKyVIo2A8SqrVw/SXfOEaPcuDQ==', '78627d9acf81fa84ab8f5c5', 'ROLE_ADMIN'),
(8, 'valentine', 'Ulic8XEACHw8DQg6NEEYGj+9CH8r9IpUekyW+Kx8l8LMuA2l/QN8Cj/OP8Th3lQwbQZz/DiPay15bRPWuikrVg==', '38d8e79ddac6df3f2753b50', 'ROLE_ADMIN');

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
  MODIFY `lien_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `tl_tags`
--
ALTER TABLE `tl_tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `tl_users`
--
ALTER TABLE `tl_users`
  MODIFY `usr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
