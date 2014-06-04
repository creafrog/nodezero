#34: Default firewall rules
@nodiscc opened this issue 42 days ago.  [open] (1 comment)
[bug] [config]

     * Allow XMPP traffic (5222/tcp and 5269/tcp)
     * Allow HTTP/HTTPS traffic (80/tcp and 443/txp)
     * Allow SSH traffic (822/tcp)
     * Allow mumble traffic
     * Allow bittorrent traffic
     * More?


1 comment:

@nodiscc commented 31 days ago:
    Edit  /lib/ufw/user.rules 
    
    Example:
    
        ### tuple ### allow tcp 5269 0.0.0.0/0 any 0.0.0.0/0 in
        -A ufw-user-input -p tcp --dport 5269 -j ACCEPT


