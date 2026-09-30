---
lang: ru-RU
title: Прзентация
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

![Запуск сервера](image/1.png){#fig:001 width=60%}

## Генерация сертификата

![Создание сертификата](image/2.png){#fig:002 width=40%}

## Правка конфигурационного файла httpd

![Редактирование конфигурационного файла httpd](image/3.png){#fig:003 width=60%}

## www.dvkalashnikova.net.conf

![www.dvkalashnikova.net.conf](image/4.png){#fig:004 width=60%}

## Настройки фаервола

![Настройка фаервола](image/5.png){#fig:005 width=30%}

## Предупреждение браузера

![Предупреждение](image/6.png){#fig:006 width=60%}

## Открытие сайта

![Подключение к сайту](image/7.png){#fig:007 width=60%}

## Просмотр сертификата

![Сертификат](image/8.png){#fig:008 width=40%}

## Установка PHP

![Установка php](image/9.png){#fig:009 width=60%}

## Замена index.html на index.php

![Замена файла index.html на index.php](image/10.png){#fig:010 width=60%}

## Содержимое index.php

![Содержимое index.php](image/11.png){#fig:011 width=60%}

## Настройка прав доступа

![Исправление настроек доступа](image/12.png){#fig:012 width=60%}

## Как выглядит сайт

![Отображение сайта](image/13.png){#fig:013 width=60%}

## Сохранение конфигурации

![Сохранение конфигурации](image/14.png){#fig:014 width=60%}

## Скрипт http.sh

![http.sh](image/15.png){#fig:015 width=60%}

## Выводы

В ходе лабораторной работы получены навыки расширенного конфигурирования HTTP-сервера Apache и организации https.

## Список литературы

1. Apache Software Foundation. Apache HTTP Server Documentation [Электронный ресурс]. — URL: https://httpd.apache.org/docs/ (дата обращения: 25.09.2026).

2. Apache Software Foundation. mod_ssl — SSL/TLS Encryption [Электронный ресурс]. — URL: https://httpd.apache.org/docs/2.4/mod/mod_ssl.html (дата обращения: 25.09.2026).

3. Red Hat. Documentation [Электронный ресурс]. — URL: https://docs.redhat.com/ (дата обращения: 25.09.2026).
