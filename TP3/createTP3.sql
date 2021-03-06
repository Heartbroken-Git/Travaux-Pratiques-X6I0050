/*
	X6I0050 : TP3
	Corentin CHÉDOTAL - 601A
	Question 2 : Script SQL de création des tables et des triggers
*/

SET SERVEROUTPUT ON

--Tables du TP1
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
	genre VARCHAR2(15),
	note_moy NUMBER
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

--Trigger mettant en place le calcul de la moyenne des notes reçues par le livre - Question 2
CREATE OR REPLACE TRIGGER L3_3Trig_avgNote_beforeInsert
AFTER INSERT OR UPDATE OR DELETE
	ON Avis
	FOR EACH ROW
	
DECLARE 
	moyNote Livres.note_moy%TYPE;
	c NUMBER;

BEGIN
	SELECT AVG(note) INTO moyNote
	FROM Avis
	WHERE refl = :new.refl;
	
	UPDATE Livres
	SET note_moy = moyNote
	WHERE refl = :new.refl;
	
END;
/

--Nouvelles tables requises en introduction du TP3
CREATE TABLE Parcours (
	idp VARCHAR2(10) PRIMARY KEY,
	intitulep VARCHAR2(15),
	genre VARCHAR2(15),
	date_deb DATE
);

CREATE TABLE Compo_Parcours (
	idp VARCHAR2(10) REFERENCES Parcours(idp),
	id_evt VARCHAR2(10),
	CONSTRAINT compo_parcours_key PRIMARY KEY (idp, id_evt)
);

CREATE TABLE Inscrip_parcours (
	idcl NUMBER REFERENCES Clients(idcl),
	idp VARCHAR2(10) REFERENCES Parcours(idp),
	CONSTRAINT inscrip_parcours_key PRIMARY KEY (idcl, idp)
);

CREATE TABLE Inscrip_evt (
	idcl NUMBER REFERENCES Clients(idcl),
	idp VARCHAR2(10) REFERENCES Parcours(idp),
	id_evt VARCHAR2(10),
	CONSTRAINT inscrip_evt_key PRIMARY KEY (idcl, idp, id_evt)
);

--Trigger vérifiant qu'un utilisateur à bien acheté un livre avant d'émettre un avis dessus - Question 3
CREATE OR REPLACE TRIGGER L3_3Trig_ownCheck_beforeInsert
BEFORE INSERT ON Avis
FOR EACH ROW

DECLARE
	nbDonneurAvis NUMBER;
	pas_achete_livre EXCEPTION;
BEGIN
	SELECT COUNT(idcl) INTO nbDonneurAvis
	FROM Achats
	WHERE refl = :new.refl AND idcl = :new.refl;
	
	IF (nbDonneurAvis = 0) THEN
		RAISE pas_achete_livre;
	END IF;
EXCEPTION
	WHEN pas_achete_livre THEN
		DBMS_OUTPUT.put_line('Impossible d''ajouter l''avis, avez-vous bien acheté le livre ?');	
END;
/

--Trigger proposant des parcours du même type que ceux liés au livre acheté - Question 6
CREATE OR REPLACE TRIGGER L3_3Trig_propParcours
AFTER INSERT ON Achats
FOR EACH ROW

DECLARE
	genreAchete Achats.refl%TYPE;
	display Parcours.intitulep%TYPE;
BEGIN
	SELECT genre INTO genreAchete
	FROM Livres
	WHERE refl = :new.refl;

	SELECT intitulep INTO display
	FROM Parcours
	WHERE genre = genreAchete AND date_deb >= sysdate;
	
	DBMS_OUTPUT.put(display);
END;
/ 
