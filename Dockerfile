FROM centos:latest
MAINTAINER ramdayal.gupta@cygnetinfotech.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install httpd \
  zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page291/hightech.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip hightech.zip
RUN pwd
RUN ls
RUN cp -rvf hightech/* .
RUN rm -rf hightech hightech.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
