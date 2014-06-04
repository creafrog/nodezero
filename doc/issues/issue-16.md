#16: Password policy
@nodiscc opened this issue 98 days ago.  [open] (1 comment)
[automation] [config] [security]

    - [ ] Enforce strong UNIX passwords. See PAM modules like passwdqc or cracklib, http://www.techrepublic.com/article/enforce-strong-passwords-with-pam-passwdqc/
    - [ ] SSH: keys only. Generate key pair during initial setup, add pubkey to  ~/.authorized_keys ; copy to client setup USB drive, delete keys form server.
    - [ ] Same password for: ssh key, main UNIX user account
    - [ ] Randomly generated root password (add to generated client README)
    - [ ] Randomly generated root mysql password (add to generated client README)
    - [ ] Same password for all webapps


1 comment:

@nodiscc commented 96 days ago:
    root mysql password should also be stored in  /root/.my.cnf 
    
    ```
    [client]
    password=root_pass_here
    ```


