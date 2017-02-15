/*
	X6I0050 : TP3
	Corentin CHÉDOTAL - 601A
	Question 5 : Bloc PL/SQL réalisant l'inscription d'un client donné à un parcours lui aussi donné en entrée
*/

DECLARE
	clientToAdd Inscrip_parcours.idcl%TYPE;
	parcoursToAdd Inscrip_parcours.idp%TYPE;
	CURSOR C_evtToAdd IS SELECT id_evt FROM compo_parcours WHERE idp = parcoursToAdd;
	ligne C_evtToAdd%rowtype;
BEGIN
	clientToAdd := '&input1';
	parcoursToAdd := '&input2';
	
	INSERT INTO Inscrip_parcours VALUES (clientToAdd, parcoursToAdd);
	
	FOR ligne IN C_evtToAdd LOOP
		INSERT INTO Inscrip_evt VALUES (clientToAdd, parcoursToAdd, ligne.id_evt);
	END LOOP;
	
END;
/
