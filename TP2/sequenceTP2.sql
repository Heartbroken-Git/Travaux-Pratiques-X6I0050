/*
	X6I0050 : TP2
	Corentin CHÉDOTAL - 601A
	Question 1 : Script SQL de création de séquence
*/

-- Requête créant la table Clients du TP1 pour emploi dans le cadre du TP2
CREATE TABLE Clients (
	idcl NUMBER PRIMARY KEY,
	nom VARCHAR2(20),
	pren VARCHAR2(15),
	adr VARCHAR2(30),
	tel VARCHAR2(12)
);

-- Requête supprimant une séquence qui existerai déja avec le nom keyClients_seq
DROP SEQUENCE keyClients_seq;

-- Requête créant une séquence pour utilisation en tant que clé de Clients
CREATE SEQUENCE keyClients_seq START WITH 0 INCREMENT BY 1 MINVALUE 0;

-- Requête d'insertion faisant usage de la séquence pour remplir la clé
INSERT INTO Clients VALUES (keyClients_seq.nextval, 'Fourras', 'Jean-Christophe', 'Tourelle, Fort Boyard', 'n/a');
