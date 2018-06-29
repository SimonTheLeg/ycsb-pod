FROM openjdk:8-jdk-alpine3.7

LABEL maintainer="simon@codeconductor.io"

# Required YCSB Database bindings, separated by spaces
ENV REQ_YCSB_BINDS "com.yahoo.ycsb:elasticsearch-binding"

# NOTE: Python is needed at the moment due to this bug https://github.com/brianfrankcooper/YCSB/issues/1105
RUN apk add --update \
      maven \
      git \
      bash \
      python \
    && rm -rf /var/cache/apk/* \
    && git clone --progress https://github.com/brianfrankcooper/YCSB.git \
    && cd YCSB \
    && mvn -pl ${REQ_YCSB_BINDS} -am clean package

WORKDIR YCSB