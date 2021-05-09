FROM debian:bullseye
LABEL maintainer="Anderson Reis <andersonreisrosa@gmail.com>"

# Let the container know that there is no tty
# -------------------------------------------
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color

# Bootstrapping packages needed for installation
# ----------------------------------------------
RUN apt-get update && \
    apt-get install -yqq \
    locales \
    lsb-release \
    software-properties-common \
 && apt-get clean

# Set locale to UTF-8
# -------------------
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
RUN localedef -i en_US -f UTF-8 en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=$LANG

# Install dependencies
# --------------------
RUN apt-get update && \
    apt-get -yqq install \
    autoconf \
    build-essential \
    cargo \
    curl \
    fasd \
    fontconfig \
    git \
    python \
    python3 \
    python-setuptools \
    python-dev \
    ruby-full \
    sudo \
    tmux \
    vim \
    neovim \
    nodejs \
    wget \
    yarn \
    zsh && \
    apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Do not run processes in containers as root
# ------------------------------------------
RUN groupadd --gid 5000 dotfiles \
 && useradd --home-dir /home/dotfiles --create-home --uid 5000 \
    --gid 5000 --shell /bin/sh --skel /dev/null dotfiles
USER dotfiles

# Install dotfiles
# ----------------
WORKDIR /home/dotfiles/.dotf
COPY . /home/dotfiles/.dotf
RUN cd /home/dotfiles/.dotf && \
    rake install

# Run a zsh session
# -----------------
CMD [ "/bin/zsh" ]
