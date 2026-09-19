---
title: "Отчёт о лабораторной работе"
subtitle: "Лабораторная работа 3"
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

Приобретение практических навыков по установке и конфигурированию DHCP-сервера.

# Выполнение лабораторной работы

Зайдём под рутом и установим пакет для настройки dhcp - kea (рис. [-@fig:001]).

![Установка kea](image/1.png){#fig:001 width=70%}

Перед изменением конфигурационного файла, на всякий случай сделаем бекап и отредактируем его (рис. [-@fig:002]).

![Бекап конфига](image/2.png){#fig:002 width=70%}

Мы поменяем изначальные данные на свои - изменим доменное имя на собственное, а также поставим ip на ip нашей машины - 192.168.1.1 (рис. [-@fig:003]).

![Редактирование конфига](image/3.png){#fig:003 width=70%}

Спустимся ниже и настроим свою подсеть следующим образом (рис. [-@fig:004]).

![Настройка подсети](image/4.png){#fig:004 width=70%}

И установим интерфейс для dhcp как eth1 (рис. [-@fig:005]).

![Установка интерфейса](image/5.png){#fig:005 width=70%}

Загрузим конфиг и убедимся, что нигде нет критических ошибок (рис. [-@fig:006]).

![Загрузка конфига](image/6.png){#fig:006 width=70%}

Перезагрузим системные демоны (рис. [-@fig:007]).

![Перезагрузка демонов](image/7.png){#fig:007 width=70%}

И слегка отредактируем наш файл с прошлой лабораторной работы в папке fz, добавив запись о dhcp (рис. [-@fig:008]).

![Редактирование fz](image/8.png){#fig:008 width=70%}

То же самое сделаем с rz (рис. [-@fig:009]).

![rz](image/9.png){#fig:009 width=70%}

Перезагрузим сервер ДНС и убедимся, что мы можем пингануть dhcp сервер (рис. [-@fig:010]).

![Пинг dhcp](image/10.png){#fig:010 width=70%}

Теперь настроим firewall и обновим метки selinux (рис. [-@fig:011]).

![firewall и selinux](image/11.png){#fig:011 width=70%}

Убедимся по логам, что сервер ДНС работает и не выдаёт ошибок (рис. [-@fig:012]).

![Логи сервера](image/12.png){#fig:012 width=70%}

Теперь запускаем dhcp сервер (рис. [-@fig:013]).

![Запуск dhcp](image/13.png){#fig:013 width=70%}

Далее убедимся в том, что в нашей папке клиента в vagrant представлен скрипт следующего содержания для настройки сети, берущей свой ip по dhcp (рис. [-@fig:014]).

![Скрипт для клиента](image/14.png){#fig:014 width=70%}

В Vagrantfile мы убедимся, что этот скрипт прописан для запуска (рис. [-@fig:015]).

![Vagrantfile](image/15.png){#fig:015 width=70%}

Когда приготовления завершены, мы можем запустить клиент (рис. [-@fig:016]).

![Запуск клиента](image/16.png){#fig:016 width=70%}

Зайдя в клиент, через ifconfig убедимся, что айпи был получен с сервера. Это так, айпи назначился как 192.168.1.30 (рис. [-@fig:017]).

![ifconfig](image/17.png){#fig:017 width=70%}

Информация о назначении айпи также хранится в файле /var/lib/kea/kea-leases4.csv на сервере (рис. [-@fig:018]).

![Таблица с назначениями](image/18.png){#fig:018 width=70%}

Теперь создадим ключ sha512 и убедимся в том, что он создался (рис. [-@fig:019]).

![Ключ sha512](image/19.png){#fig:019 width=70%}

Этот ключ добавим в /etc/named.conf (рис. [-@fig:020]).

![Добавление ключа](image/20.png){#fig:020 width=70%}

Обновим файл /etc/named/dvkalashnikova.net, добавив туда dhcp (рис. [-@fig:021]).

![Обновление файла](image/21.png){#fig:021 width=70%}

Проверим корректность конфига на синтаксис и перезапустим DNS службу, а также создадим файл с ключом (рис. [-@fig:022]).

![Применение изменений](image/22.png){#fig:022 width=70%}

В созданный файл вставим ключ, который мы сгенерировали ранее (рис. [-@fig:023]).

![Порядок монтирования](image/23.png){#fig:023 width=70%}

Поменяем права и владельца созданного файла, предоставив его системному пользователю службы (рис. [-@fig:024]).

![Смена прав файла](image/24.png){#fig:024 width=70%}

Теперь заполним файл конфигурации ddns, который перепишем с нуля согласно данному шаблону, поменяв имя на свой домен (рис. [-@fig:025]).

![Изменение конфигурации](image/25.png){#fig:025 width=70%}

Предоставим этот файл во владение системному пользователю, а также загрузим эту конфигурацию, и убедимся, что она загружена успешно. После этого перезапустим ddns службу (рис. [-@fig:026]).

![Перезапуск ddns](image/26.png){#fig:026 width=70%}

Теперь добавим информацию о ddns в наш файл с конфигурацией dhcp (рис. [-@fig:027]).

![Добавление информации о ddns](image/27.png){#fig:027 width=70%}

Вновь загрузим конфигурацию и перезапустим службу dhcp (рис. [-@fig:028]).

![Перезапуск службы с применением изменений](image/28.png){#fig:028 width=70%}

Теперь на клиенте перезапустим интернет, чтобы обновить данные (рис. [-@fig:029]).

![Обновление данных](image/29.png){#fig:029 width=70%}

Теперь через dig получим информацию о нашем сервере (рис. [-@fig:030]).

![dig](image/30.png){#fig:030 width=70%}

Теперь переместим данные созданных ранее конфигураций в вагрант, после чего создадим скрипт (рис. [-@fig:031]).

![Перенос конфигурации](image/31.png){#fig:031 width=70%}

В скрипте напишем алгоритм настройки dhcp (рис. [-@fig:032]).

![Скрипт vagrant](image/32.png){#fig:032 width=70%}

# Выводы

В результате выполнения работы были получены навыки настройки dhcp.
