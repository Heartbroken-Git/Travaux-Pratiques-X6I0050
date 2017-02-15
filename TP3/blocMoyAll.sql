/*
	X6I0050 : TP3
	Corentin CHÉDOTAL - 601A
	Question 1 b) : Script SQL de mise à jour des notes moyennes de tous les livres
*/

DECLARE
	CURSOR C_listeLivres IS SELECT refl FROM Livres;
	moyNote Livres.note_moy%TYPE;
	ligne C_listeLivres%rowtype;
BEGIN
	FOR ligne IN C_listeLivres LOOP
		SELECT AVG(note) INTO moyNote
		FROM Avis
		WHERE refl = ligne.refl;
	
		UPDATE Livres
		SET note_moy = moyNote
		WHERE refl = ligne.refl;
	END LOOP;
END;
/
