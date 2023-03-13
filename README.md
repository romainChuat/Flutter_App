# Bes'App

Bes'App est une application mobile crée par 3 étudiants Bisontins en 3ème année de Licence Informatique à l'UFR ST.
Cette application permet aux utilisateurs de donner leur avis sur des lieux qu'ils ont visités dans la ville de Besançon (25).
Ils peuvent poster des photos, écrire des avis ou encore répondre à des questionnaires.
Les avis et photos pourront être vus, après validation par un administrateur, par les autres utilisateurs.
Les utilisateurs ont la possibilité de créer un compte ou de naviguer de manière anonyme, mais avec des fonctionnalités en moins.

## Installation

Pour rendre l'application fonctionelle localement, il faut utiliser le script "nom_du_script", présent dans le même dossier, dans un logiciel de gestion de base de données PostGreSQL tel que PgAdmin.
Il sera nécessaire de modifier les identifiants de connexion à cette base dans la bibliothèque de fonctions "mylib.dart", le nom de votre base de données, le serveur que vous utilisez, l'identifiant de connexion ainsi que le mot de passe. Concernant le serveur utilisé, généralement, on utilise "localhost" mais avec un émulateur de smartphone il est nécessaire d'utiliser "10.0.2.2" pour pouvoir se connecter.
Si vous souhaitez créer un compte administrateur, il faudra créer un compte utilisateur classique avec les identifiants souhaités, puis dans la base de données, modifier la colonne "admin" de votre utilisateur. Cette colonne est du type booléen, mis à "false" par défaut, il sera nécessaire de changer sa valeur en "true".

## Prise en main

Cette application est utilisable sur un navigateur internet, un émulateur de smartphone ou encore sur un vrai téléphone utilisant le système d'exploitation Android.
Pour les deux premières options, il suffit dans un éditeur de texte tel que VSCode de sélectionner la plateforme choisie, puis dans un terminal du dossier "Flutter_App/lib" lancer la commande "flutter run".
Concernant la dernière option, il est nécessaire de transférer l'apk de l'application sur le smartphone voulu. Puis de l'installer.
Bes'App sera alors prête à être utiliser.

## Crédits

Cette application à été réalisée dans le cadre de l'UE "Projet Tutoré" de Licence 3 Informatique à l'UFR ST de Besançon.
Les étudiants, Katty Berthod, Romain Chuat et Antonin Rothé, ont travaillés sous le tutorat de Mr Florian Litot.

## Licence

Bes'App est disponible sous la licence GNU. 