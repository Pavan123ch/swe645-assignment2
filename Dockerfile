# Purpose: Containerize SWE645 Assignment 1 survey app
FROM nginx:alpine
COPY . /usr/share/nginx/html
