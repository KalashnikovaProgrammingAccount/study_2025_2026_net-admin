---
title: "Отчёт о лабораторной работе"
subtitle: "Лабораторная работа 11"
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

Освоить на практике методику предоставления удалённого доступа к серверу с использованием протокола SSH.

# Выполнение лабораторной работы

Работа начинается с сервера: входим в систему, получаем права суперпользователя и сразу же назначаем для root новый пароль (рис. [-@fig:001]).

![Смена пароля root](image/1.png){#fig:001 width=70%}

В соседнем терминале включаем непрерывный просмотр системного журнала (рис. [-@fig:002]).

![Мониторинг логов](image/2.png){#fig:002 width=70%}

Перемещаемся на клиентский узел и пробуем установить SSH-соединение с сервером, используя учётные данные root (рис. [-@fig:003]).

![Попытка входа под root](image/3.png){#fig:003 width=70%}

На сервере в файле /etc/ssh/sshd_config корректируем параметр PermitRootLogin и перезапускаем демон SSH (рис. [-@fig:004]).

![Настройка PermitRootLogin](image/4.png){#fig:004 width=70%}

С клиента снова пробуем войти под root, но получаем отказ из-за неверного пароля (рис. [-@fig:005]).

![Ошибка входа](image/5.png){#fig:005 width=70%}

В логах фиксируем сообщение о неудачной проверке пароля (рис. [-@fig:006]).

![Отказ в логах](image/6.png){#fig:006 width=70%}

Зато подключение под собственной учётной записью проходит успешно (рис. [-@fig:007]).

![Успешный вход](image/7.png){#fig:007 width=70%}

Дополняем конфигурацию SSH, прописывая список пользователей, которым разрешена авторизация (рис. [-@fig:008]).

![Разрешённые пользователи](image/8.png){#fig:008 width=70%}

Выполняем перезапуск службы SSH (рис. [-@fig:009]).

![Перезапуск sshd](image/9.png){#fig:009 width=70%}

Снова проверяем вход с клиента под пользователем (рис. [-@fig:010]).

![Повторная проверка](image/10.png){#fig:010 width=70%}

Возвращаемся в конфигурационный файл на сервере и добавляем пользователя в белый список (рис. [-@fig:011]).

![Добавление в белый список](image/11.png){#fig:011 width=70%}

После рестарта службы фиксируем успешный вход с клиента (рис. [-@fig:012]).

![Успешное подключение](image/12.png){#fig:012 width=70%}

В конфигурации прописываем дополнительный порт 2022 (рис. [-@fig:013]).

![Добавление порта 2022](image/13.png){#fig:013 width=70%}

Перезапускаем SSH и получаем ошибку о невозможности привязаться к порту 2022 из-за прав доступа (рис. [-@fig:014]).

![Ошибка порта](image/14.png){#fig:014 width=70%}

В логах видим, что блокировку осуществляет SELinux (рис. [-@fig:015]).

![Ошибка SELinux](image/15.png){#fig:015 width=70%}

Меняем правила SELinux, разрешая использование 2022-го порта, и открываем его в файерволе. Перезапускаем службу и проверяем её статус (рис. [-@fig:016]).

![Настройка SELinux и firewall](image/16.png){#fig:016 width=70%}

С клиента проверяем подключение по обоим портам — 22 и 2022 работают успешно (рис. [-@fig:017]).

![Подключение по портам](image/17.png){#fig:017 width=70%}

Включаем в конфигурации аутентификацию по ключам (рис. [-@fig:018]).

![Авторизация по ключу](image/18.png){#fig:018 width=70%}

Рестартуем SSH. На клиенте создаём RSA-ключ и копируем его на сервер (рис. [-@fig:019]).

![Генерация ключа](image/19.png){#fig:019 width=70%}

Проверяем подключение — пароль больше не запрашивается (рис. [-@fig:020]).

![Вход без пароля](image/20.png){#fig:020 width=70%}

Просматриваем список служб, использующих TCP-соединения (рис. [-@fig:021]).

![Список TCP](image/21.png){#fig:021 width=70%}

С клиента настраиваем проброс порта 8080 на 80-й порт сервера (рис. [-@fig:022]).

![Проброс порта](image/22.png){#fig:022 width=70%}

Открываем в браузере адрес localhost:8080 и видим страницу сервера server.dvkalashnikova.net (рис. [-@fig:023]).

![Сайт через localhost](image/23.png){#fig:023 width=70%}

Удалённо с клиента выполняем на сервере консольные команды через SSH (рис. [-@fig:024]).

![Вызов утилит](image/24.png){#fig:024 width=70%}

![Вызов утилит](image/25.png){#fig:025 width=70%}

В конфигурационном файле SSH на сервере включаем форвардинг X11 (рис. [-@fig:026]).

![Включение X11](image/26.png){#fig:026 width=70%}

Удалённо запускаем графическое приложение Firefox (рис. [-@fig:027]).

![Запуск Firefox](image/27.png){#fig:027 width=70%}

На сервере открывается окно Firefox (рис. [-@fig:028]).

![Firefox на сервере](image/28.png){#fig:028 width=70%}

Сохраняем рабочие конфигурации в каталог vagrant (рис. [-@fig:029]).

![Сохранение в vagrant](image/29.png){#fig:029 width=70%}

Создаём скрипт ssh.sh и вносим в него все шаги настройки (рис. [-@fig:030]).

![Скрипт ssh.sh](image/30.png){#fig:030 width=70%}

В файле Vagrantfile добавляем вызов нашего скрипта (рис. [-@fig:031]).

![Vagrantfile](image/31.png){#fig:031 width=70%}

# Выводы

По итогам работы были получены практические навыки по настройке удалённого SSH-доступа, включая управление списком пользователей, настройку портов, работу с SELinux, авторизацию по ключам и проброс портов.

# Список литературы {.unnumbered}

1. OpenBSD Project. OpenSSH Manual Pages [Электронный ресурс]. — URL: https://www.openssh.com/manual.html (дата обращения: 12.11.2026).
2. Red Hat. Configuring SSH on Red Hat Enterprise Linux [Электронный ресурс]. — URL: https://docs.redhat.com/ (дата обращения: 12.11.2026).
3. IETF. RFC 4253: The Secure Shell (SSH) Transport Layer Protocol [Электронный ресурс]. — URL: https://datatracker.ietf.org/doc/html/rfc4253 (дата обращения: 12.11.2026).
