FROM debian:jessie

COPY dummy.box /app/dummy.box

RUN apt-get update && \
    apt-get install -y vagrant zlib1g-dev pkg-config rsync && \
    vagrant plugin install vagrant-aws && \
    vagrant box add dummy /app/dummy.box && \
    rm -f /app/dummy.box

WORKDIR /app

CMD vagrant -h
