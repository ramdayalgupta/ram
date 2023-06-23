FROM centos:6
MAINTAINER ramdayal.gupta@cygnetinfotech.com
RUN yum -y install epel-release && yum clean all
RUN yum install -y httpd && yum clean all && systemctl enable httpd.service
RUN yum install -y zip 
RUN yum install -y unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page291/hightech.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip hightech.zip
RUN cp -rvf hightech/* .
RUN rm -rf hightech hightech.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
