## nz-webapps
Web applications repository for [nodezero](https://github.com/nodiscc/nodezero)

This directory contains information about web applications available for nodezero. Open the application page to read more about each one, including features, usage tips, and demos.

<!-- begin applications list -->

 * [Gitlist](gitlist.md) - A web-based git repository browser
 * [Dokuwiki](wiki.md) - Wiki simple et complet
 * [Bumpy Booby](bumpy-booby.md) - A simple, responsive and highly customizable PHP bug tracking system.
 * [Shaarli](links.md) - Partage/sauvegarde de liens et de marque pages.
 * [FluxBB](forum.md) - Fast and light web forum
 * [OranjeProxy](proxy.md) - Proxy Web
 * [Wallabag](wallabag.md) - Sauvegarde d'articles à lire plus tard
 * [MapBBcode](maps.md) - Consultation de cartes géographiques, placement, sauvegarde et partage de repères, trajets et notes sur des cartes.
 * [Stikked](paste.md) - An open source PHP pastebin
 * [Mindmaps](mindmaps.md) - An open source, offline capable, mind mapping application
 * [Minigal Nano](images.md) - Partage public d'images, vidéos, fichiers multimédia
 * [YOURLS](url.md) - Raccourcisseur d'URLs
 * [AllTube](alltube.md) - Téléchargement de fichiers multimedia depuis + de 100 sites
 * [Pairjam](pairjam.md) - Real-time web-based collaborative coding
 * [Chyrp](blog.md) - An extra lightweight and extra awesome blogging engine
 * [Filetea](transfer.md) - Transfert de fichier anonyme/temporaire en un clic.
 * [Sonerezh Music Player](music.md) - A self-hosted, web-based application for stream your music, everywhere.
 * [Owncloud](owncloud.md) - Hébergement/partage/synchronisation de fichiers, calendriers, carnets d'adresses, édition de documents
 * [OpenSondage](sondage.md) - Création de sondages/évènements
 * [Tiny Tiny RSS](tt-rss.md) - Lecteur de flux RSS/ATOM


<!-- end applications list -->


#### usage

nz-webapps.ini contains the version/git tag at which the web apps should be.

TODO This repo should be pulled from upstream regularly on the server running nodezero.
When the webapp upgrade check runs, it check whether the local install in apache's documentroot is at an older commit than the latest tag listed here.
If so, it sets the web app status to `upgradeable`.
Tags in nz-webapps.ini have to be manually updated with `git describe --tags $(git rev-list --tags --max-count=1)` in each submodule (which should return the latest tag across all branches).

TODO: makefile to generate the list automatically: `for file in $(find ./ -iname README.md -prune -o -name '*.md' -print); do title=$(head --quiet -n1 $file | sed -e 's/^#*\s*//g'); descr=$(sed -n 2p $file); echo " * [$title]($(basename $file)) - $descr"; done | clipboard`

TODO: move this to the doc directory