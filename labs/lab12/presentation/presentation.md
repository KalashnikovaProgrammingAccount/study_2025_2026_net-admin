---
title: "Управление системным временем и синхронизация NTP"
subtitle: "Лабораторная работа 12"
author: "Калашникова Дарья Викторовна"
institute: "Российский университет дружбы народов"
date: 20 ноября 2026
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

## Докладчик

:::::::::::::: {.columns align=center}
::: {.column width="70%"}
  * Калашникова Дарья Викторовна
  * Студент
  * Российский университет дружбы народов
  * [1132243108@pfur.ru]
:::
::: {.column width="30%"}
![](image/kalashnikova.jpeg)
:::
::::::::::::::

## Цель работы

Освоить методы управления системным временем и настройки его синхронизации через NTP.

## Проверка текущего времени на сервере

Утилита `timedatectl` показывает: часовой пояс UTC, системные часы синхронизированы, служба NTP активна.

![Вывод timedatectl](image/1.png){width=60%}

## Детальные свойства времени

Опция `show` выводит подробный список свойств временной конфигурации.

![timedatectl show](image/2.png){width=60%}

## Проверка времени на клиенте

Клиент тоже находится в UTC, синхронизация времени включена.

![timedatectl на клиенте](image/3.png){width=60%}

## Системное время на сервере

Команда `date` показывает текущее время. С флагом `-R` — вывод в формате RFC 2822.

![date на сервере](image/4.png){width=60%}

## Системное время на клиенте

Проверяем, что клиентское время совпадает с серверным.

![date на клиенте](image/5.png){width=60%}

## Аппаратное время (RTC) на сервере

Утилита `hwclock` показывает время, которое хранится в аппаратных часах материнской платы.

![hwclock на сервере](image/6.png){width=60%}

## Аппаратное время (RTC) на клиенте

Аналогичная проверка на клиенте.

![hwclock на клиенте](image/7.png){width=60%}

## Источники точного времени на сервере

`chronyc sources` показывает список внешних серверов, с которыми синхронизируется сервер.

![chronyc sources на сервере](image/8.png){width=60%}

## Источники точного времени на клиенте (до настройки)

Сначала клиент тоже использует внешние пулы.

![chronyc sources на клиенте](image/9.png){width=60%}

## Настройка NTP-сервера для локальной сети

В `/etc/chrony.conf` добавляем директиву `allow 192.168.0.0/16` — разрешаем клиентам из локальной сети запрашивать время.

![Настройка chrony.conf](image/10.png){width=60%}

## Перезапуск службы и настройка Firewall

Применяем изменения и открываем доступ для NTP-трафика.

![Перезапуск и Firewall](image/11.png){width=60%}

## Настройка клиента на локальный NTP-сервер

В `/etc/chrony.conf` на клиенте указываем сервер `server.dvkalashnikova.net` с параметром `iburst`.

![Настройка клиента](image/12.png){width=60%}

## Перезапуск chronyd на клиенте

Применяем настройки.

![Перезапуск chronyd](image/13.png){width=60%}

## Проверка источников на сервере

Сервер синхронизируется с внешними эталонными серверами.

![chronyc sources после настройки](image/14.png){width=60%}

## Проверка источников на клиенте

В выводе `chronyc sources` видно, что `server.dvkalashnikova.net` (символ `+`) распознан как кандидат на синхронизацию, Stratum 3.

![Проверка источников на клиенте](image/15.png){width=60%}

## Детальная информация о синхронизации

`chronyc tracking` показывает Reference ID, стратум, частоту и задержки.

![chronyc tracking](image/16.png){width=60%}

## Сохранение настроек в Vagrant

Создаём скрипт `ntp.sh` для автоматизации.

![Vagrant](image/17.png){width=60%}

## Скрипт ntp.sh для сервера

В скрипте прописаны команды настройки NTP и Firewall.

![Скрипт для сервера](image/18.png){width=60%}

## Скрипт ntp.sh для клиента

Аналогичные действия на клиентской машине.

![Скрипт для клиента](image/19.png){width=60%}

## Содержимое клиентского скрипта

Настройка chrony на клиенте: указание локального сервера времени.

![Содержимое клиентского скрипта](image/20.png){width=60%}

## Vagrantfile

Добавляем вызов скриптов в конфигурацию Vagrant.

![Vagrantfile](image/21.png){width=60%}

## Выводы

Получены навыки настройки системного времени и NTP-синхронизации на сервере и клиенте.

## Источники

1. chrony Project. chrony Documentation [Электронный ресурс]. — URL: https://chrony-project.org/documentation.html (дата обращения: 20.11.2026).
2. Red Hat. Configuring time synchronization with chrony [Электронный ресурс]. — URL: https://docs.redhat.com (дата обращения: 20.11.2026).
3. Oracle Linux. Managing System Time and NTP [Электронный ресурс]. — URL: https://docs.oracle.com (дата обращения: 20.11.2026).
4. Linux man-pages. timedatectl(1) [Электронный ресурс]. — URL: https://man7.org/linux/man-pages/man1/timedatectl.1.html (дата обращения: 20.11.2026).
5. Linux man-pages. chrony.conf(5), chronyc(1) [Электронный ресурс]. — URL: https://man7.org/linux/man-pages/man5/chrony.conf.5.html (дата обращения: 20.11.2026).
