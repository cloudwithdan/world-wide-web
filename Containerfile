# nginx image
FROM docker.io/nginxinc/nginx-unprivileged:stable-alpine

# Copy static files (main site)
COPY index.html /usr/share/nginx/html/
COPY uses/index.html /usr/share/nginx/html/uses/index.html
COPY styles.css /usr/share/nginx/html/
COPY robots.txt /usr/share/nginx/html/
COPY humans.txt /usr/share/nginx/html/
COPY crypto.txt /usr/share/nginx/html/
COPY static/favicon.ico /usr/share/nginx/html/
COPY static/favicon.svg /usr/share/nginx/html/
COPY static/ /usr/share/nginx/html/static/

# Expose port 8080
EXPOSE 8080

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
