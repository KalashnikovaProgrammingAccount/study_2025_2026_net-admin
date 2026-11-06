---
lang: ru-RU
title: Лабораторная работа
subtitle: Номер 10
author:
  - Калашникова Д. В.
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 6 ноября 2026

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

Освоить настройку аутентификации при работе с SMTP-сервером на практике

## Мониторинг логов

Во втором терминале сервера включаем потоковый вывод почтового лога

![Логи почты /var/log/maillog](image/1.png){#fig:001 width=60%}

## Настройка dovecot.conf

В первом терминале входим под рутом и открываем /etc/dovecot/dovecot.conf

![/etc/dovecot/dovecot.conf](image/2.png){#fig:002 width=60%}

## Добавление LMTP

В список активных протоколов добавляем lmtp

![/etc/dovecot/dovecot.conf](image/3.png){#fig:003 width=60%}

## 10-master.conf

Открываем файл /etc/dovecot/conf.d/10-master.conf

![/etc/dovecot/conf.d/10-master.conf](image/4.png){#fig:004 width=60%}

## Блок service lmtp

Внутри файла прописываем блок для службы lmtp

![service lmtp](image/5.png){#fig:005 width=40%}

## Сокет для Postfix

Указываем в postfix сокет для отправки сообщений и открываем 10-auth.conf

![Настройка сокета](image/6.png){#fig:006 width=60%}

## auth_username_format

Выставляем формат имени пользователя без указания домена

![auth_username_format](image/7.png){#fig:007 width=60%}

## Перезапуск служб

Перезапускаем postfix и dovecot

![Перезапуск postfix и dovecot](image/8.png){#fig:008 width=60%}

## Отправка письма

На клиенте отправляем письмо самому себе

![Отправка письма](image/9.png){#fig:009 width=60%}

## Логи доставки

В логах видим «saved mail to INBOX» и указание на доставку через lmtp

![Логи почты](image/10.png){#fig:010 width=40%}

## Проверка ящика

На сервере проверяем почтовый ящик — письмо на месте

![Почтовый ящик mail](image/11.png){#fig:011 width=60%}

## Возврат к 10-master.conf

Снова обращаемся к конфигурации

![/etc/dovecot/conf.d/10-master.conf](image/12.png){#fig:012 width=60%}

## Настройка service auth

- `service auth` — начало секции внутренней службы
- `unix_listener ... private/auth` — создание UNIX-сокета
- `group` и `user` — postfix
- `mode = 0660` — права доступа
- `unix_listener auth-userdb` — второй сокет
- `mode = 0600`, `user = dovecot`

![Структура service auth](image/13.png){#fig:013 width=30%}

## Правила Postfix

- `reject_unknown_recipient_domain` — отклонить при несуществующем домене
- `permit_mynetworks` — пропустить из доверенных сетей
- `reject_non_fqdn_recipient` — отклонить не-FQDN адрес
- `reject_unauth_destination` — отклонить неаутентифицированные сессии
- `reject_unverified_recipient` — отклонить непроверенного получателя
- `permit` — пропустить остальные

![Настройка почты в postfix](image/14.png){#fig:014 width=60%}

## master.cf

Редактируем файл /etc/postfix/master.cf

![/etc/postfix/master.cf](image/15.png){#fig:015 width=60%}

## Авторизация SASL

Вносим изменения для поддержки авторизации по sasl

![Включение авторизации](image/16.png){#fig:016 width=60%}

## Перезапуск служб

Снова перезапускаем postfix и dovecot

![Перезапуск postfix и dovecot](image/17.png){#fig:017 width=60%}

## Установка Telnet

На клиенте устанавливаем telnet

![Установка Telnet](image/18.png){#fig:018 width=40%}

## Авторизация

Получаем base64-ключ и проверяем авторизацию через telnet

![Авторизация по telnet](image/19.png){#fig:019 width=60%}

## Настройка сертификатов

Настраиваем сертификаты, уровень безопасности и путь к базе кэша

![Настройка postfix](image/20.png){#fig:020 width=60%}

## Повторная правка master.cf

Открываем /etc/postfix/master.cf и правим его

![/etc/postfix/master.cf](image/21.png){#fig:021 width=60%}

## Firewall

Разрешаем smtp-submission и перезапускаем postfix

![Настройка firewall](image/22.png){#fig:022 width=60%}

## openssl

Подключаемся к серверу через openssl

![openssl](image/23.png){#fig:023 width=40%}

## Авторизация через openssl

Пробуем авторизоваться — успешно

![Авторизация](image/24.png){#fig:024 width=60%}

## Настройка клиента

Меняем порт smtp на 587, включаем авторизацию и шифрование

![Настройка smtp в клиенте](image/25.png){#fig:025 width=40%}

## Тестовое письмо

Отправляем себе тестовое письмо

![Отправка письма](image/26.png){#fig:026 width=40%}

## Письмо в ящике

Убеждаемся, что оно доставлено

![Письмо в ящике](image/27.png){#fig:027 width=60%}

## Логи сервера

Проверяем по логам, что письмо получено

![Логи почты](image/28.png){#fig:028 width=40%}

## Сохранение в Vagrant

Сохраняем изменения в vagrant

![vagrant](image/29.png){#fig:029 width=60%}

## Скрипт mail.sh

Изменяем скрипт mail.sh на сервере

![mail.sh для сервера](image/30.png){#fig:030 width=40%}

## Выводы

В результате работы освоены приёмы продвинутой настройки SMTP и аутентификации

## Список литературы

1. Postfix Project. Postfix Documentation [Электронный ресурс]. — URL: https://www.postfix.org/documentation.html (дата обращения: 06.11.2026)

2. Dovecot Project. Dovecot Documentation [Электронный ресурс]. — URL: https://doc.dovecot.org/ (дата обращения: 06.11.2026)

3. IETF. RFC 4954: SMTP Service Extension for Authentication [Электронный ресурс]. — URL: https://datatracker.ietf.org/doc/html/rfc4954 (дата обращения: 06.11.2026)
