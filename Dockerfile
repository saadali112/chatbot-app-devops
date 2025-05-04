# Use lightweight Nginx image
FROM nginx:alpine
# Copy frontend files to Nginx's default serving directory
COPY frontend /usr/share/nginx/html
# Expose port 80 (HTTP)
EXPOSE 80