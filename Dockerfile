# see https://hub.docker.com/r/hashicorp/packer/tags for all available tags
FROM hashicorp/packer:light@sha256:f795aace438ef92e738228c21d5ceb7d5dd73ceb7e0b1efab5b0e90cbc4d4dcd

RUN apk update && \
    apk upgrade && \
    apk add curl && \
    apk add git && \
    apk add openssl && \
    apk add gnupg && \
    apk add go && \
    apk add ansible

RUN rm -rf /var/cache/apk/*

COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
