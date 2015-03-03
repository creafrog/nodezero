##Dokuwiki
DokuWiki est un moteur de wiki libre sous licence GNU GPL conforme aux standards, simple à utiliser, dont le but principal est de créer des documentations de toute sorte. Il a une syntaxe simple qui assure la lisibilité des fichiers de données en dehors du Wiki, et facilite la création de textes structurés. Toutes les données sont stockées dans des fichiers texte, et donc aucune base de données n’est nécessaire.

  * [Site officiel](http://www.splitbrain.org/projects/dokuwiki)
  * [Dokuwiki: trucs & astuces](Dokuwiki.md)


![](_media/dokuwiki-mobile.png)

###Plugins Installés
  * Editx https://www.dokuwiki.org/plugin:editx
  * Upgrade https://www.dokuwiki.org/plugin:upgrade
  * External Link https://www.dokuwiki.org/plugin:externallink
  * Note https://www.dokuwiki.org/plugin:note
  * Baselink https://www.dokuwiki.org/plugin:baselink
  * Add New Page https://www.dokuwiki.org/plugin:titlesanchorlink
  * Index Menu: http://dokuwiki.org/plugin:indexmenu
  * Markdown Extra https://www.dokuwiki.org/plugin:markdownextra
  * Namespace Pages http://www.dokuwiki.org/plugin:nspages
  * Orphans Wanted https://www.dokuwiki.org/plugin:orphanswanted
  * Orphan Media https://www.dokuwiki.org/plugin:orphanmedia
  * Text Export/Render https://www.dokuwiki.org/plugin:text
  * Title Anchor Links https://www.dokuwiki.org/plugin:titlesanchorlink
  * Include https://www.dokuwiki.org/plugin:include
  * Gallery https://www.dokuwiki.org/plugin:gallery


###Plugins intéressants
  * Discussion https://www.dokuwiki.org/plugin:discussion
  * SchulzeVote https://www.dokuwiki.org/plugin:schulzevote
  * Log Auth Error https://www.dokuwiki.org/plugin:logautherror
  * Vote https://www.dokuwiki.org/plugin:vote
  * DW2PDF https://www.dokuwiki.org/plugin:dw2pdf
  * Page Redirect https://www.dokuwiki.org/plugin:pageredirect
  * Wrap https://www.dokuwiki.org/plugin:wrap
  * OpenLayersMap https://www.dokuwiki.org/plugin:openlayersmap
  * Lightbox v2 https://www.dokuwiki.org/plugin:lightboxv2
  * Flattr https://www.dokuwiki.org/plugin:flattr
  * Vshare http://www.dokuwiki.org/plugin:vshare
  * Search Text https://www.dokuwiki.org/plugin:searchtext
    * Text Export/Render https://www.dokuwiki.org/plugin:text (requis)
  * AuthOwncloud https://www.dokuwiki.org/plugin:authowncloud
  * Bookcreator https://www.dokuwiki.org/plugin:bookcreator
  * Bookmarkme https://www.dokuwiki.org/plugin:bookmarkme
  * Dokubookmark https://www.dokuwiki.org/plugin:dokubookmark
  * Cloud https://www.dokuwiki.org/plugin:cloud
  * OSM https://www.dokuwiki.org/plugin:osm
  * MozShot https://www.dokuwiki.org/plugin:mozshot
  * Divalign2 https://www.dokuwiki.org/plugin:divalign2
  * Mnml-blog template https://andreashaerter.com/projects/dokuwiki-template-mnml-blog


###Alternatives

  * [MdWiki](https://dynalon.github.io/mdwiki/#!index.md) - a Markdown CMS/Wiki completely built in HTML5/Javascript and runs 100% on the client
  * [Olelo/Gitwiki](https://github.com/minad/olelo) - ([Demo](http://www.gitwiki.org/)) - Olelo is a wiki that stores pages in a Git repository, supports many markup styles and has an extensible, hackable architecture! Features: Edit, move or delete pages; Page attribute editor; Support for hierarchical wikis (directory structure); File upload; History, commit and diff view; Locales (Czech, English, French, German); Support for many markup languages (Creole, Markdown, Textile, ...); RSS/Atom changelog for whole wiki or pages; Section editing for Creole; Embedded LaTeX formulas; Syntax highlighting; Image resizing, SVG to PNG/JPEG conversion; Auto-generated table of contents; Previews; View pages as S5 presentation; Privacy features: Access control lists, Private wiki, Read-only wiki.
  * [Gitit](https://github.com/jgm/gitit) - A wiki program that stores pages and uploaded files in a git repository, which can then be modified using the VCS command line tools or the wiki's web interface. Supported markups include pandoc's extended version of markdown, reStructuredText, LaTeX, and HTML. Pages can be exported in a number of different formats, including LaTeX, RTF, OpenOffice ODT, and MediaWiki markup. Other features include: plugins, syntax highlighting, caching, ATOM feeds...
  * [Mediawiki](https://www.mediawiki.org/wiki/MediaWiki)
  * [Wikimatrix - Compare wikis](http://www.wikimatrix.org/)
  * [Blazekiss](https://github.com/ldleman/blazekiss) - BlazeKiss est un wiki basé sur le principe Kiss : Keep It Simple Stupid, c'est à dire la simplicité et la fonctionnalité avant tout
  * [WiKiss](http://wikiss.tuxfamily.org/) - un wiki simple à utiliser et déployer.
  * [TiddlyWiki](http://tiddlywiki.com/) - a reusable non-linear personal web notebook
  * [Redaxscript • Ultra lightweight website engine](http://redaxscript.com/)
  * [Docstore](http://haldean.org/) - A basic site for hosting static documents - [Source on Github](https://github.com/haldean/docstore) - docstore is a simple way to serve Markdown files without any server-side processing, and without requiring you (as the author) to recompile every time you change an article. It consists of a very simple JS script that makes an ajax request to your server, runs a Markdown processor on what it finds, and then displays the results. Clone the repository and add articles in the text/ directory to get started.
  * [markdown-tree](https://github.com/mil/markdown-tree) - serve a hierarchy / tree directory of markdown files. Use intended for small sites built in markdown
  * [commonplace](https://github.com/fredoliveira/commonplace) - A server for your markdown files. Give it a directory, and Commonplace gives you a url, pretty pages, and quick editing.
  * [Realms](https://github.com/scragg0x/realms-wiki) - a git-backed wiki inspired by Gollum
  * [Gruik](https://github.com/grena/gruik) - Gruik ! An open-source markdown note-taking web app - http://gruik.io/
 




### Trucs & Astuces
#### Pages et médias orphelins/manquants
Pour détecter les pages et les médias orphelins (vers lesquels aucun lien ne pointe)
our manquants (un lien pointe vers une page/média qui n'existe pas), activez
les plugins `orphanswanted` et `orphanmedia`, et insérez ce code dans une page:


```
~~NOCACHE~~
==== Orphan Medias ====
~~ORPHANMEDIA:orphan~~

==== Missing Medias ====
~~ORPHANMEDIA:missing~~


==== Orphan Pages ====
~~ORPHANSWANTED:orphans~~ 

==== Wanted pages ====
~~ORPHANSWANTED:wanted~~ 
```

Puis accédez à la page.

####Créer une galerie avec les images dans le dossier
Si vous êtes par exemple à la page ''documentation:start'' de votre wiki, vous pouvez créer une galerie aui affichera toutes les images contenues dans le dossier (aussi appellé *namespace*) ''documentation:''. Entrez simplement le code:

    {{gallery> ?modsort&recursive&direct&lightbox&nocache&0&crop&~12&reverse }}%%''

quelque part dans la page. Il est possible de modifier les paramètres de la galerie (nombre d'images, taille, pagination, ordre...). Voir la documentation sur https://www.dokuwiki.org/plugin:gallery


#### Storing Dokuwiki pages in a git repo
FIXME: explain my own method

Alternative: use https://www.dokuwiki.org/plugin:gitbacked
