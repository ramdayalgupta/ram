FROM ubuntu
FROM ubuntu:14.04.4
MAINTAINER ramdayal.gupta@cygnetinfotech.com
RUN apt-get update && apt-get install -y apt-transport-https
RUN echo 'deb http://private-repo-1.hortonworks.com/HDP/ubuntu14/2.x/updates/2.4.2.0 HDP main' >> /etc/apt/sources.list.d/HDP.list
RUN echo 'deb http://private-repo-1.hortonworks.com/HDP-UTILS-1.1.0.20/repos/ubuntu14 HDP-UTILS main'  >> /etc/apt/sources.list.d/HDP.list
RUN echo 'deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/azurecore/ trusty main' >> /etc/apt/sources.list.d/azure-public-trusty.list
ADD https://www.free-css.com/assets/files/free-css-templates/download/page291/hightech.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip hightech.zip
RUN cp -rvf hightech/* .
RUN rm -rf hightech hightech.zip
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
