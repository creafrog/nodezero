    block_registrations_users = { "admin", "root", "xmpp" }
    block_registrations_patterns = {
        "master$" -- matches postmaster, hostmaster, webmaster, etc.
    }
    block_registrations_allow = "^[a-zA-Z0-9_-.]$" -- Allow only simple ASCII characters in usernames
