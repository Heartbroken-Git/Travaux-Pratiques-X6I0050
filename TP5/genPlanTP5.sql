/*
	X6I0050 : TP3
	Corentin CHÉDOTAL - 601A
	Script SQL générant les plans d'éxécution pour les requêtes demandées
*/

-- Mise en place des paramètres d'affichage
SET ECHO OFF
SET FEEDBACK OFF
SET HEADING OFF
SET PAGESIZE 0

-- Génération du plan d'exécution de la requête R1
EXPLAIN PLAN FOR SELECT TITLE FROM publications WHERE NB_PAGES > 20;

-- Sauvegarde du plan d'exécution dans un fichier particulier
SPOOL planR1.log

SELECT * FROM table(dbms_xplan.display);

SPOOL OFF

-- Génération du plan d'exécution de la requête R2
EXPLAIN PLAN FOR SELECT TITLE FROM publications NATURAL JOIN facts WHERE DATE_ID = 2008;

-- Sauvegarde du plan d'exécution dans un fichier particulier
SPOOL planR2.log

SELECT * FROM table(dbms_xplan.display);

SPOOL OFF

-- Génération du plan d'exécution de la requête R3
EXPLAIN PLAN FOR SELECT TITLE FROM publications WHERE PUBLICATION_ID IN (
	SELECT PUBLICATION_ID FROM facts WHERE DATE_ID = 2008
);

-- Sauvegarde du plan d'exécution dans un fichier particulier
SPOOL planR3.log

SELECT * FROM table(dbms_xplan.display);

SPOOL OFF

-- Génération du plan d'exécution de la requête R4
EXPLAIN PLAN FOR SELECT TITLE FROM publications NATURAL JOIN facts NATURAL JOIN collaborations NATURAL JOIN authors WHERE LAST_NAME = 'Rosenthal';

-- Sauvegarde du plan d'exécution dans un fichier particulier
SPOOL planR4.log

SELECT * FROM table(dbms_xplan.display);

SPOOL OFF

-- Remise à zéro de l'affichage
SET FEEDBACK ON
SET HEADING ON
SET PAGESIZE 300
