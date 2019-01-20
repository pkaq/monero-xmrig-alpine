# Alpine XMRig

- CPU monero miner [XMRig](https://github.com/xmrig/xmrig)
- donation 0%
- built on Alpine linux - only 55 MB container size with no decrease in performance
- compiled with gcc 8 for better [performance

# Usage

### Run

```bash
docker run -d --restart always mosvex/monero-xmrig-alpine
```

### Build

Modify the CMD in [Dockerfile](https://github.com/donAFRO/docker_xmrig/blob/master/Dockerfile) with your own configuration, build it and run it.

```bash
docker build -t xmrig .
docker run -d xmrig
```

Or you can override those configurations without building the image yourself when running the image

```bash
docker run -it --rm mosvex/monero-xmrig-alpine -k --max-cpu-usage=100 \
     --pass=another_miner --url=pool.supportxmr.com:5555 \
     --user=45emdaLjrCciQksAgph7t3iWv6Rsr7sFAjZTP7vfpvCJ7TmfzjuTRiHRDbVBv5re7WbfuJXbPqJLxBREBnEgAorxE1j9hoA
```

# Donate

- monero address: 45emdaLjrCciQksAgph7t3iWv6Rsr7sFAjZTP7vfpvCJ7TmfzjuTRiHRDbVBv5re7WbfuJXbPqJLxBREBnEgAorxE1j9hoA