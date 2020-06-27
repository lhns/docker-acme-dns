FROM joohoi/acme-dns:latest


ENV ACME_DNS_DOMAIN auth.example.org
ENV ACME_DNS_EMAIL admin.example.org
ENV ACME_DNS_IP 127.0.0.1
ENV ACME_DNS_NS $ACME_DNS_DOMAIN


RUN apk add gettext

COPY ["config_template.cfg", "."]
COPY ["run.sh", "."]
RUN chmod +x run.sh

ENTRYPOINT ["./run.sh"]
