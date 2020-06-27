#!/bin/sh

if [ -n "$ACME_DNS_NS" ]
then
  export ACME_DNS_RECORDS=$"\"${ACME_DNS_DOMAIN}. NS ${ACME_DNS_NS}.\",\n$ACME_DNS_RECORDS"
fi

if [ -n "$ACME_DNS_IP" ]
then
  export ACME_DNS_RECORDS=$"\"${ACME_DNS_DOMAIN}. A ${ACME_DNS_IP}\",\n$ACME_DNS_RECORDS"
fi

cat config_template.cfg | envsubst > /etc/acme-dns/config.cfg

exec ./acme-dns
