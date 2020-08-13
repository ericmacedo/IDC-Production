FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
# apt
RUN apt update -y \
    && apt install apache2 virtualenv python2.7 python3-nltk  poppler-utils -y \
    && apt autoremove \
    && rm -rf /var/lib/apt/lists/*
 
# apache2
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
COPY apache-conf /etc/apache2/apache2.conf
RUN a2enmod cgid
EXPOSE 80
 
 # Virtual environments
RUN mkdir /home/vagrant/ /home/vagrant/python2 /home/vagrant/python3
RUN virtualenv --python=python2.7 /home/vagrant/python2 \
    && virtualenv --python=python3.6 /home/vagrant/python3
COPY ./python2.txt /home/vagrant/python2/requirements.txt
COPY ./python3.txt /home/vagrant/python3/requirements.txt
RUN /home/vagrant/python2/bin/pip2 install -r /home/vagrant/python2/requirements.txt \
    && /home/vagrant/python3/bin/pip3 install -r /home/vagrant/python3/requirements.txt

# NLTK Data
RUN python3 -m nltk.downloader -d /usr/local/share/nltk_data stopwords wordnet

# Launch Apache
CMD chown -R www-data /var/www/
CMD ["apache2ctl", "-D", "FOREGROUND"]