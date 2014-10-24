#NodeZero

Installation rapide et administration simplifiée de serveurs personnels (serveur auto-hébergé, _home server_), utilisant des alternatives [libres](https://fr.wikipedia.org/wiki/Logiciel_libre) aux services commerciaux/propriétaires sur Internet.

 * [A propos/pourquoi/qu'est ce que c'est?](doc/about.md)
 * [Bugs/Questions](https://telecom.dmz.se/bugs/nodezero/issues)
 * [Notes](doc/notes.md) - general server administration and maintenance
 * [Other tools](Othertools.md) - related/useful software

## Fonctionnalités
### Serveur Web
Le logiciel libre Apache est le [serveur HTTP](https://fr.wikipedia.org/wiki/Serveur_HTTP) (serveur Web) le plus populaire du World Wide Web. [En savoir plus...](doc/apache.md)


### Serveur de messagerie instantanée
Prosody IM est un serveur XMPP (serveur de messagerie instantanée) simple à utiliser. Il est conçu pour être facilement extensible à l'aide de greffons, et nécessite peu de ressources. [En savoir plus...](doc/prosody.md)


### Serveur SSH/partage de fichiers SFTP
SSH (_Secure Shell_) est un programme qui permet de se connecter à une machine distante et d'y exécuter des commandes (**contôle à distance**). Il fournit des  communications sécurisées et chiffrées. Il permet également de **partager des fichiers** (protocole _SFTP_) entre ordinateurs, d'utiliser les programmes du serveur sur votre écran local (_X forwarding_), et d'établir des **tunnels sécurisés** (par exemple pour utiliser le serveur distant comme _Proxy Web_). [En savoir plus...](doc/openssh.md)

![](doc/images/nodezero-sftp.png)

### Console d'administration
La console d'administration est un système de menus facilitant les tâches courantes sur le serveur. [En savoir plus...](doc/nodezero-admin.md)

 * Surveillance de l'état du serveur: Usage disque, usage des ressources (RAM, CPU, réseau...), programmes en cours, tentatives de connection, informations de sécurité.
 * Sauvegardes: sauvegarde des données du serveur, des bases de données, des fichiers des utilisateurs
 * Installation, mise à jour et suppression de logiciels, activation/désactivation et configuration des services
 * Gestion des comptes utilisateur, permissions d'accès, mots de passe, dépannage.
 * Nettoyage de fichiers temporaires, tâches d'entretien/maintenance, redémarrage/extinction...

### Client Bittorrent / Seedbox
Transmission est un client pour le réseau [peer-to-peer](https://fr.wikipedia.org/wiki/Pair_%C3%A0_pair) [Bittorrent](https://fr.wikipedia.org/wiki/BitTorrent_%28protocole%29). [En savoir plus...](doc/transmission.md)

![](images/screenshots/transmission-mobile.png)


### Serveur multimedia uPnP
MiniDLNA est un serveur multimedia. Il sert des fichiers multimedia (musique, images et video) à des appareils connectés à votre réseau. Le client peut être un logiciel (xbmc, vlc, [autres clients](https://en.wikipedia.org/wiki/List_of_UPnP_AV_media_servers_and_clients#UPnP_AV_clients)) ou un appareil (lecteur multimedia portable smartphone, télévision, media center). [En savoir plus...](doc/minidlna.md)


### Partage de fichiers Windows Samba
| 📖 |    Not yet implemented       |
|---------|---------|

File and printer sharing services for Windows machines.
Samba is the preferred solution for a file server in networks where different operating systems (other than Linux) coexist.
For example, multiple Microsoft Windows machines can access a Linux server where Samba is installed.

[Read more...](doc/samba.md)

### Serveur OpenVPN
| 📖 |    Not yet implemented       |
|---------|---------|

 * Alternative: [tinc](http://tinc-vpn.org/)
  * [Setup Tinc](http://www.allsundry.com/2011/04/10/tinc-better-than-openvpn/)

### Service de transfert de fichiers
| 📖 |    Not yet implemented       |
|---------|---------|

### Serveur Mail
| 📖 |    Not yet implemented       |
|---------|---------|

 * [Newsletters spam test by mail-tester.com](http://www.mail-tester.com/)