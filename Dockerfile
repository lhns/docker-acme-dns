FROM joohoi/acme-dns:latest


ENV ACME_DNS_DOMAIN auth.example.org
ENV ACME_DNS_NS $ACME_DNS_DOMAIN
ENV ACME_DNS_EMAIL admin.example.org


RUN apk add gettext

COPY ["config_template.cfg", "."]
COPY ["run.sh", "."]
RUN chmod +x run.sh

ENTRYPOINT ["./run.sh"]
