FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    curl wget git nano vim htop net-tools ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install ttyd
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 \
    && chmod +x ttyd.x86_64 \
    && mv ttyd.x86_64 /usr/local/bin/ttyd

WORKDIR /root

EXPOSE 10000

CMD ["ttyd", "--writable", "--port", "10000", "--interface", "0.0.0.0", "/bin/bash"]
