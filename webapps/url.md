##YOURLS
YOURLS permet de faire fonctionner votre propre [Raccourcisseur d'URL](https://fr.wikipedia.org/wiki/R%C3%A9duction_d%27URL) (comme bit.ly, t.co, ur1.ca ou tinyURL).Ses fonctions incluent:

  * Service public (ouvert à tous) ou privé (protégé par mot de passe)
  * Possibilité de personnaliser vos URLs courtes
  * Bookmarklets pour ajouter rapidement des URLs
  * Statistiques pour chaque lien
  * Interface simple et efficace
  * API, plugins, support jsonp...

  * [Site Officiel](http://yourls.org/)
  * [Documentation](https://github.com/YOURLS/YOURLS/wiki)

![](_media/yourls-admin-dashboard.gif) ![](_media/yourls-all-websites.png) ![]( _media/yourls-stats-anim.gif)

### Notes
 * Si vous perdez votre mot de passe, vous pourrez le modifier via [SSH](SSH.md) en modifiant le fichier `/var/www/yourls/user/config.php`, et plus particulièrement la valeur `$yourls_user_passwords` comme ceci:
```
$yourls_user_passwords = array(
        'nomutilisateur' => 'mot_de_passe',
        );
```
 * Il n'existe pas de moyen de modifier le mot de passe depuis l'interface web.

### Alternatives

 * [Polr](https://github.com/Cydrobolt/polr) - A modern, minimalist, modular, and lightweight URL shortener - http://project.polr.me/
