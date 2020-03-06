#!/bin/sh

cat config_template.cfg | envsubst > /etc/acme-dns/config.cfg

exec ./acme-dns
