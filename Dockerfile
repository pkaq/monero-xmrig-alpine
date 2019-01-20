FROM index.docker.io/library/alpine:edge

RUN apk add --update --no-cache --virtual build-deps build-base cmake git \
&& apk add --update --no-cache libuv-dev libmicrohttpd-dev libressl-dev \
&& git clone https://github.com/xmrig/xmrig \
&& sed -i 's/kDefaultDonateLevel = 5/kDefaultDonateLevel = 0/g' /xmrig/src/donate.h \
&& sed -i 's/kMinimumDonateLevel = 1/kMinimumDonateLevel = 0/g' /xmrig/src/donate.h \
&& mkdir /xmrig/build \
&& cd /xmrig/build \
&& cmake -DCMAKE_BUILD_TYPE=Release .. \
&& make \
&& apk del build-deps

RUN adduser -S -D -H -h /xmrig monero
USER monero
WORKDIR /xmrig

ENTRYPOINT ["./build/xmrig"]

CMD ["--url=pool.supportxmr.com:5555", \
"--user=45emdaLjrCciQksAgph7t3iWv6Rsr7sFAjZTP7vfpvCJ7TmfzjuTRiHRDbVBv5re7WbfuJXbPqJLxBREBnEgAorxE1j9hoA", \
"--pass=docker_hub_miner", \
"-k", "--max-cpu-usage=100"]
