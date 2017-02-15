/*
	X6I0050 : TP3
	Corentin CHÉDOTAL - 601A
	Question 4 : Procédure assurant que la modification d'un avis ce fait par le bon client et sur le bon livre
*/
CREATE OR REPLACE PROCEDURE L3_3_update_avis (refLivre IN Livres.refl%type, refClient IN Avis.idcl%TYPE) AS
	mauvais_avis EXCEPTION;
	nbAvis NUMBER;
	newNote Avis.note%TYPE;
	newCommentaire Avis.commentaire%TYPE;
BEGIN
	SELECT COUNT(idcl) INTO nbAvis
	FROM Avis
	WHERE idcl = refClient AND refl = refLivre;
	
	IF (nbAvis = 0) THEN
		RAISE mauvais_avis;
	END IF;
	
	newNote := '&input1';
	newCommentaire := '&input2';
	
	UPDATE Avis
	SET note = newNote, commentaire = newCommentaire
	WHERE idcl = refClient AND refl = refLivre;
EXCEPTION
	WHEN mauvais_avis THEN
		DBMS_OUTPUT.put_line('Problème lors de la modification de l''avis, celui-ci est inexistant.');
END L3_3_update_avis;
/
