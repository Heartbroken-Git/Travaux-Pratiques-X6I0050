/*
	X6I0050 : TP1
	Corentin CHÉDOTAL - 601A
	Question 1 : Script SQL de création des tables
*/

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

CREATE TABLE Avis (
	idcl NUMBER REFERENCES Clients(idcl),
	refl VARCHAR2(10) REFERENCES Livres(refl),
	note NUMBER(4, 2),
	commentaire VARCHAR2(50),
	CONSTRAINT avis_key PRIMARY KEY (idcl, refl),
	CONSTRAINT note_check CHECK (note >= 0 AND note <= 20)
);
/*
	Concernant la table Avis, il apparaitrait logique de s'assurer qu'un client ne puisse poster un avis que pour un livre qu'il aurait effectivement acheté.
	Pour se faire il faudrait relier la table Avis à la table achat en la référençant. Cependant ceci nécessiterait probablement la modification de Achats en lui ajoutant un identifiant.
	On ne respecterait alors plus le schéma donné dans le sujet donc la modification n'a pas été faite
*/
