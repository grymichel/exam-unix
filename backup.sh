#!/bin/bash

#on se place dans notre dossier de sauvegarde
cd /backup/

#création d'une archive du dossier www
tar -cf backup.tar /var/www/

#dump de la base de données
mysqldump -u michel -p michel67 --all-databases   > /backup/sql/SQL.sql

#ajout des dump SQL dans l'archive
tar -rvf backup.tar /backup/sql/

#compression de l'archive
gzip backup.tar

#deplacement du fichier
mv backup.tar.gz /backup/
