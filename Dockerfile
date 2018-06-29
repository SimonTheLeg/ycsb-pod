FROM alpine:3.7 

LABEL maintainer="simon@codeconductor.io"

ENV YCSB_VERSION "0.14.0"

RUN apk add --update \
      bash \
      curl \
      openjdk8-jre \
    && rm -rf /var/cache/apk/* \
    && curl -o ycsb.tar.gz -L "https://github.com/brianfrankcooper/YCSB/releases/download/${YCSB_VERSION}/ycsb-${YCSB_VERSION}.tar.gz" \
    && mkdir ycsb \
    && tar xfz ycsb.tar.gz -C ycsb --strip-components 1 \
    && rm -rf ycsb.tar.gz

WORKDIR ycsb

# Keep alive forever; tail was used since alpine does not have sleep infinity
CMD [ "tail", "-f", "/dev/null"]