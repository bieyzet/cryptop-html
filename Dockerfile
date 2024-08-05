# Base image olarak resmi Nginx imajýný kullanýyoruz
FROM nginx:latest

# HTML dosyalarýný Nginx'in varsayýlan dizinine kopyalýyoruz
COPY . /usr/share/nginx/html

# Container baþlatýldýðýnda Nginx server'ýný çalýþtýr
CMD ["nginx", "-g", "daemon off;"]
