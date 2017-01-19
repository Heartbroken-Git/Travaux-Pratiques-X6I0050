/*
	X6I0050 : TP2
	Corentin CHÉDOTAL - 601A
	Question 3 et 4 : Script SQL générant d'autres scripts SQL afin de faciliter la supression des tables et de leur contenu
*/

-- Génération des requêtes de suppression du contenu des tables pour la question 3
SPOOL effacer.sql
SET ECHO OFF
SET FEEDBACK OFF
SET HEADING OFF
SET PAGESIZE 0
SELECT 'DELETE FROM ' || table_name || ';' FROM USER_TABLES;
SPOOL OFF
SET ECHO ON
SET FEEDBACK ON
SET HEADING ON
SET PAGESIZE 300

-- Emploi du script généré pour supprimer le contenu des tables
@effacer.sql -- l'exécution de celui-ci nécessitera peut-être l'ajout dans les contraintes des tables de la notion ON DELETE CASCADE mais à éviter

-- Génération des requêtes de suppression des tables pour la question 4
SPOOL effacer.sql
SET ECHO OFF
SET FEEDBACK OFF
SET HEADING OFF
SET PAGESIZE 0
SELECT 'DROP TABLE ' || table_name || ' CASCADE CONSTRAINTS;' FROM USER_TABLES;
SPOOL OFF
SET ECHO ON
SET FEEDBACK ON
SET HEADING ON
SET PAGESIZE 300

--Emploi du script généré pour supprimer les tables
@effacer.sql
