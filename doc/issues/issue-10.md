#10: Backup policy
@nodiscc opened this issue 118 days ago.  [open] (3 comments)
[config]

    Apache documentroot:
     * keep 1 backup per week for the last 4 weeks
     * keep 1 backup per day for the last 3 days


3 comments:

@nodiscc commented 118 days ago:
    Same policy for mysql databases
    
     mysqldump -u root -p --all-databases > $BKPDIR/mysqldump-full- date +%Y-%m-%d_%Hh%M`
    
    See  ~/.my.cnf  for password storage


@nodiscc commented 118 days ago:
    Same policy for transmission-daemon running torrents


@nodiscc commented 4 days ago:
    https://packages.debian.org/sid/etckeeper could be useful


