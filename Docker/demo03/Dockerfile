FROM ubuntu:24.04
LABEL version="0.0.1"
LABEL maintainer="bart.thonissen@thomasmore.be"
ENV REFRESHED_AT=2025-10-10
RUN echo 'we are running some # of cool things'
RUN apt update && apt install -y nginx
RUN echo 'Hi, I am in your container' >/usr/share/nginx/html/index.html
EXPOSE 80
