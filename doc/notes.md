#Notes

## Matériel
Le système fonctionnera sur du matériel peu puissant/récupéré (processeur 1GHz, 512MB RAM)


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

_Attention: Si vous utilisez une connection via un réseau sans fil, pensez à utiliser le mode de chiffrement WPA2 et une phrase de passe solide pour ce réseau. Une connection via WEP n'offre quasiment **aucune sécurité**_

## Boîtier
Si vous n'avez pas de boîtier, vous pouvez toujours vous en fabriquer un!

![](images/lowcostcase1.jpg)
![](images/lowcostcase2.jpg)
![](images/lowcostcase3.jpg)
![](images/lowcostcase4.jpg)
![](images/lowcostcase6.jpg)

_Source: http://burogu.makotoworkshop.org/index.php?post/2009/09/17/auto-heberger-4_


## Autres Applications Web

### Social networks
Currently, no support for a self-hosted "social networking" service is planned. You can achieve a social-network like experience using the provided applications. If you need to install a decentralized/open social networking platform, take a look at the following projects:


 * [Disapora](https://diasporafoundation.org/) - a privacy aware, distributed, open source social network ([Source](firendica ))
 * [Friendica](http://friendica.com/) - ([Source](https://github.com/friendica/friendica))
 * [Red](http://redmatrix.me/) - complete decentralised publishing, sharing, and communications system ([Source](https://github.com/friendica/red))
 * [Gnu Social](http://gnu.io/social/) - social communication software for both public and private communications
 * [Pump.io](http://pump.io/) - stream server that does most of what people really want from a social network ([SOurce](https://github.com/e14n/pump.io))
 * [twister](http://twister.net.co/) -  P2P microblogging platform
 
### CMS (content management systems)
CMS are a practical way to setup a website with many features. CMS often come with third party plugins, themes and functionality that is easy to add and customize to your needs. Currently, adding a CMS is not planned. You can achieve CMS-like results with a wiki, a blog, ... If you need a CMS for a particular purpose, have a look at the projects below:

  * [Wordpress](https://wordpress.org/) - WordPress is web software you can use to create a beautiful website or blog.
  * [Pico](http://pico.dev7studios.com/index.html#) - A stupidly simple, blazing fast, flat file CMS. ([Sources on Github](https://github.com/gilbitron/Pico))
  * [99ko CMS](https://github.com/99ko-project/99ko-cms) - 99ko est un CMS permettant de créer un site web en quelques minutes et sans connaissances particulières en programmation. Il fonctionne sans base de données et utilise de simples fichiers texte (format JSON) pour stocker vos données.
  * [SPIP](http://www.spip.net/fr) - SPIP est un Système de Publication pour l’Internet.
  * [Movable Type](https://movabletype.org/)
  * [Drupal](https://drupal.org/) - open source content management platform
  * [Joomal!](http://www.joomla.fr/) - un système de gestion de contenu (CMS)
  * [CMS Made Simple](http://www.cmsmadesimple.org/) - open source content management system, faster and easier management of website contents, scalable for small businesses to large corporations.
  * [GetSimple CMS](http://get-simple.info/) - The Simplest Content Management System. Ever.
  * [Bolt](http://bolt.cm/) - Sophisticated, lightweight & simple CMS ([Github repository](https://github.com/bolt/bolt))
  * [Concrete 5 CMS](http://www.concrete5.org/)
    
##### Static site generators
Static site generators provide an alternative to complex CMS. They are easier to setup and maintain, often prviding less features. Choose wisely in the lists below:

* [Static Site Generators](http://staticsitegenerators.net/) - The definitive listing of Static Site Generators 
* [Staticgen](http://staticgen.com/) - Dynamic list of top-trending static site generators

##### See also
 * [15 Excellent Content Management System Alternatives To WordPress | Vegi Bit](http://vegibit.com/15-excellent-content-management-system-alternatives-to-wordpress/)
