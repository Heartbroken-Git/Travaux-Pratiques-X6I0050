Cette archive contient les différents scripts SQL répondant au sujet du TP2 de l'unité d'enseignement X6I0050 "Bases de données 2" de l'Université de Nantes.

**Auteur : Corentin CHÉDOTAL - Groupe 601A**

Les requêtes SQL ont été séparées dans plusieurs fichiers SQL pour faciliter le débugging et la lisibilité des fichiers. Ceux-ci sont :
- **sequenceTP2.sql** : Requêtes créant et utilisant les séquences tel que demandé à la question 1.
- **cleanTP2.sql** : Requêtes générant et lançant des requêtes permettant la suppression du contenu et des tables en elle même pour répondre aux question 3 et 4.
- **effacer.sql** : Fichier temporaire utilisés pour contenir les requêtes générées par le fichier **cleanTP2.sql**.
- **alterTP2.sql** : Requêtes altérant la table Achats afin de répondre à la question 5.
- **printTP2.sql** : Requêtes produisant le rapport de log demandé dans la question 6.

## Réponses aux autres questions

2. La requête de la question 2 permet d'afficher les requêtes SQL *DELETE FROM* que l'on peut réaliser sur les tables actuellement présentes.
