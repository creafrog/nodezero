<!DOCTYPE html> 
<html lang="en"> 
<head> 
<title><?php echo $_SERVER['HTTP_HOST'] ; ?></title> 
<meta charset="utf-8"> 
<meta name = "viewport" content="width=device-width, maximum-scale=1"> <!-- Kills text zoom in iOS. Media Queries manage font sizes -->
<link rel="stylesheet" href="res/screen.css?v=2"> 
</head> 
<body> 

<!-- First box, server name -->
<div class="category">
<h2>
<?php
$dot_in_fqdn = "\.";
$replace_dot = ".<br/>";
$pretty_fqdn = preg_replace("/".$dot_in_fqdn."/", $replace_dot, $_SERVER['HTTP_HOST']);
print($pretty_fqdn);
?>
</h2>
</div> 


<!-- Box for shaarli -->
<?php 
$APP_SHAARLI_DIR = 'links';
$APP_SHAARLI_HTML = '<a href="/links" class="title" style="background-image:url(img/shaarli.png)"> 
<div class="app"> 
<h1>Liens</h1> 
<p>Liens | Marque-pages</p> 
</div> 
</a>';

if (is_dir($APP_SHAARLI_DIR)) {
	echo $APP_SHAARLI_HTML;
}
?>


<!-- Box for images gallery -->
<?php
$APP_IMAGES_DIR = 'images';
$APP_IMAGES_HTML = '<a href="/images" class="title" style="background-image:url(img/images.png)"> 
<div class="app"> 
<h1>Images</h1> 
<p>Images | Photos | Videos</p>
</div> 
</a>';

if (is_dir($APP_IMAGES_DIR)) {
	echo $APP_IMAGES_HTML;
}
?>


<!-- How this works
<body> is the wrapper
<a href=""> is your unit container, set the padding-bottom same as width to preserve the square
<div> positions a unit's content inside the square
<h3>Title</h3>
<p>Words</p>
<small>Small words</small>
</div>
</a>
Rinse and repeat
</body>
--> 


<!-- Box for owncloud -->
<?php
$APP_OWNCLOUD_DIR = 'owncloud';
$APP_OWNCLOUD_HTML = '<a href="/owncloud" class="title" style="background-image:url(img/owncloud.png)"> 
<div class="app"> 
<h1>Owncloud</h1> 
<p>Fichiers | Musique | Agenda</p> 
</div> 
</a>';

if (is_dir($APP_OWNCLOUD_DIR)) {
	echo $APP_OWNCLOUD_HTML;
}
?>


<!-- Box for transmission -->
<?php
$APP_TRANSMISSION_DIR = 'transmission';
$APP_TRANSMISSION_HTML = '<a href="/transmission" class="title" style="background-image:url(img/transmission.jpg)"> 
<div class="app"> 
<h1>Seedbox</h1> 
<p>Client Bittorrent Transmission</p> 
</div> 
</a> ';

if (is_dir($APP_TRANSMISSION_DIR)) {
	echo $APP_TRANSMISSION_HTML;
}
?>


<!-- Box for etherpad -->
<?php
$APP_ETHERPAD_DIR = 'etherpad';
$APP_ETHERPAD_HTML = '<a href="/etherpad" class="title" style="background-image:url(img/etherpad.png)"> 
<div class="app"> 
<h1>Etherpad</h1> 
<p>Editeur de texte collaboratif</p> 
</div> 
</a> ';

if (is_dir($APP_ETHERPAD_DIR)) {
	echo $APP_ETHERPAD_HTML;
}
?>

 
<!-- Box for dokuwiki -->
<?php
$APP_DOKUWIKI_DIR = 'dokuwiki';
$APP_DOKUWIKI_HTML = '<a href="/dokuwiki" class="title" style="background-image:url(img/dokuwiki.png)"> 
<div class="app"> 
<h1>Dokuwiki</h1> 
<p>Wiki</p> 
</div> 
</a>';

if (is_dir($APP_DOKUWIKI_DIR)) {
	echo $APP_DOKUWIKI_HTML;
}
?>


<!-- Box for tt-rss -->
<?php
$APP_TTRSS_DIR = 'tt-rss';
$APP_TTRSS_HTML = '<a href="/tt-rss" class="title" style="background-image:url(img/tt-rss.jpg)"> 
<div class="app">
<h1>Tiny Tiny RSS</h1>
<p>Lecteur de flux RSS</p>
</div>
</a>';

if (is_dir($APP_TTRSS_DIR)) {
	echo $APP_TTRSS_HTML;
}
?>

<?php
$APP_CONVERSE_DIR = 'converse';
$APP_CONVERSE_HTML = '<a href="/converse" class="title" style="background-image:url(img/converse.png)"> 
<div class="app">
<h1>Converse</h1>
<p>Messagerie instantanée</p>
</div>
</a>';

if (is_dir($APP_CONVERSE_DIR)) {
	echo $APP_CONVERSE_HTML;
}
?>


<!-- Box to switch to HTTPS -->
<a class="title" href="https://<?php echo $_SERVER['HTTP_HOST'] ?>" style="background-image:url(img/secure.png); background-color:#000">
<div class="app">
<h1>HTTPS</h1>
<p>Connection sécurisée au site</p>
</div>
</a>


<!-- Box for roundcube -->
<?php
$APP_WEBMAIL_DIR = 'mail';
$APP_WEBMAIL_HTML = '<a href="/mail" class="title" style="background-image:url(img/webmail.gif)"> 
<div class="app"> 
<h1>Webmail</h1> 
<p>Roundcube mail</p>
</div> 
</a>';

if (is_dir($APP_WEBMAIL_DIR)) {
	echo $APP_WEBMAIL_HTML;
}
?>


<!-- Box for alltube -->
<?php
$APP_ALLTUBE_DIR = 'alltube';
$APP_ALLTUBE_HTML = '<a href="/alltube" class="title" style="background-image:url(img/alltube.png)"> 
<div class="app"> 
<h1>Alltube</h1> 
<p>Download media from hosting sites</p>
</div> 
</a>';

if (is_dir($APP_ALLTUBE_DIR)) {
	echo $APP_ALLTUBE_HTML;
}
?>

<!-- Box for blog engine -->
<?php
$APP_BLOG_DIR = 'blog';
$APP_BLOG_HTML = '<a href="/blog" class="title" style="background-image:url(img/blog.png)"> 
<div class="app"> 
<h1>Chyrp</h1> 
<p>Blog</p>
</div> 
</a>';

if (is_dir($APP_BLOG_DIR)) {
	echo $APP_BLOG_HTML;
}
?>


<!--
<div class="category"> 
<h2>Outils</h2> 
</div> 
--> 

<!-- Box for Wallabag -->
<?php
$APP_WALLABAG_DIR = 'wallabag';
$APP_WALLABAG_HTML = '<a href="/wallabag" class="title" style="background-image:url(img/wallabag.gif)"> 
<div class="app"> 
<h1>Wallabag</h1> 
<p>Liste de lecture</p>
</div> 
</a>';

if (is_dir($APP_WALLABAG_DIR)) {
	echo $APP_WALLABAG_HTML;
}
?>



<!-- Box for Markdown-edit -->
<?php
$APP_MARKDOWNEDIT_DIR = 'markdown-edit';
$APP_MARKDOWNEDIT_HTML = '<a href="/markdown-edit" class="title" style="background-image:url(img/markdown-edit.png)"> 
<div class="app"> 
<h1>Markdown Edit</h1> 
<p>Editeur de texte Markdown</p>
</div> 
</a>';

if (is_dir($APP_MARKDOWNEDIT_DIR)) {
	echo $APP_MARKDOWNEDIT_HTML;
}
?>




<!-- Box for YOURLS url shortener -->
<?php
$APP_YOURLS_DIR = 'url';
$APP_YOURLS_HTML = '<a href="/url" class="title" style="background-image:url(img/yourls.jpg)"> 
<div class="app"> 
<h1>Yourls</h1> 
<p>Raccourcisseur d\'URLs</p>
</div> 
</a>';

if (is_dir($APP_YOURLS_DIR)) {
	echo $APP_YOURLS_HTML;
}
?>

<!-- Box for mapBBCodeShare -->
<?php
$APP_MAPS_DIR = 'maps';
$APP_MAPS_HTML = '<a href="/maps" class="title" style="background-image:url(img/maps.png)"> 
<div class="app"> 
<h1>Maps</h1> 
<p>Edition et partage de cartes</p>
</div> 
</a>';

if (is_dir($APP_MAPS_DIR)) {
	echo $APP_MAPS_HTML;
}
?>

<!-- Box for Bumpy-Booby -->
<?php
$APP_BUGS_DIR = 'bugs';
$APP_BUGS_HTML = '<a href="/bugs" class="title" style="background-image:url(img/bugs.png)"> 
<div class="app"> 
<h1>Bugs</h1> 
<p>Bug tracking system</p>
</div> 
</a>';

if (is_dir($APP_BUGS_DIR)) {
	echo $APP_BUGS_HTML;
}
?>


<!-- Box for Gitlist -->
<?php
$APP_GITLIST_DIR = 'gitlist';
$APP_GITLIST_HTML = '<a href="/gitlist" class="title" style="background-image:url(img/gitlist.jpg)"> 
<div class="app"> 
<h1>Gitlist</h1> 
<p>Browse git repositories</p>
</div> 
</a>';

if (is_dir($APP_GITLIST_DIR)) {
	echo $APP_GITLIST_HTML;
}
?>



<script src="scripts/css3-mediaqueries.js"></script>
</body> 
</html>
