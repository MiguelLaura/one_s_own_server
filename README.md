# one_s_own_server

Ce code a été réalisé dans le cadre d'une semaine d'activité animée par des membres de l'association Picasoft. Les objectifs de la semaine étaient :
* Savoir utiliser un serveur sous Linux
* Savoir installer et configurer un serveur web, un serveur PHP, un serveur PostgreSQL
* Savoir utiliser la technologie de conteneurisation Docker

On a 4 sites : (nom de domaine différent si on veut réutiliser le code)
* http://projet.rainbow.picagraine.net/ : le site principal avec sur la page d'accueil l'accès aux infos du serveur (statiquement et dynamiquement) et les objectifs de l'API, ainsi que les liens vers les autres sites ;
* http://commandes.rainbow.picagraine.net/ : liste des 10 commandes Linux les plus importantes ;
* http://conseils.rainbow.picagraine.net/ : 10 conseils à ceux qui souhaitent s'auto-héberger ;
* http://avantages.rainbow.picagraine.net/ : aspects positifs et négatifs de l'auto-hébergement en 10 points.

## Créer les réseaux Docker

À utiliser pour créer les réseaux Docker :
```bash
docker network create front backend backend1 backend2 backend3
```

## Charger les BDD

À utiliser la première fois pour charger les bdd :
```bash
pg_dump -U laura apirun > sql/backup.sql # Récupérer dump de la table sur le serveur si on a accès au serveur
mkdir bdd bdd/data1 bdd/data2 bdd/data3 # Créer les dossiers où seront mis les données des BDD
docker compose up -d    # Lancer les container
docker exec -t postgresql1 psql -d apirun -U laura -f /docker-entrypoint-initdb.d/init.sql # Charger pour le postgresql1
docker exec -t postgresql2 psql -d apirun -U laura -f /docker-entrypoint-initdb.d/init.sql # Charger pour le postgresql2
docker exec -t postgresql3 psql -d apirun -U laura -f /docker-entrypoint-initdb.d/init.sql # Charger pour le postgresql3
docker compose up -d    # Relancer avec les données chargées dans les bases
```
<b>ATTENTION</b> : le `docker compose up` ne fonctionne pas tout le temps. Il n'y a pas d'image custom.

## Recharger les BDD

Pour charger à nouveau les bases de données :
```bash
docker rm -vf $(docker ps -a -q)
sudo rm -r bdd/data1 bdd/data2 bdd/data3 # Effacer toutes les données des tables
mkdir bdd/data1 bdd/data2 bdd/data3
```
Et refaire les commandes juste au-dessus.
