---
## Front matter
lang: ru-RU
title: Лабораторная работа
subtitle: Номер 10
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

Приобретение практических навыков по конфигурированию SMTP-сервера в части настройки аутентификации

## Логи почты /var/log/maillog

![Логи почты /var/log/maillog](image/1.png){height=60%}

## /etc/dovecot/dovecot.conf

![/etc/dovecot/dovecot.conf](image/2.png){height=60%}

## /etc/dovecot/dovecot.conf

![/etc/dovecot/dovecot.conf](image/3.png){height=60%}

## /etc/dovecot/conf.d/10-master.conf

![/etc/dovecot/conf.d/10-master.conf](image/4.png){height=60%}

## service lmtp

![service lmtp](image/5.png){height=60%}

## Настройка сокета

![Настройка сокета](image/6.png){height=60%}

## auth_username_format

![auth_username_format](image/7.png){height=60%}

## Перезапуск postfix и dovecot

![Перезапуск postfix и dovecot](image/8.png){height=60%}

## Отправка письма

![Отправка письма](image/9.png){height=60%}

## Логи почты

![Логи почты](image/10.png){height=60%}

## Почтовый ящик mail

![Почтовый ящик mail](image/11.png){height=60%}

## /etc/dovecot/conf.d/10-master.conf

![/etc/dovecot/conf.d/10-master.conf](image/12.png){height=60%}

## Структура service auth

![Структура service auth](image/13.png){height=60%}

## Настройка почты в postfix

![Настройка почты в postfix](image/14.png){height=60%}

## /etc/postfix/master.cf

![/etc/postfix/master.cf](image/15.png){height=60%}

## Включение авторизации

![Включение авторизации](image/16.png){height=60%}

## Перезапуск postfix и dovecot

![Перезапуск postfix и dovecot](image/17.png){height=60%}

## Установка Telnet

![Установка Telnet](image/18.png){height=60%}

## Авторизация по telnet

![Авторизация по telnet](image/19.png){height=60%}

## Настройка postfix

![Настройка postfix](image/20.png){height=60%}

## /etc/postfix/master.cf

![/etc/postfix/master.cf](image/21.png){height=60%}

## Настройка firewall

![Настройка firewall](image/22.png){height=60%}

## openssl

![openssl](image/23.png){height=60%}

## Авторизация

![Авторизация](image/24.png){height=60%}

## Настройка smtp в клиенте

![Настройка smtp в клиенте](image/25.png){height=60%}

## Отправка письма

![Отправка письма](image/26.png){height=60%}

## Письмо в ящике

![Письмо в ящике](image/27.png){height=60%}

## Логи почты

![Логи почты](image/28.png){height=60%}

## vagrant

![vagrant](image/29.png){height=60%}

## mail.sh для сервера

![mail.sh для сервера](image/30.png){height=60%}

## mail.sh для клиента

![mail.sh для клиента](image/31.png){height=60%}

## Выводы

В результате выполнения лабораторной работы были получены навыки продвинутой настройки smtp и авторизации
