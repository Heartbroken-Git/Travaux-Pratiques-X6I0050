/*
	X6I0050 : TP2
	Corentin CHÉDOTAL - 601A
	Question 5 : Script SQL d'altération de table
*/

-- -- Requête créant la table Achats du TP1 et ses prérequis pour emploi dans le cadre du TP2
CREATE TABLE Clients (
	idcl NUMBER PRIMARY KEY,
	nom VARCHAR2(20),
	pren VARCHAR2(15),
	adr VARCHAR2(30),
	tel VARCHAR2(12)
);

CREATE TABLE Livres (
	refl VARCHAR2(10) PRIMARY KEY,
	titre VARCHAR2(20),
	auteur VARCHAR2(20),
	genre VARCHAR2(15)
);

CREATE TABLE Achats (
	idcl NUMBER REFERENCES Clients(idcl),
	refl VARCHAR2(10) REFERENCES Livres(refl),
	dateachat DATE,
	CONSTRAINT achats_key PRIMARY KEY (idcl, refl, dateachat),
	CONSTRAINT date_check CHECK (dateachat >= TO_DATE('01/01/2008', 'DD/MM/YYYY') AND dateachat <= TO_DATE('31/12/2013', 'DD/MM/YYYY'))
);

-- Requête altérant la table Achats afin de lui ajouter le prix
ALTER TABLE Achats ADD COLUMN prix NUMBER;
