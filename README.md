# certbot

Scripts for authorising Certbot via DNS.

These scripts are called by certbot to insert temporary DNS entries to allow certbot validation, and to clean up the created entries on completion. This is particularly useful for creating wildcard certs, as they can not be validated using normal webserver validation

Requirement: the script needs to run on the server running the named service. However, the cert can be copied to other servers after creation/renewal.

Example certbot command to create wildcert certificate on `example.com`:

    certbot certonly --manual --preferred-challenges=dns --manual-auth-hook /path/to/certbot-auth.sh --manual-cleanup-hook /path/to/certbot-cleanup.sh --email owner@example.com --agree-tos -d *.example.com -d example.com

Example certbot renewal command, which should normally run in cron:

    sudo certbot renew --manual-auth-hook /path/to/certbot-auth.sh --manual-cleanup-hook /path/to/certbot-cleanup.sh --post-hook "service nginx restart" --quiet
