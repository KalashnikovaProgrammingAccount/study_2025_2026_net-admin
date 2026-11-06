---
title: "Отчёт о лабораторной работе"
subtitle: "Лабораторная работа 10"
author: "Калашникова Дарья Викторовна"
lang: ru-RU
toc-title: "Содержание"
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl
toc: true
toc-depth: 2
lof: true
lot: true
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
babel-lang: russian
babel-otherlangs: english
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
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float}
  - \floatplacement{figure}{H}
---

# Цель работы

Освоить настройку аутентификации при работе с SMTP-сервером на практике.

# Выполнение лабораторной работы

Во втором терминале сервера включаем потоковый вывод почтового лога (рис. [-@fig:001]).

![Логи почты /var/log/maillog](image/1.png){#fig:001}

В первом терминале сервера входим под рутом и открываем файл /etc/dovecot/dovecot.conf (рис. [-@fig:002]).

![/etc/dovecot/dovecot.conf](image/2.png){#fig:002}

В список активных протоколов добавляем lmtp (рис. [-@fig:003]).

![/etc/dovecot/dovecot.conf](image/3.png){#fig:003}

Затем открываем файл /etc/dovecot/conf.d/10-master.conf (рис. [-@fig:004]).

![/etc/dovecot/conf.d/10-master.conf](image/4.png){#fig:004}

Внутри него прописываем блок для службы lmtp (рис. [-@fig:005]).

![service lmtp](image/5.png){#fig:005}

Затем указываем в postfix сокет, через который будут отправляться сообщения. После этого открываем /etc/dovecot/conf.d/10-auth.conf (рис. [-@fig:006]).

![Настройка сокета](image/6.png){#fig:006}

В этом файле выставляем значение auth_username_format, которое задаёт формат имени пользователя при аутентификации. В нашем случае домен не указывается (рис. [-@fig:007]).

![auth_username_format](image/7.png){#fig:007}

Перезапускаем postfix и dovecot (рис. [-@fig:008]).

![Перезапуск postfix и dovecot](image/8.png){#fig:008}

Переходим на клиентскую машину и пробуем отправить письмо самому себе (рис. [-@fig:009]).

![Отправка письма](image/9.png){#fig:009}

В логах на сервере (которые мы открыли в начале) видим, что письмо попало в ящик — об этом говорит запись «saved mail to INBOX». Кроме того, в логах появилось указание, что доставка идёт через lmtp (passing ... to transport=lmtp) (рис. [-@fig:010]).

![Логи почты](image/10.png){#fig:010}

Открываем на сервере почтовый ящик и убеждаемся, что письмо действительно на месте (рис. [-@fig:011]).

![Почтовый ящик mail](image/11.png){#fig:011}

Снова обращаемся к /etc/dovecot/conf.d/10-master.conf (рис. [-@fig:012]).

![/etc/dovecot/conf.d/10-master.conf](image/12.png){#fig:012}

Приводим блок службы auth к следующему виду. Разбираем по строкам:

`service auth { ... }` — начало секции конфигурации для внутренней службы Dovecot auth.

`unix_listener /var/spool/postfix/private/auth { ... }` — Dovecot создаёт слушатель на основе UNIX-сокета.

`group = postfix` — группа-владелец файла сокета.

`user = postfix` — пользователь-владелец файла сокета.

`mode = 0660` — права доступа к сокету в восьмеричном виде.

`unix_listener auth-userdb { ... }` — создание второго UNIX-сокета.

`mode = 0600` — права доступа для внутреннего сокета.

`user = dovecot` — пользователь-владелец dovecot (рис. [-@fig:013]).

![Структура service auth](image/13.png){#fig:013}

Теперь настраиваем аутентификацию smtp в postfix и задаём правила обработки и фильтрации почты. Разбираем опции:

`reject_unknown_recipient_domain` — отклонить письмо, если домен получателя не существует.

`permit_mynetworks` — пропустить письмо без проверок, если IP клиента входит в список доверенных сетей.

`reject_non_fqdn_recipient` — отклонить, если адрес получателя не является полностью определённым доменным именем.

`reject_unauth_destination` — отклонить письмо, если домен получателя не локальный для этого сервера и сессия не аутентифицирована.

`reject_unverified_recipient` — отклонить, если Postfix не может проверить существование получателя.

`permit` — если предыдущие правила не отклонили и не разрешили письмо, оно пропускается (рис. [-@fig:014]).

![Настройка почты в postfix](image/14.png){#fig:014}

Далее редактируем файл /etc/postfix/master.cf (рис. [-@fig:015]).

![/etc/postfix/master.cf](image/15.png){#fig:015}

Вносим изменения так, чтобы smtp поддерживал авторизацию по sasl (рис. [-@fig:016]).

![Включение авторизации](image/16.png){#fig:016}

Перезапускаем postfix и dovecot (рис. [-@fig:017]).

![Перезапуск postfix и dovecot](image/17.png){#fig:017}

На клиенте устанавливаем telnet (рис. [-@fig:018]).

![Установка Telnet](image/18.png){#fig:018}

Получаем ключ авторизации — строку с логином и паролем, зашифрованную в base64. Подключаемся к почтовому серверу по telnet, проверяем соединение. Затем командой auth пытаемся авторизоваться, используя этот ключ. Авторизация проходит успешно (Authentication successful) (рис. [-@fig:019]).

![Авторизация по telnet](image/19.png){#fig:019}

Настраиваем сертификаты для postfix, а также уровень безопасности и путь к базе кэша (рис. [-@fig:020]).

![Настройка postfix](image/20.png){#fig:020}

Снова открываем /etc/postfix/master.cf и правим его следующим образом (рис. [-@fig:021]).

![/etc/postfix/master.cf](image/21.png){#fig:021}

Настраиваем firewall — разрешаем smtp-submission — и перезапускаем postfix (рис. [-@fig:022]).

![Настройка firewall](image/22.png){#fig:022}

Подключаемся к серверу через openssl (рис. [-@fig:023]).

![openssl](image/23.png){#fig:023}

Пробуем авторизоваться — всё проходит успешно (рис. [-@fig:024]).

![Авторизация](image/24.png){#fig:024}

В почтовом клиенте меняем порт smtp на 587, включаем авторизацию и шифрование (рис. [-@fig:025]).

![Настройка smtp в клиенте](image/25.png){#fig:025}

Отправляем себе тестовое письмо (рис. [-@fig:026]).

![Отправка письма](image/26.png){#fig:026}

Убеждаемся, что оно доставлено и лежит в ящике (рис. [-@fig:027]).

![Письмо в ящике](image/27.png){#fig:027}

По логам на сервере проверяем, что письмо действительно получено (рис. [-@fig:028]).

![Логи почты](image/28.png){#fig:028}

Сохраняем внесённые изменения в vagrant (рис. [-@fig:029]).

![vagrant](image/29.png){#fig:029}

На сервере изменяем скрипт mail.sh следующим образом (рис. [-@fig:030]).

![mail.sh для сервера](image/30.png){#fig:030}

# Выводы

В результате работы освоены приёмы продвинутой настройки SMTP и аутентификации.

# Список литературы {.unnumbered}

1. Postfix Project. Postfix Documentation [Электронный ресурс]. — URL: https://www.postfix.org/documentation.html (дата обращения: 06.11.2026).

2. Dovecot Project. Dovecot Documentation [Электронный ресурс]. — URL: https://doc.dovecot.org/ (дата обращения: 06.11.2026).

3. IETF. RFC 4954: SMTP Service Extension for Authentication [Электронный ресурс]. — URL: https://datatracker.ietf.org/doc/html/rfc4954 (дата обращения: 06.11.2026).
