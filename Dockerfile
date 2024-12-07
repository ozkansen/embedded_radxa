FROM debian:bookworm

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gawk wget git diffstat unzip texinfo \
    gcc build-essential chrpath socat cpio \
    python3 python3-pip python3-pexpect \
    xz-utils debianutils iputils-ping python3-git \
    python3-jinja2 python3-subunit zstd \
    liblz4-tool file locales libacl1

RUN useradd -ms /bin/bash user1
USER user1
WORKDIR /build
