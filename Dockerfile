FROM ubuntu
MAINTAINER ramdayal.gupta@cygnetinfotech.com
RUN apt install –y apache2 
RUN apt install –y apache2-utils 
RUN apt install –y zip
RUN apt install –y unzip
RUN apt clean
ADD https://www.free-css.com/assets/files/free-css-templates/download/page291/hightech.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip hightech.zip
RUN cp -rvf hightech/* .
RUN rm -rf hightech hightech.zip
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
