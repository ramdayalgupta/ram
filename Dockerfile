FROM centos:latest
MAINTAINER ramdayal.gupta@cygnetinfotech.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install httpd \
  zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page292/seomark.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip seomark.zip
RUN cp -rvf seomark-html/* .
RUN rm -rf seomark-html seomark.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
