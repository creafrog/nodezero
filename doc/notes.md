#Notes

<!-- MarkdownTOC depth=2 -->

- Matériel
	- Coupures de courant
	- Consommation électrique
	- Connection au réseau
	- Boîtier
- Autres applications
	- Applications Web
	- Outils divers

<!-- /MarkdownTOC -->




# Matériel

Les logiciels utilisés par nodezero peuvent fonctionner sur du matériel peu puissant/récupéré (processeur 1GHz, 512MB RAM)


## Coupures de courant
Si votre installation subit une coupure de courant, votre serveur s'éteint. Il sera donc indisponible pendant la coupure.

 * Si votre BIOS le supporte, activez l'option "Rallumer après une coupure de courant" dans le menu du BIOS.
 * Procurez vous un onduleur (UPS) qui alimentera le serveur pendant une coupure.
 * Gardez une copie des données du serveur sur vous si vous avez besoin d'y accéder en toutes circonstances


## Consommation électrique
 * Utiliser du matériel de recyclage peut coûter moins cher à l'acquisition, mais le vieux matériel a tendance à consommer plus de courant, et donc à faire monter la facture d'électricité. (`FIXME de quel ordre?`) Utilisez si possible du matériel récent à l'assemblage de votre serveur.
  * Si vous disposez déjà d'un ordinateur, vous pouvez l'utiliser comme serveur (pas d'augmentation de votre facture d'électricité). Si votre ordinateur ne fonctionne pas déjà sous [Debian GNU/Linux](https://www.debian.org/), il est possible de faire fonctionner le serveur dans une [machine virtuelle](https://fr.wikipedia.org/wiki/Machine_virtuelle) (voir [le foncitonnement de base de Virtualbox](http://www.commentcamarche.net/faq/9376-virtualbox-tester-des-os-comme-des-logiciels-tutoriel-kubunt))
 * Un [Raspberry Pi](https://fr.wikipedia.org/wiki/Raspberry_Pi) ne consomme en moyenne qu'1 à 2 watts et peut remplacer un serveur basé sur un PC.
 * Les alimentations de type [PicoPSU](http://www.silentpcreview.com/article601-page1.html) peuvent aider à réduire la consommation et le bruit du serveur.


## Connection au réseau
Préférez une connection filaire (câble Ethernet) si possible. Une connection Wifi est acceptable, mais veillez à la qualité de la réception.

## Boîtier
Si vous n'avez pas de boîtier, vous pouvez toujours vous en fabriquer un!

![](images/lowcostcase1.jpg)
![](images/lowcostcase2.jpg)
![](images/lowcostcase3.jpg)
![](images/lowcostcase4.jpg)
![](images/lowcostcase6.jpg)

_Source: http://burogu.makotoworkshop.org/index.php?post/2009/09/17/auto-heberger-4_

# Autres applications

## Applications Web
Les applications web suivantes ne sont pas installées par défaut mais peuvent se révéler utiles selon votre utilisation. Elles devraient êtres rapidement installables et utilisables:

### Services professionnels/commerciaux
 * [PHPCompta](http://www.phpcompta.be/) - logiciel libre de comptabilité en ligne
 * [Net Billetterie](http://net-billetterie.tuxfamily.org/) - Logiciel de gestion de salle de spectacle ou de saison culturelle.
 * [OsCOmmerce](http://oscommerce.com/) - Boutique en ligne ([Démo](http://demo.oscommerce.com/))
 * [Galette](http://galette.eu/dc/) - Galette is a membership management web application towards non profit organizations
 * [Zen-Cart](http://www.zencart-france.com/) - Boutique en ligne ([Démo](http://demo.zen-cart.cn/))
 * [GRR](http://grr.mutualibre.org/) - GRR est un système de Gestion et de Réservations de Ressources, adapaté à la gestion et la réservation de salles et de matériels.
 * [Casebox](http://www.casebox.org/) - Content management platform. Manage records, tasks, files.
 * [Airtime](http://www.sourcefabric.org/en/airtime/) - Free open source radio/webradio automation software
 * [Bootcamp](https://github.com/vitorfs/bootcamp) - An enterprise social network - http://trybootcamp.vitorfs.com
 * [Coinpunk](https://github.com/kyledrake/coinpunk) - Self-hosted Bitcoin wallet service web interface

### Moniteurs système (web)
 * [linux-dash](https://github.com/afaqurk/linux-dash) - A drop-in, low-overhead monitoring web dashboard for a linux machine ([Demo](http://afaq.dreamhosters.com/linux-dash/))
 * [pyDash](https://github.com/k3oni/pydash) - Small web-based monitoring dashboard for linux ([Demo](http://pydash.hostechs.com/main/) - _admin/admin_)

 
 
### Listes d'applications web
 * [Libre Projects](http://libreprojects.net/) - Les services web que vous trouverez sur cette page ont pour objectif principal la liberté d’usage et la collaboration
 * [Php - Logiciels libres - Framasoft](http://www.framasoft.net/mot57.html) - Une liste d'applis web en php
 * [PRISM Break](https://prism-break.org/#fr) - Refusez PRISM, le programme de surveillance globale des données de la NSA. Arrêtez de déclarer vos activités en ligne au gouvernement américain avec ces alternatives libres aux logiciels propriétaires


## Outils divers
Ces outils ne sont pas installés par défaut. Ils peuve néanmoins se révéler utiles dans certains cas d'utilisation.

 * [sslh](http://packages.debian.org/wheezy/sslh) - ssl/ssh multiplexer ([Site Officiel](http://www.rutschle.net/tech/sslh.shtml))
 * [obfsproxy](http://packages.debian.org/wheezy/obfsproxy) - pluggable transport proxy for Tor ([Site Officiel](https://www.torproject.org/projects/obfsproxy))
 * [aide](http://packages.debian.org/wheezy/aide) - Système de détection d'intrusion avancé - binaire statique ([Site Officiel](http://aide.sourceforge.net))
 * [pagekite](http://packages.debian.org/wheezy/pagekite) - Make localhost servers publicly visible. ([Site Officiel](https://pagekite.net/))

