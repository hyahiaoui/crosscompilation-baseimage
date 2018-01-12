# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:latest

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

WORKDIR /usr/src/app

RUN chmod +x /entrypoint.sh

# Use baseimage-docker's init system.
ENTRYPOINT ["/sbin/my_init", "--", "/entrypoint.sh"]
