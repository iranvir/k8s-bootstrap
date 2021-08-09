
#!/bin/sh
doctl compute droplet list --no-header | awk '{print $1}' | xargs -I vm doctl compute droplet delete vm --force
