---
title: "Отчёт о лабораторной работе"
subtitle: "Лабораторная работа 12"
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

Освоить методы управления системным временем и настройки его синхронизации через NTP.

# Выполнение лабораторной работы

Первым делом на сервере изучим текущие параметры даты и времени с помощью утилиты `timedatectl`. Выяснилось, что система работает в часовом поясе UTC, системные часы синхронизированы, а служба NTP находится в активном состоянии (рис. [-@fig:001]).

![Вывод команды timedatectl на сервере](image/1.png){#fig:001}

Затем проведём несколько опытов с параметрами `timedatectl`. В частности, применим опцию `show`, чтобы вывести детальный список свойств временной конфигурации (рис. [-@fig:002]).

![Просмотр свойств времени с помощью timedatectl show](image/2.png){#fig:002}

Аналогичную проверку временных параметров выполним на клиентском узле. Клиент тоже находится в UTC, и сетевая синхронизация времени включена (рис. [-@fig:003]).

![Вывод команды timedatectl на клиенте](image/3.png){#fig:003}

На сервере посмотрим текущее системное время командой `date`. Поэкспериментируем с ключами: например, выведем дату в формате RFC 2822 с помощью флага `-R` (рис. [-@fig:004]).

![Эксперименты с параметрами команды date на сервере](image/4.png){#fig:004}

На клиенте также посмотрим системное время (рис. [-@fig:005]).

![Просмотр системного времени на клиенте](image/5.png){#fig:005}

Далее на сервере проверим аппаратное время (RTC) с помощью утилиты `hwclock` (рис. [-@fig:006]).

![Просмотр аппаратного времени на сервере](image/6.png){#fig:006}

Похожим образом посмотрим аппаратное время и на клиенте (рис. [-@fig:007]).

![Просмотр аппаратного времени на клиенте](image/7.png){#fig:007}

Проверим источники точного времени на сервере через `chronyc sources`. Видно, что сервер синхронизируется с внешними серверами (рис. [-@fig:008]).

![Просмотр источников времени на сервере](image/8.png){#fig:008}

Проверим источники точного времени и на клиенте. На этом этапе клиент тоже использует внешние пулы для синхронизации (рис. [-@fig:009]).

![Просмотр источников времени на клиенте](image/9.png){#fig:009}

Отредактируем конфигурационный файл `/etc/chrony.conf` на сервере. Добавим директиву `allow 192.168.0.0/16`, которая разрешает клиентам из локальной сети запрашивать точное время (рис. [-@fig:010]).

![Настройка доступа к NTP-серверу для локальной сети](image/10.png){#fig:010}

Перезапустим службу синхронизации `chronyd`, чтобы применить изменения, и добавим службу NTP в исключения фаервола на сервере для входящих подключений (рис. [-@fig:011]).

![Перезапуск службы и настройка Firewall на сервере](image/11.png){#fig:011}

Отредактируем `/etc/chrony.conf` на клиенте. Укажем локальный сервер `server.dvkalashnikova.net` в качестве источника времени с параметром `iburst` для ускоренной первичной синхронизации (рис. [-@fig:012]).

![Настройка клиента на использование локального NTP-сервера](image/12.png){#fig:012}

Перезапустим службу `chronyd` на клиенте, чтобы настройки вступили в силу (рис. [-@fig:013]).

![Перезапуск службы chronyd на клиенте](image/13.png){#fig:013}

Снова посмотрим источники синхронизации на сервере. Вывод подтверждает наличие активных соединений с внешними эталонными серверами (рис. [-@fig:014]).

![Проверка источников времени на сервере](image/14.png){#fig:014}

Затем проверим источники времени на клиенте после изменения конфигурации. Команда `chronyc sources` показывает список серверов. В выводе видно, что настроенный нами `server.dvkalashnikova.net` (помечен символом `+`) распознан как кандидат на синхронизацию, имеющий Stratum 3. Это подтверждает, что DNS настроен верно, а сервер доступен (рис. [-@fig:015]).

![Проверка источников времени на клиенте](image/15.png){#fig:015}

Чтобы получить более подробную информацию о процессе синхронизации на сервере, применим команду `chronyc tracking`. Вывод содержит данные о Reference ID (вышестоящем сервере), текущем стратуме (Stratum 3), а также о частоте и задержках (рис. [-@fig:016]).

![Просмотр детальной информации о синхронизации на сервере](image/16.png){#fig:016}

Внесём изменения в Vagrant и создадим скрипт `ntp.sh` (рис. [-@fig:017]).

![Vagrant](image/17.png){#fig:017}

Добавим следующие изменения в файл `ntp.sh` (рис. [-@fig:018]).

![Содержимое скрипта настройки ntp.sh для сервера](image/18.png){#fig:018}

Похожие действия по подготовке окружения выполним и на виртуальной машине client. Создадим исполняемый файл `ntp.sh` (рис. [-@fig:019]).

![Vagrant](image/19.png){#fig:019}

Добавим следующие изменения в файл `ntp.sh` (рис. [-@fig:020]).

![Содержимое скрипта настройки ntp.sh для клиента](image/20.png){#fig:020}

Внесём изменения в `Vagrantfile` (рис. [-@fig:021]).

![Vagrantfile](image/21.png){#fig:021}

# Выводы

В результате выполнения лабораторной работы были получены навыки настройки системного времени и синхронизации NTP.

# Список литературы {.unnumbered}

1. **Linux Kernel Archives.** autofs — how it works [Электронный ресурс]. — URL: https://docs.kernel.org/filesystems/autofs.html (дата обращения: 20.11.2026).
2. **Red Hat.** Mounting file systems on demand [Электронный ресурс]. — URL: https://docs.redhat.com (дата обращения: 20.11.2026).
3. **Oracle Linux.** Managing On-Demand Mounts Using autofs [Электронный ресурс]. — URL: https://docs.oracle.com (дата обращения: 20.11.2026).
4. **Red Hat.** Setting up a Kerberos-aware NFS Client [Электронный ресурс]. — URL: https://docs.redhat.com (дата обращения: 20.11.2026).
5. **Справочные страницы руководства:** autofs(5), automount(8) [Электронный ресурс]. — URL: https://man7.org/linux/man-pages/man5/autofs.5.html (дата обращения: 20.11.2026).
