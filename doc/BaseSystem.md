#Système de base

##Console d'administration
La console d'administration est disponible en se connectant via SSH à votre serveur et en lancant la commande `nodezero-admin`. Elle permet d'effectuer diverss tâches:
 * Monitoring/surveillance de l'état du serveur: Usage disque, usage des ressources (RAM, CPU, réseau, _uptime_), processus en cours, tentatives de connection, vérifications de sécurité.
 * Administration: permissions d'accès aux dossiers/fichiers, mises à jour de logiciels, nettoyage de fichiers temporaires, visualisation/copie/suppression de fichiers, redémarrage/extinction...
 * Sauvegardes: sauvegarde des données du serveur, bases de données, fichiers utilisateur
 * Gestion des services: activation/désactivation de services, utilisateurs du serveur de messagerie instantanée, dépannage, modification de mots de passe

###Voir aussi
 * [linux-dash](https://github.com/afaqurk/linux-dash) - A drop-in, low-overhead monitoring web dashboard for a linux machine ([Demo](http://afaq.dreamhosters.com/linux-dash/))
 * [pyDash](https://github.com/k3oni/pydash) - Small web-based monitoring dashboard for linux ([Demo](http://pydash.hostechs.com/main/) - _admin/admin_)

##Serveur Web Apache
Le logiciel libre Apache HTTP Server (Apache) est un [serveur HTTP](https://fr.wikipedia.org/wiki/Serveur_HTTP) (serveur Web) créé et maintenu au sein de la fondation Apache. C'est le serveur HTTP le plus populaire du World Wide Web.


###Alternatives
  * [nginx](http://packages.debian.org/wheezy/nginx) - small, powerful, scalable web/proxy server
  * [lighttpd](http://packages.debian.org/wheezy/lighttpd) - fast webserver with minimal memory footprint
  * [markdown-tree](https://github.com/mil/markdown-tree) - serve a hierarchy / tree directory of markdown files. Use intended for small sites built in markdown
  * [commonplace](https://github.com/fredoliveira/commonplace) - A server for your markdown files. Give it a directory, and Commonplace gives you a url, pretty pages, and quick editing.

##Serveur Jabber/XMPP Prosody
Prosody IM est un serveur XMPP (serveur de messagerie instantanée) simple à utiliser. Il est conçu pour être facilement extensible à l'aide de greffons, et nécessite peu de ressources.

  * [Prosody - ArchWiki](https://wiki.archlinux.org/index.php/Prosody)


##Serveur OpenSSH
SSH (_Secure Shell_) est un programme qui permet de se connecter à une machine distante et d'y exécuter des commandes. Il fournit des  communications sécurisées et chiffrées entre deux hôtes à travers un réseau non sécurisé. Il permet également de partager des fichiers (protocole _SFTP_) entre ordinateurs, d'afficher des programmes à distance sur votre ordinateur local (_X forwarding_), et d'établir des tunnels sécurisés (par exemple pour utiliser le serveur distant comme _Proxy Web_), 

 * [Explication détaillée de l'authentification par clé SSH (en)](https://we.riseup.net/debian/ssh-key-authentication)

_L'administration à distance (ou sur place) se fait à travers une interface simple disponible via SSH. Il vous faudra donc un accès shell à votre serveur - l'utilisation d'un serveur hébergé chez vous est donc recommandée. Un VPS peut aussi faire l'affaire. _

##Client Bittorrent Transmission
Transmission est un client pour le réseau [peer-to-peer](https://fr.wikipedia.org/wiki/Pair_%C3%A0_pair) [Bittorrent](https://fr.wikipedia.org/wiki/BitTorrent_%28protocole%29). 

![](images/screenshots/transmission-mobile.png)


##Serveur multimedia uPnP miniDLNA
MiniDLNA est un serveur multimedia. Il sert des fichiers multimedia (musique, images et video) à des appareils connectés à votre réseau. Le client peut être un logiciel (xbmc, vlc, [autres clients](https://en.wikipedia.org/wiki/List_of_UPnP_AV_media_servers_and_clients#UPnP_AV_clients)) ou un appareil (lecteur multimedia portable smartphone, télévision, media center)


##Serveur Mail
| 📖 |    Brouillon       |
|---------|---------|

 * [Newsletters spam test by mail-tester.com](http://www.mail-tester.com/)