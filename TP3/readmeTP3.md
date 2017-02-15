Cette archive contient les différents scripts SQL répondant au sujet du TP3 de l'unité d'enseignement X6I0050 "Bases de données 2" de l'Université de Nantes.

**Auteur : Corentin CHÉDOTAL - Groupe 601A**

Les requêtes SQL ont été séparées dans plusieurs fichiers SQL pour faciliter le débugging et la lisibilité des fichiers. Ceux-ci sont :
- **createTP3.sql** : Requêtes créant les tables et triggers répondant aux questions 2 et 3.
- **autocleanTP3.sql** : Requêtes générant et lançant des requêtes permettant la suppression du contenu et des tables en elle même.
- **blocMoy.sql** : Bloc PL/SQL calculant la moyenne d'un livre donné et donc répondant à la question 1 a).
- **blocMoyAll.sql** : Bloc PL/SQL calculant la moyenne de tous les livres et donc répondant à la question 1 b).
- **procMoy.sql** : Fichier SQL contenant la procédure générant la moyenne d'un livre donné en paramètre comme demandé question 1 c).
- **procAvis.sql** : Fichier SQL contenant la procédure répondant à la question 4 et permettant de vérifier qu'un client ne modifique que ses propres avis

## Réponses aux autres questions

2. Le trigger de la question 2 déclenche un message d'erreur du type `ORA-04091 : table ... is mutating`. C'est normal car on essaie d'agir sur une table dont la cohérence n'est plus garantie par le SGBD puisqu'elle est en cours de modification.
