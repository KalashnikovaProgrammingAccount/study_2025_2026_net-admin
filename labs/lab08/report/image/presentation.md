---
## Front matter
lang: ru-RU
title: Лабораторная работа
subtitle: Номер 8
author:
  - Андрюшин Н. С. 
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 01 января 1970

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

## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
---

# Информация

## Докладчик

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

  * Андрюшин Никита Сергеевич
  * Студент
  * Российский университет дружбы народов

:::
::: {.column width="30%"}


:::
::::::::::::::

## Цель работы

Приобретение практических навыков по установке и конфигурированию SMTP-сервера

## Установка Postfix

![Установка Postfix](image/1.png){height=70%}

## Установка s-nail

![Установка s-nail](image/2.png){height=70%}

## Предварительная настройка

![Предварительная настройка](image/3.png){height=70%}

## postconf

![postconf](image/4.png){height=70%}

## Обновление конфигурации postfix

![Обновление конфигурации postfix](image/5.png){height=70%}

## postfix -n

![postfix -n](image/6.png){height=70%}

## Обновление настроек протоколов

![Обновление настроек протоколов](image/7.png){height=70%}

## Отправка письма

![Отправка письма](image/8.png){height=70%}

## Лог почты

![Лог почты](image/9.png){height=70%}

## /var/spool/mail

![/var/spool/mail](image/10.png){height=70%}

## Установка Postfix

![Установка Postfix](image/11.png){height=70%}

## установка s-nail

![установка s-nail](image/12.png){height=70%}

## Настройка протоколов на клиенте

![Настройка протоколов на клиенте](image/13.png){height=70%}

## Отправка письма

![Отправка письма](image/14.png){height=70%}

## Логи почты

![Логи почты](image/15.png){height=70%}

## Включение получчения писем из локальной сети

![Включение получчения писем из локальной сети](image/16.png){height=70%}

## Повторная отправка письма

![Повторная отправка письма](image/17.png){height=70%}

## Успешная отправка письма согласно логам

![Успешная отправка письма согласно логам](image/18.png){height=70%}

## Отправка письма пользователю

![Отправка письма пользователю](image/19.png){height=70%}

## Неуспешная доставка письма

![Неуспешная доставка письма](image/20.png){height=70%}

## postqueue -p

![postqueue -p](image/21.png){height=70%}

## Файл прямой зоны

![Файл прямой зоны](image/22.png){height=70%}

## Файл обратной зоны

![Файл обратной зоны](image/23.png){height=70%}

## Обновление списков назначения почты

![Обновление списков назначения почты](image/24.png){height=70%}

## Лог об успешно доставленом письме

![Лог об успешно доставленом письме](image/25.png){height=70%}

## Сохранение конфигурации

![Сохранение конфигурации](image/26.png){height=70%}

## mail.sh

![mail.sh](image/27.png){height=70%}

## Создание скрипта mail.sh для клиента

![Создание скрипта mail.sh для клиента](image/28.png){height=70%}

## mail.sh для клиента

![mail.sh для клиента](image/29.png){height=70%}

## vagrantfile

![vagrantfile](image/30.png){height=70%}

## Выводы

В результате выполнения лабораторной работы были получены навыки настройки smtp сервера
