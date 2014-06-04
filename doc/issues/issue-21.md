#21: Menu item to revoke current certificate, and generate a new one
@nodiscc opened this issue 56 days ago.  [open] (2 comments)
[security]

    Generation is easy `sudo make-ssl-cert generate-default-snakeoil --force-overwrite`


2 comments:

@nodiscc commented 47 days ago:
    Problem:   make-ssl-cert generate-default-snakeoil  uses the  make-ssl-cert generate-default-snakeoil  template, which uses the  @HostName@  variable. If the system's  $HOSTNAME  differs from the FQDN, the cert's  CommonName  will be 
    wrong
    
    Solution:  export HOSTNAME="$FQDN"; sudo make-ssl-cert generate-default-snakeoil --force-overwrite 
    
    Alternative: properly update  /etc/hostname  after editing the config file


⁕ referenced by @nodiscc through 36a0f34 43 days ago

@nodiscc commented 43 days ago:
    Self-signed certificate, no need to revoke


⁕ referenced by @nodiscc through 3ab5086 43 days ago

