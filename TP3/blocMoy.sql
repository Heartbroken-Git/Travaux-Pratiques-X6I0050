/*
	X6I0050 : TP3
	Corentin CHÉDOTAL - 601A
	Question 1 a) : Script SQL de mise à jour de la note moyenne d'un livre donné en paramètre
*/

DECLARE
	paramIn Livres.refl%type;
	moyNote Livres.note_moy%TYPE;
BEGIN
	paramIn := '&input1';

	SELECT AVG(note) INTO moyNote
	FROM Avis
	WHERE refl = paramIn;
	
	UPDATE Livres
	SET note_moy = moyNote
	WHERE refl = paramIn;
END;
/
