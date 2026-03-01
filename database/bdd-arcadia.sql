-- ================================
-- Création Base de donnée
-- ================================
-- Database: arcadia
DROP DATABASE IF EXISTS u948299591_bdarcadia;
CREATE DATABASE arcadia CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE u948299591_bdarcadia;


-- ================================
-- Création utilisateur admin
-- ================================
-- Admin
CREATE USER 'adminArcadia'@'localhost' IDENTIFIED BY '123soleil';
GRANT ALL PRIVILEGES ON *.* TO 'adminArcadia'@'localhost';


-- ================================
-- Création des tables
-- ================================
-- Utilisateurs secondaires
CREATE TABLE groupeArcadia (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(100),
  password VARCHAR(255),
  role ENUM('admin', 'employe', 'veterinaire')
);
 
CREATE TABLE users(
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR (100),
  email VARCHAR(100)
);

CREATE TABLE animaux(
  id INT AUTO_INCREMENT PRIMARY KEY,
  surnom VARCHAR (100),
  race VARCHAR (100),
  habitat VARCHAR (100),
  sante VARCHAR (100),
  food VARCHAR (100),
  grammes VARCHAR (100),
  date_veto DATE   
);

CREATE TABLE avis(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nom_prenom_si_vous_plait VARCHAR (100),
  commentaire TEXT /*ou TINYTEXT qui sera limité a 255 caractères*/
);

CREATE TABLE horaires_ouverture (
  id INT AUTO_INCREMENT PRIMARY KEY,
  jour_semaine ENUM('lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi', 'samedi', 'dimanche'),
  heure_ouverture TIME,  
  heure_fermeture TIME   

-- Si besoin :)
-- SELECT * FROM horaires_ouverture WHERE jour_semaine = 'mardi';
/* UPDATE horaires_ouverture
SET heure_ouverture = '10:00:00', heure_fermeture = '18:00:00'
WHERE jour_semaine = 'lundi'; */
);

CREATE TABLE services(
  id INT AUTO_INCREMENT PRIMARY KEY,
  prestation VARCHAR (100),
  description_prestation TEXT
);

CREATE TABLE habitat(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nom_habitat VARCHAR (100),
  description_habitat TEXT,
  race_habitant VARCHAR (100),
  taille VARCHAR (100)
);

-- ================================
-- Insertion
-- ================================
-- Utilisateurs avec leurs roles
INSERT INTO groupeArcadia (email, password, role)
VALUES ('RayDefesse@hotmail.fr', '$2y$10$xyz456', 'admin'),
('LarryBambelle@hotmail.fr', '$2y$10$abc123', 'veterinaire'),
('Julie@hotmail.fr', '$2y$10$def789', 'employe'),
('Lucas@hotmail.fr', '$2y$10$ghi123', 'employe'),
('Emma@hotmail.fr', '$2y$10$jkl456', 'employe'),
('Leo@hotmail.fr', '$2y$10$mno789', 'employe');

INSERT INTO users(username, email)
VALUES ("Larry-Bambelle", "LarryBambelle@hotmail.fr"),
("Ray-Defesse", "RayDefesse@hotmail.fr");

INSERT INTO animaux(surnom, race, habitat, sante, food, grammes, date_veto)
VALUES ("Mike Tyson", "kangourou", "tyson", "la pech ", "chien des visiteur ", "sa depend du chie ", "2024-12-2 "),
("hedwige", "chouette", "jurassic park", "DCD dans le 6eme film", "pop corn des visiteurs", "π+3.5²7", "2024-12-24"),
("nabilla", "chevre", "auberge du shampoing",  "bipolaire ", "botox", "0.0001", "2000-01-01");

INSERT INTO avis(nom_prenom_si_vous_plait, commentaire)
VALUES ("Jean Meurtdesoif","Les petite bouteille d'eau sont hors de prix"),
("Jerry Kan","toujours bien s'hydrater !");

INSERT INTO horaires_ouverture(jour_semaine, heure_ouverture, heure_fermeture)
VALUES ("lundi", "08:00:00", "21:00:00"),
("mardi", "08:00:00", "21:00:00"),
("mercredi", "08:00:00", "21:00:00"),
("jeudi", "08:00:00", "21:00:00"),
("vendredi", "08:00:00", "21:00:00"),
("samedi", "08:00:00", "21:00:00"),
("dimanche", NULL, NULL);  -- Fermé le dimanche

INSERT INTO services(prestation,description_prestation)
VALUES ("Restauration","Nous vous proposons de restaurants aux 2 extrémités du parc avec des repas végan qui sont au menu. Venez vous reposer dans une ambiance de chalet."),
("Visite habitat","La visite des habitats se fait du mardi au jeudi de 14h00 à 16h00.Vous serez guidé par nos meilleurs guides qui vous expliquerons le fonctionnement du parc ainsi que les animaux que vous verrez."),
("Visite en train","Pour faire une visite complète du parc, il vous suffira simplement de vous présenter 1 h à l'avance pret de l'enclos des ours. Chaque wagon peut accueillir jusqu'à 6 personnes.");

INSERT INTO habitat (nom_habitat, description_habitat, race_habitant, taille)
VALUES ("Tyson","L'enclos Tyson accueil nos amies boxeurs les Kangourou. Nous leurs avont mis a disposition une salle de musculation ainsi qu'une cage de MMA. Eviter de vous en approcher !", "kangourou", "Environ 5000m2 avec des plantes, racines et feuilles commestibles pour les animaux."),
("Vertige","L'enclos Vertige accueil les girafes.", "girafe", "Environ 20000m2 avec des plantes, racines et feuilles commestibles pour les animaux.");
