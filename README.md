# Application de Connexion Flutter + API Node.js

  

## Description

Ce projet est une application Flutter simple qui propose une page de connexion et un écran de profil.  

La connexion est gérée par une API REST développée en Node.js. Les mots de passe sont hachés avec SHA-256 côté client avant d'être envoyés au serveur.



## Fonctionnalités

- Authentification des utilisateurs via une API REST.

- Hachage des mots de passe avec SHA-256 pour renforcer la sécurité.

- Affichage des erreurs spécifiques (par exemple : "Utilisateur non trouvé", "Mot de passe incorrect").

- Profil utilisateur accessible après connexion.


## Prérequis

- Flutter SDK installé sur votre machine.

- Node.js et npm installés.

- Simulateur Android ou iOS, ou un appareil réel.

  

## Installation


### Étape 1 : Cloner les dépôts

#### API

Clonez le dépôt de l'API :
url : https://github.com/SebGaillard1/simple_api_for_flutter.git

```bash
git clone https://github.com/SebGaillard1/simple_api_for_flutter.git
cd api
npm install
```
#### Application Flutter

Clonez le dépôt de l'application Flutter :
url : https://github.com/SebGaillard1/login_app_with_api.git

```
git clone https://github.com/SebGaillard1/login_app_with_api.git 
cd flutter_app 
flutter pub get
```

### Étape 2 : Lancer les serveurs

#### Lancer l'API

Dans le dossier de l'API, exécutez :

```node index.js```

L'API sera accessible sur `http://localhost:3000` ou `http://10.0.2.2:3000` depuis un simulateur Android.

#### Lancer l'application Flutter

Dans le dossier de l'application Flutter, lancez :

```flutter run```

### Étape 3 : Tester l'application

Utilisez l'un des comptes suivants pour vous connecter :

- **Utilisateur standard**
    
    - Email : `flutter@example.com`
    - Mot de passe : `userpass`

- **Administrateur**
    
    - Email : `admin@example.com`
    - Mot de passe : `adminpass`

### Points importants

- Sur simulateur Android, utilisez l'adresse `http://10.0.2.2:3000` pour accéder à l'API locale.
