# Base image olarak resmi Nginx imaj�n� kullan�yoruz
FROM nginx:latest

# HTML dosyalar�n� Nginx'in varsay�lan dizinine kopyal�yoruz
COPY . /usr/share/nginx/html

# Container ba�lat�ld���nda Nginx server'�n� �al��t�r
CMD ["nginx", "-g", "daemon off;"]
