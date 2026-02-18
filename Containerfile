# nginx image
FROM docker.io/nginxinc/nginx-unprivileged:stable-alpine

# Copy nginx configuration
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY nginx/50x.html /usr/share/nginx/html/50x.html
COPY nginx/404.html /usr/share/nginx/html/404.html

# Copy static files (main site)
COPY index.html /usr/share/nginx/html/
COPY uses/index.html /usr/share/nginx/html/uses/index.html
COPY styles.css /usr/share/nginx/html/
COPY static/robots.txt /usr/share/nginx/html/
COPY static/humans.txt /usr/share/nginx/html/
COPY static/crypto.txt /usr/share/nginx/html/
COPY static/favicon.ico /usr/share/nginx/html/
COPY static/favicon.svg /usr/share/nginx/html/
COPY static/ /usr/share/nginx/html/static/
COPY static/sitemap.xml /usr/share/nginx/html/

# Expose port 8080
EXPOSE 8080

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
