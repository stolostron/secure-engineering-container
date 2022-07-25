FROM registry.access.redhat.com/ubi9/go-toolset:1.17.7 as builder
ENV SEC_BIN /tmp/SEC/bin
ENV SEC_ETC /tmp/SEC/etc
RUN mkdir -p $SEC_BIN
RUN mkdir -p $SEC_ETC
RUN mkdir -p /tmp/SECscripts
COPY ./tools tools

WORKDIR tools
RUN for dir in $(ls); do bash $dir/build; cat $dir/install >> /tmp/SECscripts/instALL.sh; cat $dir/local >> /tmp/SECscripts/locALL.sh; done \
    && grep -e "^microdnf install" /tmp/SECscripts/instALL.sh | sed 's/^microdnf install //g; s/ /\n/g' | sort -u | xargs echo "microdnf install -y --setopt=install_weak_deps=0" > /tmp/SECscripts/quick-instALL.sh \
    && grep -ve "microdnf install" /tmp/SECscripts/instALL.sh >> /tmp/SECscripts/quick-instALL.sh \
    && echo "microdnf clean all" >> /tmp/SECscripts/quick-instALL.sh

FROM registry.access.redhat.com/ubi9-minimal:latest
COPY --from=builder /tmp/SECscripts /tmp
COPY --from=builder /tmp/SEC/bin /usr/local/bin
COPY --from=builder /tmp/SEC/etc /usr/local/etc
COPY scripts/local.sh /usr/local/bin/local

RUN bash /tmp/quick-instALL.sh \
    && mkdir /SEC
WORKDIR /SEC
