from nginx as latest

WORKDIR /var/www/html/

COPY upload/ .
COPY upload/ /usr/share/nginx/htmm/
RUN service nginx restart

EXPOSE 80
