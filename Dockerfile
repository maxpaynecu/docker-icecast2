FROM ubuntu:noble

LABEL maintainer="Leonel Hernandez <maxpaynecu@gmail.com>" \
      github="https://github.com/maxpaynecu/docker-icecast2"

# install icecast2 and enable its autostart
RUN apt update && apt upgrade -y && \
    apt install -y icecast2 && \
    sed -i "s#ENABLE=.*#ENABLE=true#" /etc/default/icecast2 && \
    cat /etc/default/icecast2 && \
    apt autoremove && apt clean && \
    rm -rf /var/lib/apt/lists/*

CMD /etc/init.d/icecast2 start && tail -F /var/log/icecast2/error.log
