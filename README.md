# dnsimple-dyndns-arm
DNSimple  Dynamic DNS updater  for ARM processors


## Installation

Using docker compose 

For more information on account id -  https://support.dnsimple.com/articles/api-access-token/

```docker-compose.yml

    dnsimple:
        container_name: dnsimple
        image: markgreenway/dnsimple-dyndns-arm:latest
        environment:
            TZ: 'America/New_York'
            PATH: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
            HOME: '/root'
            LANGUAGE: 'en_US.UTF-8'        
            LANG: 'en_US.UTF-8'
            TERM: 'xterm'
            APTLIST: 'curl inotify-tools'
            ACCOUNT_ID: 
            TOKEN:   
            ZONE_ID : 
            RECORD_ID : 
            SLEEP_DELAY: 600        

```

## Source Code

[github.com/hurricanepkt/dnsimple-dyndns-arm](https://github.com/hurricanepkt/dnsimple-dyndns-arm)