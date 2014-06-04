#29: Initial setup script
@nodiscc opened this issue 47 days ago.  [open] (7 comments)
[automation] [bug]

    ## SSH keys
    
     * ~~generate a keypair~~
     * copy it on a newly inserted USB drive
     * ~~add it to ~/.ssh/authorized_keys~~
     * clear it from the local server


7 comments:

⁕ referenced by @nodiscc through 36a0f34 43 days ago

⁕ referenced by @nodiscc through 3ab5086 43 days ago

@nodiscc commented 43 days ago:
    Generate password with pwgen, add it to MYSQL_PASS field, write it to  ~/.my.cnf  like
    
        [client]
        password=$MYSQL_PASS
    
    preseed password befor installing the  mysql-server-package . See http://www.rndguy.ca/2010/02/24/fully-automated-ubuntu-server-setups-using-preseed/


@nodiscc commented 43 days ago:
    ~~Do not let dpkg overwrite conffiles installed by the install script  Dpkg::Options::="--force-confold" ~~


@nodiscc commented 43 days ago:
    Editing the config file is basically just setting the FQDN and the freedns update key. Do not open nano for this, just ask with readline (with confirmation)


⁕ referenced by @nodiscc through 6b7f7d6 43 days ago

⁕ referenced by @nodiscc through 0d72037 43 days ago

⁕ referenced by @nodiscc through 19859fb 43 days ago

⁕ referenced by @nodiscc through 6cae71d 42 days ago

⁕ referenced by @nodiscc through e043ab9 42 days ago

⁕ referenced by @nodiscc through ab7ad96 42 days ago

⁕ referenced by @nodiscc through 4acd11b 42 days ago

⁕ referenced by @nodiscc through d952c62 42 days ago

⁕ referenced by @nodiscc through ca2638a 42 days ago

@nodiscc commented 42 days ago:
     *  mysql_secure_installation  asks for a password and breaks the unattended instll process, see      http://bugs.mysql.com/bug.php?id=53796 for a workaround
     *  ssh-keygen  also asks for the key's passphrase in the middle of the process. Ask for the key + confirmation at beginning, pass it to `ssh-keygen -N`


@nodiscc commented 42 days ago:
     * Store SSH keys, MySQL password in a temporary dir in the user's home directory.
     * Have the user export them to a removable drive.
     * Remove the temporary dir


@nodiscc commented 42 days ago:
    ### Before starting the install
    
     * Have the sign up for https://freedns.afraid.org
     * Have the user register a subdomain at https://freedns.afraid.org/domain/registry/
     * Point the user to https://freedns.afraid.org/dynamic/, click on the  Direct URL  link, copy the URL part after `?` in the address bar, write it down on a piece of paper or somewhere else.
     * Enter it when asked at install time.


@nodiscc commented 42 days ago:
    Ask the user if we should set up a new XMPP account.


⁕ referenced by @nodiscc through 3224f5d 42 days ago

