# Vlille widget pour montre Garmin

## Description
Widget permettant d'obtenir des informations en temps réel sur l'états des stations vlille (vélo libre service de la ville de lille). Le widget est configurable et permet d'ajouter 4 stations de son choix en entrant le nom et l'id de la station (id disponible sur le site officiel vlille ou sur la station). Le widget donne les places et les vélos disponibles en cliquant sur le bouton select.
Le widget est disponible sur le store Garmin Connect IQ

## Code
Dans le dossier Garmin, vous trouverez le code source pour la montre.
Dans le dossier serveur, vous trouverez le code qui convertit le xml en json - ce code n'est plus nécessaire depuis la version 1.1 du code présent dans le dossier Garmin. L'API officiel renvoie désormais du code json interpretable par le sdk Garmin. Le code serveur est laissé en exemple pour une conversion simple xml -> json en php.

