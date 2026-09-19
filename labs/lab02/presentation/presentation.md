---
title: "Презентация"
subtitle: "Лабораторная работа №2"
author:
  - Калашникова Д. В.
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 17 сентября 2026
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

Приобретение практических навыков по установке и конфигурированию DNS-сервера, усвоение принципов работы системы доменных имён.

## Запуск ВМ

Для начала запустим виртуальную машину через vagrant.

![Запуск ВМ](image/1.png){#fig:001 width=60%}

## Скачивание пакетов

Теперь скачаем пакет bind utils.

![Скачивание пакетов](image/2.png){#fig:002 width=60%}

## Проверка dig ya.ru

Используем команду dig для проверки сервисов яндекса.

![dig ya.ru](image/3.png){#fig:003 width=60%}

## Файлы конфигурации

Посмотрим на содержание файлов конфигурации dns в etc.

![Файлы конфигурации](image/4.png){#fig:004 width=30%}

## named.ca

Просмотрим теперь файл named.ca.

![named.ca](image/5.png){#fig:005 width=30%}

## named.localhost и named.loopback

Содержимое named.localhost и named.loopback.

![named.localhost и named.loopback](image/6.png){#fig:006 width=60%}

## Запуск named

Запустим теперь named и осуществим снова dig yandex.ru.

![Запуск named](image/7.png){#fig:007 width=40%}

## eth0

Теперь настроим порт eth0.

![eth0](image/8.png){#fig:008 width=60%}

## named.conf

Откроем и отредактируем named.conf.

![named.conf](image/9.png){#fig:009 width=30%}

## Правила фаервола

Установим правила фаервола.

![Правила фаервола](image/10.png){#fig:010 width=60%}

## Перемещение файла

Теперь переместим файл с настройкой конфига.

![перемещение файла](image/11.png){#fig:011 width=60%}

## Редактирование файла

И отредактируем наш файл под наши параметры.

![Редактирование файла](image/12.png){#fig:012 width=30%}

## Файл зон

То же самое сделаем с файлом зон.

![Файл зон](image/13.png){#fig:013 width=40%}

## Создание папок и настроек днс

Создадим папки с настройками днс.

![Создание папок и настроек днс](image/14.png){#fig:014 width=60%}

## nsandryushin.net

Отредактируем файл nsandryushin.net.

![nsandryushin.net](image/15.png){#fig:015 width=60%}

## Папка rz

Теперь посмотрим на файлы из папки rz.

![Папка rz](image/16.png){#fig:016 width=60%}

## Редактирование файла

Отредактируем следующим образом.

![Редактирование файла](image/17.png){#fig:017 width=60%}

## Selinux

Настроим Selinux.

![Selinux](image/18.png){#fig:018 width=60%}

## dig

Через dig попробуем подключиться к собственному днс.

![dig](image/19.png){#fig:019 width=40%}

## Конфиг вагрант

Оформим нашу работу как конфигурацию для вагранта.

![Конфиг вагрант](image/20.png){#fig:020 width=60%}

## скрипт

И напишем скрипт для загрузки вагранта.

![скрипт](image/21.png){#fig:021 width=30%}

## vagrantfile

И в vagrantfile будем загружать этот скрипт.

![vagrantfile](image/22.png){#fig:022 width=60%}

## Выводы

В результате выполнения работы были получены навыки настройки днс.
