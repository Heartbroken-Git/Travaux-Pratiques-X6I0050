Cette archive contient les différents scripts SQL et réponses au sujet du TP5 de l'unité d'enseignement X6I0050 "Bases de données 2" de l'Université de Nantes.

**Auteur : Corentin CHÉDOTAL - Groupe 601A**

Les requêtes SQL ont été séparées dans plusieurs fichiers SQL pour faciliter le débugging et la lisibilité des fichiers. Ceux-ci sont :

*TODO*

## Réponses aux autres questions

### Prise en main de la table

1. Pour chaque table on cherche les clés primaires, étrangères et les jointures
  - Pour la table *facts* :
    - PUBLICATION_ID, SQUAD_ID, DATE_ID et SUPPORT_ID semblent être les clé primaires
    - PUBLICATION_ID, SQUAD_ID, DATE_ID et SUPPORT_ID sont des clés étrangères
    - La table semblent être une relation entre les tables *publications*, *squads*, *dates* et *supports* et donc doit pouvoir faire des jointures avec chacunes de celles-ci
  - Pour la table *authors* :
    - AUTHOR_ID semble être la clé primaire
    - Il ne semble pas y avoir de clés étrangères
    - La table n'a pas au premier abord de jointure particulière
  - Pour la table *collaborations* :
  	- SQUAD_ID et AUTHOR_ID semblent être les clés primaires
  	- SQUAD_ID et AUTHOR_ID sont des clés étrangères
  	- La table est une relation entre les tables *authors* et *squads* et donc doit faire des jointures avec celles-ci
  - Pour la table *dates* :
  	- DATE_ID doit être la clé primaire
  	- Il n'y a pas de clés étrangères dans cette table
  	- La table ne semble pas faire l'objet de jointure particulière
  - Pour la table *publications* :
  	- PUBLICATION_ID est probablement la clé primaire
  	- Il ne semble pas y avoir de clés étrangères
  	- La table ne doit pas avoir de jointure particulière
  - Pour la table *squads* :
  	- La table n'étant composée que d'un attribut (SQUAD_ID) celui-ci est la clé primaire
  	- Il ne doit pas y avoir de clés étrangères
  	- La table ne semble pas faire l'objet de jointure particulière
  - Pour la table *supports* :
  	- La clé primaire est probablement SUPPORT_ID
  	- Il ne semble pas y avoir de clés étrangères
  	- La table ne semble pas faire partie de jointures

2. Chaque table contient le nombre de lignes suivant :
  - Table *facts* : 473176 lignes
  - Table *authors* : 454807 lignes
  - Table *collaborations* : 1212896 lignes
  - Table *dates* : 407 lignes
  - Table *publications* : 481659 lignes
  - Table *squads* : 479540 lignes
  - Table *supports* : 11243 lignes
  
### Visualisation du plan d'exécution d'une requête

1. On constate à la lecture des fichiers log que le plan d'exécution choisi par le SGBD est le même pour R2 et R3
2. L'ajout d'un index augmente très clairement la vitesse d'exécution de la requête 1 mais ralentit la requête 4
3. *optionnel*
