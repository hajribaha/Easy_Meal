-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  mer. 17 juin 2020 à 23:46
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `projet_android`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL DEFAULT '0',
  `nom` varchar(255) NOT NULL,
  `image` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`, `image`) VALUES
(0, 'Collations', 2131230830),
(1, 'Pizza', 2131230889),
(3, 'Japonais', 2131230820),
(4, 'Barbecue', 2131230814),
(5, 'Bresilien', 2131230816),
(6, 'Sante', 2131230828),
(7, 'Bonbons', 2131230905),
(8, 'Glace', 2131230849),
(9, 'Chinois', 2131230821),
(10, 'Arabe', 2131230810);

-- --------------------------------------------------------

--
-- Structure de la table `cate_restau`
--

CREATE TABLE `cate_restau` (
  `id` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `id_restau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `extra`
--

CREATE TABLE `extra` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `extra`
--

INSERT INTO `extra` (`id`, `nom`, `prix`) VALUES
(1, 'Du fromage', '2dt'),
(2, 'Bacon', '1.5dt'),
(3, 'Cheddar', ''),
(4, 'Sauce moutarde', '1dt'),
(5, 'Thon', '1.7dt'),
(6, 'salami', '0.5dt');

-- --------------------------------------------------------

--
-- Structure de la table `repas`
--

CREATE TABLE `repas` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `prix` varchar(255) NOT NULL,
  `id_restau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `repas`
--

INSERT INTO `repas` (`id`, `nom`, `image`, `description`, `prix`, `id_restau`) VALUES
(7, 'Omelette', 'Omelette', 'Un plaisir simple qui fait toujours son petit effet : l\'omelette au fromage. Tellement bonne, tellement savoureuse, on en raffole ! On sait tous et toutes comment faire une omelette... ', '5.5dt', 1),
(8, 'Salade', 'Salade', 'Quand l\'été arrive, rien de tel qu\'une bonne salade de pâtes fraîches et généreuse ! Parfaite en entrée pour démarrer en beauté un bon repas, ou en accompagnement d\'une belle grillade au barbecue', '10dt', 8);

-- --------------------------------------------------------

--
-- Structure de la table `repas_fav`
--

CREATE TABLE `repas_fav` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_repas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `repas_fav`
--

INSERT INTO `repas_fav` (`id`, `id_user`, `id_repas`) VALUES
(1, 1, 7),
(2, 1, 8);

-- --------------------------------------------------------

--
-- Structure de la table `restaurant`
--

CREATE TABLE `restaurant` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `delivery` varchar(255) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `heure_ouverture` varchar(255) DEFAULT NULL,
  `heure_cloture` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `restaurant`
--

INSERT INTO `restaurant` (`id`, `nom`, `adresse`, `delivery`, `telephone`, `image`, `heure_ouverture`, `heure_cloture`, `description`) VALUES
(1, 'Chipotle', 'av Hedi chekir', 'Livraison gratuite', NULL, NULL, NULL, NULL, NULL),
(2, 'Five Guys', 'av Hbib borguiba', '7,00dt', NULL, NULL, NULL, NULL, NULL),
(3, 'Starbucks', 'av Hedi chekir', '4,00dt', NULL, NULL, NULL, NULL, NULL),
(4, 'Subway', 'av 2987 naser 1', 'Livraison gratuite', NULL, NULL, NULL, NULL, NULL),
(5, 'Dunkin Donuts', 'av Rome', '6,00dt', NULL, NULL, NULL, NULL, NULL),
(6, 'Habbib', 'av Paris', 'Livraison gratuite', NULL, NULL, NULL, NULL, NULL),
(7, 'Mac Donalds', 'av Barchalona', '11,00dt', NULL, NULL, NULL, NULL, NULL),
(8, 'Soltan ahmed', 'av Esteklel manr 2', '10,00dt', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `restau_cat`
--

CREATE TABLE `restau_cat` (
  `id` int(11) NOT NULL,
  `id_restau` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `restau_cat`
--

INSERT INTO `restau_cat` (`id`, `id_restau`, `id_cat`) VALUES
(1, 1, 1),
(2, 1, 5),
(3, 5, 8),
(4, 5, 1),
(5, 2, 9),
(6, 2, 3),
(7, 6, 0),
(8, 6, 7),
(9, 7, 6),
(10, 7, 10),
(11, 8, 10),
(12, 8, 1),
(13, 3, 4),
(14, 3, 1),
(15, 4, 10),
(16, 4, 0);

-- --------------------------------------------------------

--
-- Structure de la table `restau_fav`
--

CREATE TABLE `restau_fav` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_restau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `restau_fav`
--

INSERT INTO `restau_fav` (`id`, `id_user`, `id_restau`) VALUES
(54, 1, 2),
(56, 1, 8);

-- --------------------------------------------------------

--
-- Structure de la table `restau_rating`
--

CREATE TABLE `restau_rating` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_restau` int(11) NOT NULL,
  `note` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `restau_rating`
--

INSERT INTO `restau_rating` (`id`, `id_user`, `id_restau`, `note`) VALUES
(1, 1, 1, 4),
(2, 1, 1, 1),
(3, 1, 1, 2),
(6, 1, 1, 1),
(7, 1, 1, 1),
(8, 1, 1, 5),
(9, 1, 1, 5),
(10, 1, 1, 5),
(11, 1, 1, 5),
(12, 1, 1, 5),
(13, 1, 1, 3),
(14, 1, 1, 5),
(15, 1, 1, 2),
(16, 1, 1, 5),
(17, 1, 2, 5),
(18, 1, 2, 1),
(19, 1, 1, 4),
(20, 1, 1, 5),
(21, 1, 1, 5),
(22, 1, 1, 5),
(23, 1, 1, 5),
(24, 1, 1, 5),
(25, 1, 1, 5),
(26, 1, 1, 5),
(27, 1, 3, 5),
(28, 1, 3, 1),
(29, 1, 1, 5),
(30, 1, 1, 3),
(31, 1, 4, 5),
(32, 1, 4, 1),
(33, 1, 1, 1),
(34, 1, 1, 5),
(35, 1, 1, 5),
(36, 1, 3, 3),
(37, 1, 3, 5),
(38, 1, 5, 1),
(39, 1, 6, 1),
(40, 1, 7, 1),
(41, 1, 8, 1),
(42, 1, 5, 2),
(43, 1, 7, 5),
(137, 1, 8, 1),
(138, 1, 8, 2),
(139, 1, 8, 5),
(140, 1, 8, 5),
(141, 1, 6, 5),
(142, 1, 4, 5),
(143, 1, 8, 5);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `test`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `test` (
`id` int(11)
,`nom` varchar(255)
,`adresse` varchar(255)
,`rating` decimal(12,1)
,`delivery` varchar(255)
,`favoris` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure de la table `t_user`
--

CREATE TABLE `t_user` (
  `id` int(255) NOT NULL,
  `phoneNum` char(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `historique_search` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_user`
--

INSERT INTO `t_user` (`id`, `phoneNum`, `password`, `nickname`, `historique_search`) VALUES
(1, '66', '1234', 'med', 'null'),
(2, '555', '1234', 'med2', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `encrypted_password` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `salt` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la vue `test`
--
DROP TABLE IF EXISTS `test`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `test`  AS  (select `restaurant`.`id` AS `id`,`restaurant`.`nom` AS `nom`,`restaurant`.`adresse` AS `adresse`,ifnull(round(avg(`restau_rating`.`note`),1),0) AS `rating`,`restaurant`.`delivery` AS `delivery`,count(distinct (select `restau_fav`.`id_user` from `restau_fav` where ((`restau_fav`.`id_restau` = `restaurant`.`id`) and (`restau_fav`.`id_user` = (select `t_user`.`id` from `t_user` where (`t_user`.`nickname` = 'med')))))) AS `favoris` from ((`restaurant` left join `restau_rating` on((`restau_rating`.`id_restau` = `restaurant`.`id`))) left join `repas` on((`repas`.`id_restau` = `restaurant`.`id`))) where (convert(`repas`.`nom` using utf8) like concat('%',(select `t_user`.`historique_search` from `t_user` where (`t_user`.`nickname` = 'med')),'%')) group by `restaurant`.`id`,`restaurant`.`nom`,`restaurant`.`adresse`,`restaurant`.`delivery`) ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cate_restau`
--
ALTER TABLE `cate_restau`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cate_restau1` (`id_cat`),
  ADD KEY `FK_cate_restau` (`id_restau`);

--
-- Index pour la table `extra`
--
ALTER TABLE `extra`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `repas`
--
ALTER TABLE `repas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_repas` (`id_restau`);

--
-- Index pour la table `repas_fav`
--
ALTER TABLE `repas_fav`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_repas_favr1` (`id_user`),
  ADD KEY `FK_repas_favr` (`id_repas`);

--
-- Index pour la table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `restau_cat`
--
ALTER TABLE `restau_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `k_rest` (`id_restau`),
  ADD KEY `k_cat` (`id_cat`);

--
-- Index pour la table `restau_fav`
--
ALTER TABLE `restau_fav`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_restau_fav` (`id_user`),
  ADD KEY `FK_restau_fav1` (`id_restau`);

--
-- Index pour la table `restau_rating`
--
ALTER TABLE `restau_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_restau_rating` (`id_user`),
  ADD KEY `FK_restau_rating1` (`id_restau`);

--
-- Index pour la table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cate_restau`
--
ALTER TABLE `cate_restau`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `extra`
--
ALTER TABLE `extra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `repas`
--
ALTER TABLE `repas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `repas_fav`
--
ALTER TABLE `repas_fav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `restau_cat`
--
ALTER TABLE `restau_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `restau_fav`
--
ALTER TABLE `restau_fav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pour la table `restau_rating`
--
ALTER TABLE `restau_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT pour la table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cate_restau`
--
ALTER TABLE `cate_restau`
  ADD CONSTRAINT `FK_cate_restau` FOREIGN KEY (`id_restau`) REFERENCES `restaurant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cate_restau1` FOREIGN KEY (`id_cat`) REFERENCES `categorie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `repas`
--
ALTER TABLE `repas`
  ADD CONSTRAINT `FK_repas` FOREIGN KEY (`id_restau`) REFERENCES `restaurant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `repas_fav`
--
ALTER TABLE `repas_fav`
  ADD CONSTRAINT `FK_repas_favr` FOREIGN KEY (`id_repas`) REFERENCES `repas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_repas_favr1` FOREIGN KEY (`id_user`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `restau_cat`
--
ALTER TABLE `restau_cat`
  ADD CONSTRAINT `k_cat` FOREIGN KEY (`id_cat`) REFERENCES `categorie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `k_rest` FOREIGN KEY (`id_restau`) REFERENCES `restaurant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `restau_fav`
--
ALTER TABLE `restau_fav`
  ADD CONSTRAINT `FK_restau_fav` FOREIGN KEY (`id_restau`) REFERENCES `restaurant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_user_fav` FOREIGN KEY (`id_user`) REFERENCES `t_user` (`id`);

--
-- Contraintes pour la table `restau_rating`
--
ALTER TABLE `restau_rating`
  ADD CONSTRAINT `FK_restau_rating` FOREIGN KEY (`id_user`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_restau_rating1` FOREIGN KEY (`id_restau`) REFERENCES `restaurant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
