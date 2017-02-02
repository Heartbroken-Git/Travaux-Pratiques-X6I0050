/*
	X6I0050 : TP3
	Corentin CHÉDOTAL - 601A
	Script SQL de suppression automatique des tables
*/

-- Génération des requêtes de suppression des tables
SET ECHO OFF
SET FEEDBACK OFF
SET HEADING OFF
SET PAGESIZE 0
SPOOL effacer.sql

SELECT 'DROP TABLE ' || table_name || ' CASCADE CONSTRAINTS;' FROM USER_TABLES;

SPOOL OFF
--SET ECHO ON
SET FEEDBACK ON
SET HEADING ON
SET PAGESIZE 300

--Emploi du script généré pour supprimer les tables
@effacer.sql
