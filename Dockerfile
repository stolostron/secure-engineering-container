FROM golang:1.14 as builder
ENV SEC_BIN /SEC/bin
RUN mkdir -p $SEC_BIN
RUN mkdir -p /SECscripts
COPY ./tools tools

WORKDIR tools
RUN for dir in $(ls); do bash $dir/build; cat $dir/install >> /SECscripts/instALL.sh; cat $dir/local >> /SECscripts/locALL.sh; done
RUN echo "microdnf clean all" >> instALL.sh
# RUN sed '/#.*$/d' /SECscripts/locALL.sh | tee /SECscripts/locALL.sh

FROM ubi8-minimal:latest
COPY --from=builder /SECscripts /tmp
COPY --from=builder /SEC/bin /usr/local/bin
COPY scripts/local.sh /usr/local/bin/local

RUN bash /tmp/instALL.sh
RUN mkdir /SEC
WORKDIR /SEC
