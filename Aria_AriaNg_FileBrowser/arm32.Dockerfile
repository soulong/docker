FROM arm32v6/alpine:latest

LABEL AUTHOR=Junv<wahyd4@gmail.com>

WORKDIR /app

ENV RPC_SECRET=""
ENV ENABLE_AUTH=false
ENV DOMAIN=0.0.0.0:80
ENV ARIA2_USER=user
ENV ARIA2_PWD=password
ENV ARIA2_SSL=false
ENV ARIA2_EXTERNAL_PORT=80
ENV PUID=1000
ENV PGID=1000
ENV CADDYPATH=/app

RUN adduser -D -u 1000 junv \
  && apk update \
  && apk add runit shadow wget bash curl openrc gnupg aria2 tar --no-cache \
  && curl https://getcaddy.com | bash -s personal \
  && filebrowser_version=v2.2.0 \
  && platform=linux-armv6 \
  && wget -N https://github.com/filebrowser/filebrowser/releases/download/${filebrowser_version}/${platform}-filebrowser.tar.gz \
  && tar -zxvf ${platform}-filebrowser.tar.gz \
  && rm -rf ${platform}-filebrowser.tar.gz \
  && rm LICENSE README.md \
  && wget -N https://bin.equinox.io/c/ekMN3bCZFUn/forego-stable-linux-arm.tgz \
  && tar -zxvf forego-stable-linux-arm.tgz \
  && rm -rf forego-stable-linux-arm.tgz \
  && mkdir -p /usr/local/www \
  && mkdir -p /usr/local/www/aria2

ADD aria2c.sh caddy.sh Procfile init.sh start.sh /app/
ADD conf /app/conf
ADD Caddyfile SecureCaddyfile /usr/local/caddy/

# AriaNg

RUN mkdir /usr/local/www/aria2/Download \
  && cd /usr/local/www/aria2 \
  && chmod +rw /app/conf/aria2.session \
  && version=1.1.6 \
  && wget -N --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/${version}/AriaNg-${version}.zip \
  && unzip AriaNg-${version}.zip \
  && rm -rf AriaNg-${version}.zip \
  && chmod -R 755 /usr/local/www/aria2

#The folder to store ssl keys
VOLUME /app/conf/key
# User downloaded files
VOLUME /data

EXPOSE 80 443

CMD ["./start.sh"]
