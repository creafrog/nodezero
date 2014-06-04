#8: Automate tt-rss setup
@nodiscc opened this issue 120 days ago.  [open] (1 comment)
[automation]

     - [x] Write  $APACHE_DOCUMENTROOT/tt-rss/config.php 
     - [x] generate a random password for the  ttrss  MYSQL USERNAME, create the database/user with the  _NzCreatedb  function, replace the password in the  config.php  file with the random one we just generated.
     - [x] replace the fqdn in the config file with our actual server fqdn
     - [x] generate a 24-char random string to fill the  FEED_CRYPT_KEY  variable in the config file


1 comment:

@nodiscc commented 120 days ago:
     - automatically setup a new tt-rss user with predefined username/password
     - Set a stroooong password for the  admin  user (can not be totally disabled), store it in the user password store file.


⁕ referenced by @nodiscc through 26a80ba 43 days ago

⁕ referenced by @nodiscc through 015e347 16 days ago

