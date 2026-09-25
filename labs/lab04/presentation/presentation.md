---
title: "Презентация"
subtitle: "Лабораторная работа №4"
author:
  - Калашникова Д. В.
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 25 сентября 2026
lang: ru-RU
babel-lang: russian
babel-otherlangs: english
toc: false
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

Приобретение практических навыков по установке и базовому конфигурированию HTTP-сервера Apache.

## Запуск сервера

Запускаем виртуальную машину сервера через vagrant.

![Запуск сервера](image/1.png){#fig:001 width=60%}

## Установка пакетов

Устанавливаем пакет httpd и сопутствующие утилиты для работы веб-сервера.

![Установка пакетов](image/2.png){#fig:002 width=30%}

## /etc/httpd/conf/httpd.conf

Основной конфигурационный файл Apache — в нём задаются глобальные параметры сервера.

![/etc/httpd/conf/httpd.conf](image/3.png){#fig:003 width=30%}

## /etc/httpd/conf/magic

Файл с инструкциями для определения MIME-типа файла по его содержимому.

![/etc/httpd/conf/magic](image/4.png){#fig:004 width=30%}

## /etc/httpd/conf.d/autoindex.conf

Настройки автоматического отображения списка файлов в директории.

![/etc/httpd/conf.d/autoindex.conf](image/5.png){#fig:005 width=30%}

## /etc/httpd/conf.d/manual.conf

Настройки доступа к веб-странице с документацией Apache.

![/etc/httpd/conf.d/manual.conf](image/6.png){#fig:006 width=60%}

## /etc/httpd/conf.d/userdir.conf

Настройки доступа к публичным веб-директориям пользователей системы.

![/etc/httpd/conf.d/userdir.conf](image/7.png){#fig:007 width=40%}

## /etc/httpd/conf.d/fcgid.conf

Настройки модуля mod_fcgid для запуска скриптов через FastCGI.

![/etc/httpd/conf.d/fcgid.conf](image/8.png){#fig:008 width=60%}

## /etc/httpd/conf.d/ssl.conf

Настройки поддержки шифрования SSL/TLS.

![/etc/httpd/conf.d/ssl.conf](image/9.png){#fig:009 width=30%}

## Настройка firewall

Добавляем службу http в фаервол, чтобы клиент мог обращаться к веб-серверу.

![Настройка firewall](image/10.png){#fig:010 width=50%}

## journalctl

Запускаем journalctl с ключом -f для отслеживания логов в реальном времени.

![journalctl](image/11.png){#fig:011 width=60%}

## Запуск службы httpd

Запускаем службу httpd и включаем её автозагрузку.

![запуск службы httpd](image/12.png){#fig:012 width=60%}

## Лог об успешном запуске

В журнале видим, что запуск httpd прошёл успешно.

![Лог об успешном запуске](image/13.png){#fig:013 width=60%}

## Запуск клиента

Запускаем виртуальную машину клиента через vagrant.

![Запуск клиента](image/14.png){#fig:014 width=60%}

## Страница по умолчанию

Переходим в браузере клиента по адресу 192.168.1.1 — видим страницу по умолчанию.

![Страница по умолчанию](image/15.png){#fig:015 width=50%}

## /var/log/httpd/error_log

Смотрим лог ошибок веб-сервера — он пуст, ошибок нет.

![/var/log/httpd/error_log](image/16.png){#fig:016 width=60%}

## /var/log/httpd/access_log

Смотрим лог доступа — в нём фиксируется обращение клиента к серверу.

![/var/log/httpd/access_log](image/17.png){#fig:017 width=60%}

## Остановка службы named

Останавливаем DNS-службу, чтобы заменить файлы зон.

![Остановка службы named](image/18.png){#fig:018 width=60%}

## Файл зоны /var/named/master/fz/dvkalashnikova

Добавляем в прямую зону запись о новом http-сервере www.

![Файл зоны /var/named/master/fz/dvkalashnikova](image/19.png){#fig:019 width=60%}

## Файл зоны /var/named/master/rz/192.168.1

Аналогичную запись добавляем в обратную зону.

![Файл зоны /var/named/master/rz/192.168.1](image/20.png){#fig:020 width=60%}

## Удаление журналов

Удаляем журналы из папок прямой и обратной зон, чтобы применить изменения.

![Удаление журналов](image/21.png){#fig:021 width=60%}

## Создание конфигурационных файлов

Создаём файлы конфигурации для двух страниц — server и www.

![Создание конфигурационных файлов](image/22.png){#fig:022 width=60%}

## server.dvkalashnikova.net

Помещаем в первый файл настройки виртуального хоста server.dvkalashnikova.net.

![server.dvkalashnikova.net](image/23.png){#fig:023 width=60%}

## www.dvkalashnikova.net

Во второй файл помещаем настройки виртуального хоста www.dvkalashnikova.net.

![www.dvkalashnikova.net](image/24.png){#fig:024 width=60%}

## Файлы index.html

Создаём папки сайтов и кладём в них простые приветственные страницы index.html.

![Файлы index.html](image/25.png){#fig:025 width=60%}

## Обновление меток и перезапуск службы

Обновляем метки SELinux и перезапускаем службу httpd.

![Обновление меток и перезапуск службы](image/26.png){#fig:026 width=60%}

## server.dvkalashnikova.net

С клиента переходим по адресу server.dvkalashnikova.net — видим приветственную страницу.

![server.dvkalashnikova.net](image/27.png){#fig:027 width=60%}

## Обновление конфигурации vagrant

Переносим готовые конфиги в папку provision/server и создаём скрипт http.sh.

![Обновление конфигурации vagrant](image/28.png){#fig:028 width=60%}

## Скрипт http.sh

В скрипте http.sh описываем алгоритм автоматической настройки http-сервера.

![Скрипт http.sh](image/29.png){#fig:029 width=60%}

## Vagrantfile

В Vagrantfile добавляем запуск скрипта http.sh при поднятии сервера.

![Vagrantfile](image/30.png){#fig:030 width=60%}

## Выводы

В результате выполнения лабораторной работы были получены навыки работы и настройки http сервера
