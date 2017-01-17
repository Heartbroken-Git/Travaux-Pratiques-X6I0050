/*
	X6I0050 : TP1
	Corentin CHÉDOTAL - 601A
	Question 2 : Script SQL d'affichage du contenu des tables
*/

-- Q2.1
SELECT DISTINCT refl, titre, auteur, genre
FROM Livres
WHERE refl IN (
	SELECT refl
	FROM Achats
	GROUP BY refl HAVING COUNT(refl) >= 1
);

-- Q2.2
SELECT DISTINCT refl, titre, auteur, genre
FROM Livres
WHERE refl IN (
	SELECT refl
	FROM Avis
	GROUP BY refl HAVING AVG(note) >= 16
);

-- Q2.3
SELECT nom, pren, titre, note
FROM Clients RIGHT JOIN Avis NATURAL JOIN Livres ON Clients.idcl = Avis.idcl
WHERE commentaire IS NULL;
