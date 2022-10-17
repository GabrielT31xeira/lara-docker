FROM php:8-fpm
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN docker-php-ext-install pdo pdo_mysql
RUN mkdir -p /var/www/storage/framework/sessions \
     && mkdir -p /var/www/storage/framework/views \
     && mkdir -p /var/www/bootstrap/cache \
     && mkdir -p /var/www/storage/logs \
     && chmod +w /var/www/storage/ 
# && chmod -R 755 /var/www/storage/logs/laravel.log
# TODO: revisdar as permições
# && chown www-data:www-data /var/www/html/storage/ -R \
# && chown www-data:www-data /var/www/html/bootstrap/cache -R \
# && chmod g+w /var/www/html/storage/ \
# && chmod g+w /var/www/html/bootstrap/

RUN chown -R www-data:www-data /var/www/storage/ \
     && chown -R www-data:www-data /var/www/bootstrap/cache/