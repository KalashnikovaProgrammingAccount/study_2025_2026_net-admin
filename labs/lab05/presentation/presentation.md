---
lang: ru-RU
title: Презентация
subtitle: Лабораторная работа 5
author:
  - Калашникова Д. В.
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 30 сентября 2026

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
  - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
  - \setsansfont{DejaVu Sans}
  - \setmonofont{DejaVu Sans Mono}
---

# Информация

## Докладчик

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

  * Калашникова Дарья Викторовна
  * Студент
  * Российский университет дружбы народов
  * [1132243108@pfur.ru](mailto:1132243108@pfur.ru)

:::
::: {.column width="30%"}

![](image/kalashnikova.jpeg)

:::
::::::::::::::

## Цель работы

Получить практические навыки расширенной настройки HTTP-сервера Apache: защита соединения и поддержка PHP.

## Старт сервера

Поднимаем сервер через vagrant и убеждаемся, что он запустился.

![Запуск сервера](image/1.png){#fig:001 width=60%}

## Генерация сертификата

Создаём SSL-сертификат в /etc/pki/tls/private и копируем его в /etc/ssl/certs.

![Создание сертификата](image/2.png){#fig:002 width=40%}

## Правка конфигурационного файла httpd

Открываем в /etc/httpd/conf.d файл www.dvkalashnikova.net.conf.

![Редактирование конфигурационного файла httpd](image/3.png){#fig:003 width=60%}

## www.dvkalashnikova.net.conf

Приводим конфиг к виду с поддержкой HTTPS: два блока VirtualHost и редирект с 80 на 443.

![www.dvkalashnikova.net.conf](image/4.png){#fig:004 width=50%}

## Настройки фаервола

Разрешаем работу по https через firewall-cmd и перезапускаем httpd.

![Настройка фаервола](image/5.png){#fig:005 width=30%}

## Предупреждение браузера

На клиенте открываем сайт — браузер предупреждает, что сертификат самоподписанный.

![Предупреждение](image/6.png){#fig:006 width=60%}

## Открытие сайта

Подтверждаем переход и видим, что соединение идёт по https.

![Подключение к сайту](image/7.png){#fig:007 width=60%}

## Просмотр сертификата

В сертификате те же данные, что мы указывали при создании.

![Сертификат](image/8.png){#fig:008 width=40%}

## Установка PHP

Ставим на сервер пакет php для обработки динамических страниц.

![Установка php](image/9.png){#fig:009 width=60%}

## Замена index.html на index.php

В /var/www/html/www.dvkalashnikova.net создаём index.php вместо старого index.html.

![Замена файла index.html на index.php](image/10.png){#fig:010 width=60%}

## Содержимое index.php

В index.php записываем приветственный код с использованием PHP.

![Содержимое index.php](image/11.png){#fig:011 width=60%}

## Настройка прав доступа

Возвращаем метки SELinux, меняем владельца /var/www на apache и перезапускаем службу.

![Исправление настроек доступа](image/12.png){#fig:012 width=60%}

## Как выглядит сайт

Проверяем с клиента — сайт отдаёт страницу, сгенерированную PHP.

![Отображение сайта](image/13.png){#fig:013 width=60%}

## Сохранение конфигурации

Переносим получившиеся конфиги в provision/server для vagrant.

![Сохранение конфигурации](image/14.png){#fig:014 width=60%}

## Скрипт http.sh

Дорабатываем http.sh: он ставит php и открывает https в фаерволе.

![http.sh](image/15.png){#fig:015 width=60%}

## Выводы

В ходе лабораторной работы получены навыки расширенного конфигурирования HTTP-сервера Apache и организации https.

## Список литературы

1. Apache Software Foundation. Apache HTTP Server Documentation [Электронный ресурс]. — URL: https://httpd.apache.org/docs/ (дата обращения: 25.09.2026).

2. Apache Software Foundation. mod_ssl — SSL/TLS Encryption [Электронный ресурс]. — URL: https://httpd.apache.org/docs/2.4/mod/mod_ssl.html (дата обращения: 25.09.2026).

3. Red Hat. Documentation [Электронный ресурс]. — URL: https://docs.redhat.com/ (дата обращения: 25.09.2026).
