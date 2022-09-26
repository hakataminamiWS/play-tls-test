FROM alpine/openssl:latest as openssl
COPY docker-cert/input /tmp/input
RUN openssl pkcs12 -export -passout pass:tekitouna-pass-1\
    -in /tmp/input/certificate.crt\
    -inkey /tmp/input/private.key\
    -certfile /tmp/input/ca_bundle.crt\
    -out /tmp/merge.p12
    
FROM gcr.io/distroless/java11-debian11:nonroot
COPY --from=openssl --chown=nonroot:nonroot /tmp/merge.p12 /tmp/merge.p12
USER nonroot
RUN [\
    "/usr/lib/jvm/java-11-openjdk-amd64/bin/keytool",\
    "-importkeystore",\
    "-deststorepass",\
    "tekitouna-pass-2",\
    "-destkeypass",\
    "tekitouna-pass-2",\
    "-destkeystore",\
    "/tmp/certificate.jks",\
    "-srckeystore",\
    "/tmp/merge.p12",\
    "-srcstoretype",\
    "PKCS12",\
    "-srcstorepass",\
    "tekitouna-pass-1"\
]