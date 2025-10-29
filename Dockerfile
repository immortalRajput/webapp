from nginx as latest

WORKDIR /var/www/html/

COPY upload/ .
COPY upload/ /usr/share/nginx/html/path/new
RUN service nginx restart

EXPOSE 80
