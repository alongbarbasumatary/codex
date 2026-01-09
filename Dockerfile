FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools
RUN apt update && apt install -y \
    curl \
    wget \
    git \
    nano \
    vim \
    sudo \
    htop \
    net-tools \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install ttyd (web terminal)
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 \
    && chmod +x ttyd.x86_64 \
    && mv ttyd.x86_64 /usr/local/bin/ttyd

# Create user
RUN useradd -m -s /bin/bash render && \
    echo "render ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER render
WORKDIR /home/render

EXPOSE 10000

CMD ["/bin/bash", "/home/render/start.sh"]
