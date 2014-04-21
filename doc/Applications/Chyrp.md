##Chyrp
An extra lightweight and extra awesome blogging engine

  * Roadmap: http://chyrp.net/about/roadmap
  * Git repository: https://github.com/chyrp/chyrp
  * Traductions: https://www.transifex.com/projects/p/chyrp/


**Insert screenshots here**

###Configuration Avancée
  * La manière la plus simple d'éditer la configuration du blog est de se rendre dans la zone **Admin** du blog.
  * Le fichier de configuration principal de chyrp est `/var/www/chyrp/includes/config.yaml.php`. Il contient les réglages tels que le nom du blog, les paramètres de la base de données, te thème, les modules actifs... Vous pouvez éventuellement éditer les réglages du blog depuis ce fichier.
  * Le logo affiché dans la barre latérale est le fichier `/var/www/chyrp/themes/firecrest/images/profile.jpg`. Vous pouvez remplacer ce fichier par un autre de votre choix, les dimensions de l'image doivent être 48x48 pixels.
  * Le texte situé dans la barre latérale est défini en langage HTML dans le fichier `/var/www/chyrp/themes/firecrest/content/sidebar.twig`. Vous pouves utiliszer le module **éditeur de thème** pour modifier ce fichier.
  * Le style (polices, couleurs...) du blog est défini en langage CSS dans le fichier `/var/www/chyrp/themes/firecrest/stylesheets/screen.css`.


###Alternatives
 * [Dotclear](http://dotclear.org/)
 * [Wordpress](https://wordpress.org/) - WordPress is web software you can use to create a beautiful website or blog.
  * [BuddyPress](http://buddypress.org/about/) - BuddyPress is a powerful plugin that takes your WordPress.org powered site beyond the blog with social-network features like user profiles, activity streams, user groups, and more.
 * [Blogotext](http://lehollandaisvolant.net/blogotext/fr/) - un moteur de blog privilégiant SQLite. Ceci vous offre une simplicité d’installation inégalée, couplée à d’excellentes performances.
 * [WeblogMatrix - Compare them all](http://www.weblogmatrix.org/)
 * [Ghost](http://ghost.org/) - Just a blogging platform
 * [twister | P2P microblogging platform](http://twister.net.co/)
 * [blosxom :: the zen of blogging ::](http://blosxom.sourceforge.net/) -  a lightweight yet feature-packed weblog application designed from the ground up with simplicity, usability, and interoperability in mind. 
 * [htmly](https://github.com/danpros/htmly) - Databaseless Blogging Platform (Flat-File Blog) ([Demo](http://www.htmly.com/demo/))