---
title: "Презентация"
subtitle: "Лабораторная работа №1"
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

Приобретение практических навыков установки Rocky Linux на виртуальную машину с помощью инструмента Vagrant.

## Создание папок

Для начала создадим папку с инициалами, в которой будет 2 папки.

![Создание папок](image/1.png){#fig:001 width=60%}

## Инициализация packer

Теперь инициализируем packer и сделаем билд образа.

![Инициализация packer](image/2.png){#fig:002 width=60%}

## Добавление образа в vagrant

После этого добавим его в vagrant.

![Добавление образа в vagrant](image/3.png){#fig:003 width=60%}

## Запуск сервера

Запустим через vagrant ВМ сервера.

![Запуск сервера](image/4.png){#fig:004 width=60%}

## Запуск клиента

И запустим еще клиент.

![Запуск клиента](image/5.png){#fig:005 width=60%}

## Проверка через GUI

Убедимся, что они оба работают, через графический интерфейс. Войдём туда под пользователем vagrant.

![Вход через GUI](image/6.png){#fig:006 width=60%}

## Подключение по SSH

Теперь попробуем зайти на сервер через ssh, после чего авторизируемся от имени собственного пользователя, и отключимся.

![Логин на сервере](image/7.png){#fig:007 width=60%}

## Завершение работы

Сделаем то же самое для клиента, выключим обе машины.

![Завершение работы](image/8.png){#fig:008 width=60%}

## Проверка Vagrantfile

Также убедимся, что у нас всё корректно в файле Vagrantfile.

![Проверка файла Vagrantfile](image/9.png){#fig:009 width=60%}

## Выводы

В результате выполнения лабораторной работы были получены навыки работы с vagrant.
