# Based on https://github.com/graalvm/fastr#building-fastr-from-source
FROM openjdk:9-jdk

RUN sed -i "s/deb.debian.org/cdn-fastly.deb.debian.org/" /etc/apt/sources.list \
    && sed -i "s/security.debian.org/cdn-fastly.debian.org\/debian-security/" /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential

WORKDIR /tmp
ENV JVMCI_VERSION_CHECK=ignore
RUN git clone --depth 1 -b master https://github.com/graalvm/mx.git /usr/mx \
    && export PATH=/usr/mx:$PATH \
    # install graal from source:
#    && git clone  --depth 1 -b master https://github.com/graalvm/graal-core.git \
#    && cd graal-core \
#    && mx \
#    && mx sforceimports \
#    && mx build \
#    && mx vm
    # install FastR from source:
    #$ mkdir $FASTR_HOME
    #$ cd $FASTR_HOME
    && git clone --depth 1 http://github.com/graalvm/fastr \
    && cd fastr \
    && mx build

ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE
LABEL org.label-schema.license="https://raw.githubusercontent.com/graalvm/fastr/master/LICENSE" \
    org.label-schema.vendor="FastR project team, Dockerfile provided by Daniel Nüst" \
	org.label-schema.name="FastR" \
	org.label-schema.description="FastR is an implementation of the R Language in Java atop Truffle, a framework for building self-optimizing AST interpreters." \ 
    org.label-schema.vcs-url=$VCS_URL \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.build-date=$BUILD_DATE \
    org.fastr.version="devel" \
    org.gnur.version="3.3.2" \
    org.label-schema.schema-version="rc1" \
maintainer="Daniel Nüst <daniel.nuest@uni-muenster.de>"

CMD ["mx R"]
