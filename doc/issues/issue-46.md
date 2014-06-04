#46: Setup logcheck and logwatch
@nodiscc opened this issue 14 days ago.  [open] 
[enhancement] [security]

    http://www.bock.nu/blog/logcheck-logwatch
    http://askubuntu.com/questions/280944/what-automated-intrusion-notification-detection-setup-is-good-for-home-desktop-u

Daily cron job:
    LOGWATCH_OUT_FILE="${BACKUP_LOCAL_STORAGE}/UserToolkit/logwatch-report.txt"
    logwatch \
    -- service All \
    --range All \
    --archives \
    --filename=${LOGWATCH_OUT_FILE}
    echo "Logwatch report saved at $LOGWATCH_OUT_FILE."

 * Add an option to clear logs in the admin interface (with warning) - else logwatch will be picking the same warnings/errors foerver, even if they have been fixed.
