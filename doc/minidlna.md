### Serveur multimedia uPnP MiniDLNA

MiniDLNA est un serveur multimedia. Il sert des fichiers multimedia (musique, images et video) à des appareils connectés à votre réseau. Le client peut être un logiciel (xbmc, vlc, [autres clients](https://en.wikipedia.org/wiki/List_of_UPnP_AV_media_servers_and_clients#UPnP_AV_clients)) ou un appareil (lecteur multimedia portable smartphone, télévision, media center).

_Note: your media player may take some time to scan the media server if you have a lot of shared files_

_Note: If you add new files to your media directory, you will need to restart MiniDLNA to be able to see them. If you want MiniDLNA to rescan directories automatically, uncomment `inotify=yes` in the file `/etc/minidlna.conf` (this consumes more resources on your server)_

_Note: Pensez à éteindre ce service lorsque vous êtes sur un réseau local public (hôtel, hotspot...)_


#### Documentation

  [ReadyMedia - ArchWiki](https://wiki.archlinux.org/index.php/ReadyMedia)

#### Alternatives
 * [mediatomb](https://packages.debian.org/jessie/mediatomb)