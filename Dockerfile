FROM ubuntu:20.04
RUN apt-get update && apt-get install -y nginx
COPY my_nginx/index.nginx-debian.html /var/www/html/
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
EXPOSE 80
MAINTAINER Alexei Emelin

