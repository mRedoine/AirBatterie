# AirBatterie
Un jeu d'Air Batterie développé en JAVA et avec PureData qui utilise les fonctionnalités de la caméra MicroSoft KINECT

Ce jeu est developpé en java avec [Processing](https://fr.wikipedia.org/wiki/Processing) et [PureData](https://fr.wikipedia.org/wiki/Pure_Data)<br>

<aside class="warning">
Ce programme ne fonctionne qu'avec la caméra KINECT
</aside>


Utilisation du patron architectural Modèle-Vue-Contrôleur :<br> 
la Classe Batterie1 joue le rôle de présentation, elle affiche ce que voit la caméra et crée un PointCloud pour la detection des interactions humaines avec les formes 2D (des cubes...).
La classe AccesCube contrôle les interactions précédemment citées, la classe EnvoiPD traite les messages au format [O.S.C](https://fr.wikipedia.org/wiki/Open_Sound_Control) et communique avec le logiciel PureData afin de créer les sons (Communication de 2 logiciels différents sur la bouble local :-) en référence à mon passé de Technicien Réseau).

