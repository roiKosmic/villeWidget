# Vlille widget pour montre Garmin

## Description
Widget permettant d'obtenir des informations en temps réel sur l'états des stations vlille (vélo libre service de la ville de lille). Le widget est configurable et permet d'ajouter 4 stations de son choix en entrant le nom et l'id de la station (id disponible sur le site officiel vlille ou sur la station). Le widget donne les places et les vélos disponible en cliquant sur le bouton select.

## Code
Dans le dossier Garmin, vous trouverez le code source pour la montre.
Dans le dossier serveur, vous trouverez le code qui convertit le xml en json. En effet l'api vlille renvoie un xml avec les informations suivantes:
* Vélo disponible (bikes)
* Emplacement libre (attach)
* Adresse de la borne

Le code php converti le xml en json car l'api Garmin ne peut récupérer que du JSON et ajoute un champ Id pour que le code retrouve la correspondance (retour asynchrone)

