SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `EVENEMENT` (
  `EVENEMENT_ID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `NOM_EVENEMENT` varchar(25) NOT NULL,
  `DATE_EVENEMENT` date NOT NULL,
  `EQUIPE_DOMICILE` varchar(25) NOT NULL,
  `EQUIPE_EXTERIEUR` varchar(25) NOT NULL,
  `COTE_DOMICILE` float NOT NULL,
  `COTE_EXTERIEUR` float NOT NULL,
  `CAT_SPORT` varchar(25) NOT NULL,
  `ACTIVE` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `PRONOSTIC` (
  `PRONOSTIC_ID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `PRONOSTIQUEUR_ID` int NOT NULL,
  `MATCH_PRONO` int NOT NULL,
  `COTE_PRONO` decimal(10,1) NOT NULL,
  `DATE_PRONO` date NOT NULL,
  `MISE` int DEFAULT '0',
  `STATUS` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `POST` (
  `POST_ID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `AUTEUR_ID` int NOT NULL,
  `AUTEUR_NOM` varchar(50) NOT NULL,
  `NOM_TOPIC` varchar(25) NOT NULL,
  `DESCRIPTION_POST` varchar(255) DEFAULT ' ',
  `NB_LIKE` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `UTILISATEUR` (
  `UTILISATEUR_ID` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `PSEUDO` varchar(50) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `MOT_DE_PASSE` varchar(150) NOT NULL,
  `POINT_ACTUEL` decimal(10,2) DEFAULT '0',
  `POINT_CLASSEMENT` int DEFAULT '0',
  `STATUS` int DEFAULT 0,
  `SCORE_JEU` int DEFAULT '0',
  `LAST_CONNECTION` DATE DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `ITEMS` (
  `ITEM_ID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `NOM_ITEM` varchar(25) NOT NULL,
  `TYPE` varchar(25) NOT NULL,
  `DESCRIPTION` varchar(256) NOT NULL,
  `PRIX` int NOT NULL,
  `COULEUR` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `INVENTAIRE` (
  `INVENTAIRE_ID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `UTILISATEUR_ID` int NOT NULL,
  `ITEM_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



ALTER TABLE PRONOSTIC ADD CONSTRAINT FK_PRONOSTIQUEUR_ID FOREIGN KEY (PRONOSTIQUEUR_ID) REFERENCES UTILISATEUR (UTILISATEUR_ID);
ALTER TABLE PRONOSTIC ADD CONSTRAINT FK_MATCH_PRONO FOREIGN KEY (MATCH_PRONO) REFERENCES EVENEMENT (EVENEMENT_ID);
ALTER TABLE POST ADD CONSTRAINT FK_AUTEUR_ID FOREIGN KEY (AUTEUR_ID) REFERENCES UTILISATEUR (UTILISATEUR_ID);
ALTER TABLE INVENTAIRE ADD CONSTRAINT FK_UTILISATEUR_ID FOREIGN KEY (UTILISATEUR_ID) REFERENCES UTILISATEUR (UTILISATEUR_ID);
ALTER TABLE INVENTAIRE ADD CONSTRAINT FK_ITEM_ID FOREIGN KEY (ITEM_ID) REFERENCES ITEMS (ITEM_ID);
ALTER TABLE INVENTAIRE ADD CONSTRAINT FK_USER_ID_INVENTAIRE FOREIGN KEY (UTILISATEUR_ID) REFERENCES UTILISATEUR (UTILISATEUR_ID);
/* user_id et item_id unique (peut acheter un même item une seule fois)*/
ALTER TABLE INVENTAIRE ADD UNIQUE (UTILISATEUR_ID, ITEM_ID);



INSERT INTO EVENEMENT (NOM_EVENEMENT, DATE_EVENEMENT, EQUIPE_DOMICILE, EQUIPE_EXTERIEUR, COTE_DOMICILE, COTE_EXTERIEUR, CAT_SPORT) VALUES ('LIGUE 1', '2023-11-21', 'PSG', 'OM', 1.3, 2.5, 'Football');
INSERT INTO EVENEMENT (NOM_EVENEMENT, DATE_EVENEMENT, EQUIPE_DOMICILE, EQUIPE_EXTERIEUR, COTE_DOMICILE, COTE_EXTERIEUR, CAT_SPORT) VALUES ('LIGUE 1', '2023-10-23', 'OL', 'ASSE', 1.8, 2.2, 'Football');
INSERT INTO EVENEMENT (NOM_EVENEMENT, DATE_EVENEMENT, EQUIPE_DOMICILE, EQUIPE_EXTERIEUR, COTE_DOMICILE, COTE_EXTERIEUR, CAT_SPORT) VALUES ('LIGA', '2023-12-21', 'BARCELONA', 'REAL MADRID', 1.80, 2, 'Football');
INSERT INTO EVENEMENT (NOM_EVENEMENT, DATE_EVENEMENT, EQUIPE_DOMICILE, EQUIPE_EXTERIEUR, COTE_DOMICILE, COTE_EXTERIEUR, CAT_SPORT) VALUES ('LIGA', '2023-12-21', 'ATLETICO MADRID', 'SEVILLE', 1.5, 2.5, 'Football');
INSERT INTO EVENEMENT (NOM_EVENEMENT, DATE_EVENEMENT, EQUIPE_DOMICILE, EQUIPE_EXTERIEUR, COTE_DOMICILE, COTE_EXTERIEUR, CAT_SPORT) VALUES ('PREMIER LEAGUE', '2023-11-21', 'MAN U', 'MAN C', 1.5, 2.5, 'Football');

INSERT INTO ITEMS (NOM_ITEM, TYPE, DESCRIPTION, PRIX, COULEUR) VALUES ('Chapeau', 'Chapeau', 'Chapeau de cowboy', 100, 'Marron');
INSERT INTO ITEMS (NOM_ITEM, TYPE, DESCRIPTION, PRIX, COULEUR) VALUES ('T-shirt', 'Chapeau', 'T-shirt de cowboy', 100, 'Noir');
INSERT INTO ITEMS (NOM_ITEM, TYPE, DESCRIPTION, PRIX, COULEUR) VALUES ('Pantalon', 'Chapeau', 'Pantalon de cowboy', 100, 'Blanc');
INSERT INTO ITEMS (NOM_ITEM, TYPE, DESCRIPTION, PRIX, COULEUR) VALUES ('Chaussures', 'Chapeau', 'Chaussures de cowboy', 100, 'Rouge');
INSERT INTO ITEMS (NOM_ITEM, TYPE, DESCRIPTION, PRIX, COULEUR) VALUES ('Montres', 'Chapeau', 'Montres de cowboy', 100, 'Bleu');
INSERT INTO ITEMS (NOM_ITEM, TYPE, DESCRIPTION, PRIX, COULEUR) VALUES ('Sac', 'Chapeau', 'Sac de cowboy', 100, 'Vert');

INSERT INTO `UTILISATEUR` (`UTILISATEUR_ID`, `PSEUDO`, `EMAIL`, `MOT_DE_PASSE`, `POINT_ACTUEL`, `POINT_CLASSEMENT`, `STATUS`, `SCORE_JEU`,`LAST_CONNECTION`) VALUES (1, 'admin', 'admin@admin.fr', '$2y$10$Oz1T4KvH6JaDhLg/iKWu5eVt/eEgH17srKnvYPhsJ9vU3z6AjpoFi', 10000,10000, 0, 0,NULL );


INSERT INTO `UTILISATEUR` (`PSEUDO`, `EMAIL`, `MOT_DE_PASSE`, `POINT_ACTUEL`, `POINT_CLASSEMENT`, `STATUS`, `SCORE_JEU`,`LAST_CONNECTION`)
VALUES ('RamazanLaChienneDu69', 'RamazanLaChienneDu69@example.com', '$2y$10$Oz1T4KvH6JaDhLg/iKWu5eVt/eEgH17srKnvYPhsJ9vU3z6AjpoFi', 100, 0, 1, 0,NULL);

-- Utilisateur 2
INSERT INTO `UTILISATEUR` (`PSEUDO`, `EMAIL`, `MOT_DE_PASSE`, `POINT_ACTUEL`, `POINT_CLASSEMENT`, `STATUS`, `SCORE_JEU`,`LAST_CONNECTION`)
VALUES ('Keap', 'Keap@example.com', '$2y$10$Oz1T4KvH6JaDhLg/iKWu5eVt/eEgH17srKnvYPhsJ9vU3z6AjpoFi', 100, 0, 1, 0,NULL);

-- Utilisateur 3
INSERT INTO `UTILISATEUR` (`PSEUDO`, `EMAIL`, `MOT_DE_PASSE`, `POINT_ACTUEL`, `POINT_CLASSEMENT`, `STATUS`, `SCORE_JEU`,`LAST_CONNECTION`)
VALUES ('RafikLaTrikDu69', 'RafikLaTrikDu69@example.com', '$2y$10$Oz1T4KvH6JaDhLg/iKWu5eVt/eEgH17srKnvYPhsJ9vU3z6AjpoFi', 100, 0, 1, 0,NULL);

INSERT INTO `POST` (`POST_ID`, `AUTEUR_ID`, `AUTEUR_NOM`, `NOM_TOPIC`, `DESCRIPTION_POST`, `NB_LIKE`) VALUES (1, 1, 'admin','Topic 1', 'Le jeune joueur du FC Barcelone Ansu Fati actuellement preter a Brighton est sur le point d''etre transfere definitivement ezffezfdzefezfzefzefzefzef z feezf zef zef zef zef zef zefze fzef zefze fzefze', 0);
INSERT INTO `POST` (`POST_ID`, `AUTEUR_ID`, `AUTEUR_NOM`, `NOM_TOPIC`, `DESCRIPTION_POST`, `NB_LIKE`) VALUES (2, 1, 'admin', 'Topic 2', 'Le jeune joueur du Real Madrid Arda Guler actuellement preter a Besiktas est sur le point d''etre transfere definitivement ezffezfdzefezfzefzefzefzef z feezf zef zef zef zef zef zefze fzef zefze fzefze', 0);
INSERT INTO `POST` (`POST_ID`, `AUTEUR_ID`, `AUTEUR_NOM`, `NOM_TOPIC`, `DESCRIPTION_POST`, `NB_LIKE`) VALUES (3, 1, 'admin', 'Topic 3', 'Le jeune joueur de L''atletico Madrid Joao Felix actuellement preter a Barcelone est sur le point d''etre transfere definitivement ezffezfdzefezfzefzefzefzef z feezf zef zef zef zef zef zefze fzef zefze fzefze', 0);
INSERT INTO `POST` (`POST_ID`, `AUTEUR_ID`, `AUTEUR_NOM`, `NOM_TOPIC`, `DESCRIPTION_POST`, `NB_LIKE`) VALUES (4, 1, 'admin', 'Topic 4', 'Le jeune joueur du PSG Xavi Simons actuellement preter au PSV est sur le point d''etre transfere definitivement ezffezfdzefezfzefzefzefzef z feezf zef zef zef zef zef zefze fzef zefze fzefze', 0);
