FROM nginx:latest

COPY ./docs /usr/share/nginx/html

EXPOSE 80