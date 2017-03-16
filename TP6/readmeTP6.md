Cette archive contient les différents scripts SQL et réponses au sujet du TP6 de l'unité d'enseignement X6I0050 "Bases de données 2" de l'Université de Nantes.

**Auteur : Corentin CHÉDOTAL - Groupe 601A**

Les requêtes SQL ont été séparées dans plusieurs fichiers SQL pour faciliter le débugging et la lisibilité des fichiers. Ceux-ci sont :

*TODO*

## Réponses aux autres questions

1. Est mis en évidence le problème de mise à jour car tant que *session 2* ne "commit" pas *session 1* ne voit pas les modifications.
2. La transaction n'étant pas `SERIALIZABLE` puisque par défaut elle est en `READ COMMITED` des verrous sont posés sur la table avec laquelle la transaction de *session 1* interagit, empêchant *session 2* de faire ses DELETE.
3. Les verrous sont posés lors de requêtes d'écriture. Ici dans ce cas particulier l'une des deux requêtes est abandonnée quand Oracle détecte l'interblocage, ceci afin de permettre de réaliser un COMMIT pour débloquer la situation.
4. La clause `SELECT FOR UPDATE` permet de verrouiller en avance une table pour faire des modifications dessus ultérieurement.
5. Le passage de la transaction en `READ ONLY` ne permet pas la mise à jour de la table locale tant que l'Utilisateur n'a pas fait un commit même si *session 2* a pu modifier la table
6. Le verrouillage en share mode permet de passer en mode "chacun son tour", chaque utilisateur devant attendre que le précédent ait fini sa transaction en cours. ~~Le mode exclusif par contre ~~
7. 
