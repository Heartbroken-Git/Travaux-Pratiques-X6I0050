/*
	X6I0050 : TP3
	Corentin CHÉDOTAL - 601A
	Question 5 : Procédure PL/SQL réalisant l'inscription d'un client donné à un parcours lui aussi donné en paramètre
*/
CREATE OR REPLACE PROCEDURE L3_3_insert_clientParcours (clientToAdd IN Inscrip_parcours.idcl%TYPE, parcoursToAdd IN Inscrip_parcours.idp%TYPE) AS
	CURSOR C_evtToAdd IS SELECT id_evt FROM compo_parcours WHERE idp = parcoursToAdd;
	ligne C_evtToAdd%rowtype;
BEGIN
	
	INSERT INTO Inscrip_parcours VALUES (clientToAdd, parcoursToAdd);
	
	FOR ligne IN C_evtToAdd LOOP
		INSERT INTO Inscrip_evt VALUES (clientToAdd, parcoursToAdd, ligne.id_evt);
	END LOOP;
	
END L3_3_insert_clientParcours;
/
