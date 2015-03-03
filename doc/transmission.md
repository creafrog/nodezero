### Client Bittorrent / Seedbox Transmission

Transmission est un client pour le réseau [peer-to-peer](https://fr.wikipedia.org/wiki/Pair_%C3%A0_pair) [Bittorrent](https://fr.wikipedia.org/wiki/BitTorrent_%28protocole%29).



##### Accéder aux fichiers téléchargés

 * Par SFTP: Dans votre gestionnaire de fichiers, connectez vous à votre [serveur SFTP](openssh.md#Accès_aux_fichiers_par_SFTP) et rendez vous dans le répertoire de téléchargement de transmission (spécifié dans la configuration principale de nodezero)
 * Par Owncloud: Dans l'interface web d'Owncloud, rendez vous dans le menu `Apps`, activez l'application `External storage support` TODO, puis accédez à la section `Admin` dans le menu de droite. Dans la section `External Storage`, sélectionnez `Add storage` puis remplissez les informations: `Location` doit correspondre au répertoire de téléchargement de transmission (spécifié dans la configuration principale de nodezero).

_Note: Si vous ne parvenez pas à accéder aux fichiers, lancez la commande `Fix file permissions` depuis la console d'administration._