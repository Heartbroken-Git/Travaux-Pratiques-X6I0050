/*
	X6I0050 : TP3
	Corentin CHÉDOTAL - 601A
	Question 1 c) : Procédure PL/SQL de mise à jour de la moyenne d'un livre donné en paramètre
*/

CREATE OR REPLACE PROCEDURE L3_3_update_moyNote (refLivre IN Livres.refl%type) AS
DECLARE
	moyNote Livres.note_moy%TYPE;
BEGIN
	SELECT AVG(note) INTO moyNote
	FROM Avis
	WHERE refl = refLivre;
	
	UPDATE Livres
	SET note_moy = moyNote
	WHERE refl = refLivre;
END;
/
