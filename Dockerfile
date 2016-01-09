# ------------------------------------------------------------------------------
# Based on a work at https://github.com/docker/docker.
# ------------------------------------------------------------------------------
# Pull base image.
FROM kdelfour/supervisor-docker
MAINTAINER Kevin Delfour <kevin@delfour.eu>

# ------------------------------------------------------------------------------
# Install base
ADD https://deb.nodesource.com/setup /cloud9/node-setup
RUN bash /cloud9/node-setup && apt-get -yq --no-install-recommends install \
    build-essential \
    g++ \
    curl \
    libssl-dev \
    apache2-utils \
    git \
    libxml2-dev \
    sshfs \
    unzip \
    tmux \
    nodejs

# ------------------------------------------------------------------------------
# Install Cloud9
ADD https://codeload.github.com/c9/core/zip/master /cloud9/master.zip
WORKDIR /cloud9
RUN unzip master.zip && \
    mv core-master/* . && \
    rm -rf core-master master.zip && \
    ./scripts/install-sdk.sh

# Tweak standlone.js conf
RUN sed -i -e 's_127.0.0.1_0.0.0.0_g' /cloud9/configs/standalone.js 

# Add supervisord conf
ADD conf/cloud9.conf /etc/supervisor/conf.d/

# ------------------------------------------------------------------------------
# Add volumes
RUN mkdir /workspace
VOLUME /workspace

# ------------------------------------------------------------------------------
# Clean up APT when done.
RUN apt-get -yq clean && \
    find /cloud9 -name .git -prune -exec rm -rf {} \; && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ------------------------------------------------------------------------------
# Expose ports.
EXPOSE 80
EXPOSE 3000

# ------------------------------------------------------------------------------
# Start supervisor, define default command.
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
