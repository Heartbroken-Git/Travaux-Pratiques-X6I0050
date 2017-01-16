/*
	X6I0050 : TP1
	Corentin CHÉDOTAL - 601A
	Question 1 : Script SQL d'insertion sur les tables
*/

INSERT INTO Clients VALUES (1, 'Le Gob', 'Bob', '14 Rue du Panda Mou, Montcuq', '0525987414');
INSERT INTO Livres VALUES ('SQLNULTAY', 'Le SQL pour les Nuls', 'Allen G. Taylor', 'Education');
INSERT INTO Achats VALUES (1, 'SQLNULTAY', TO_DATE('14/11/2011', 'DD/MM/YYYY'));
INSERT INTO Avis VALUES (1, 'SQLNULTAY', 5, 'lol g pa tou kompri');

