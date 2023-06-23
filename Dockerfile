FROM centos:latest
MAINTAINER ramdayal.gupta@cygnetinfotech.com
RUN /bin/sh -c sudo yum install -y httpd; yum clean all; systemctl enable httpd.service
ADD https://www.free-css.com/assets/files/free-css-templates/download/page291/hightech.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip hightech.zip
RUN cp -rvf hightech/* .
RUN rm -rf hightech hightech.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
