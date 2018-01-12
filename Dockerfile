# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:latest

RUN apt-get update && apt-get install -y wget mingw-w64 xvfb

RUN dpkg --add-architecture i386 && \
		wget -nc https://dl.winehq.org/wine-builds/Release.key && \
		apt-key add Release.key && \
		apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/ && \
		apt-get update && \
		apt-get install -y --install-recommends winehq-stable

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

WORKDIR /usr/src/app

RUN chmod +x /entrypoint.sh

# Use baseimage-docker's init system.
ENTRYPOINT ["/sbin/my_init", "--", "/entrypoint.sh"]
