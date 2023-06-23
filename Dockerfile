FROM centos:latest
MAINTAINER ramdayal.gupta@cygnetinfotech.com
RUN yum install -y httpd \
	zip \
	unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page291/hightech.zip
WORKDIR /var/www/html
RUN unzip hightech.zip
RUN cp -rvf hightech/* .
RUN rm -rf hightech hightech.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80

