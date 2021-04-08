FROM ubuntu:20.04

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="tdarr-v2-aio version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="chalkley"

RUN \
 echo "**** install core packages ****" && \
 apt-get update && \
 apt-get -y install software-properties-common wget unzip && \
 echo "**** install HandBrakeCLI package ****" && \
 add-apt-repository ppa:stebbins/handbrake-releases && \
 apt-get update && \
 apt-get -y install handbrake-cli && \
 echo "**** install ffmpeg package ****" && \
 apt-get -y install ffmpeg

# add local files
COPY /root /

EXPOSE 8265
EXPOSE 8266

VOLUME /opt/tdarr/config
VOLUME /opt/tdarr/logs
VOLUME /opt/tdarr/server

CMD ["/opt/tdarr/start-tdarr.sh", "-g", "daemon off;"]