FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
# apt
RUN apt update -y && \
    apt install apache2 virtualenv poppler-utils python2.7 python3.6 -y && \
    apt autoremove && \
    rm -rf /var/lib/apt/lists/*

# apache2
COPY apache-conf /etc/apache2/apache2.conf

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
RUN a2enmod cgid && usermod -aG sudo www-data


EXPOSE 80

# Virtual environments
WORKDIR /home
RUN mkdir ./vagrant/ ./vagrant/python2 ./vagrant/python3 && \
    virtualenv --python=python2.7 ./vagrant/python2 && \
    virtualenv --python=python3.6 ./vagrant/python3

WORKDIR /home/vagrant
COPY python2.txt python2/requirements.txt
COPY python3.txt python3/requirements.txt
RUN python2/bin/pip2 install -r python2/requirements.txt && \
    python3/bin/pip3 install -r python3/requirements.txt && \
    python3/bin/python -m nltk.downloader -d /usr/local/share/nltk_data all

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

COPY IC3/ /var/www/html/IC3
COPY IC5/ /var/www/html/IC5

RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT [ "sh",  "entrypoint.sh" ] 
