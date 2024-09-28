# Використовуємо базовий образ Odoo версії 17.0
FROM odoo:17.0

# Копіюємо конфігураційні файли з локальної директорії `conf` до `/etc/odoo` в контейнері
COPY ./conf /etc/odoo

# Переключаємося на користувача root для встановлення пакетів
USER root

# Копіюємо файл з вимогами
COPY ./requirements.txt /requirements.txt

# Встановлюємо залежності з requirements.txt
RUN pip3 install -r /requirements.txt

# Видаляємо файл requirements.txt після встановлення
RUN rm /requirements.txt

# Повертаємося до користувача odoo
USER odoo
