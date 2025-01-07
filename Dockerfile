# Используем официальный образ Nginx
FROM nginx:alpine

# Копируем собранное Flutter веб-приложение в каталог Nginx
COPY build/web /usr/share/nginx/html

# Открываем порт 80
EXPOSE 80

# Запускаем Nginx
CMD ["nginx", "-g", "daemon off;"]
