---
title: "Отчёт о лабораторной работе"
subtitle: "Лабораторная работа 2"
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

Приобретение практических навыков по установке и конфигурированию DNS-сервера, усвоение принципов работы системы доменных имён.

# Выполнение лабораторной работы

Для начала запустим виртуальную машину через vagrant (рис. [-@fig:001]).

![Запуск ВМ](image/1.png){#fig:001}

Теперь скачаем пакет bind utils (рис. [-@fig:002]).

![Скачивание пакетов](image/2.png){#fig:002}

Используем команду dig для проверки сервисов яндекса (рис. [-@fig:003]).

![dig ya.ru](image/3.png){#fig:003}

Посморим на содержание файлов конфигурации dns в etc (рис. [-@fig:004]).

![Файлы конфигурации](image/4.png){#fig:004}

Просморим теперь файл named.ca (рис. [-@fig:005]).

![named.ca](image/5.png){#fig:005}

Содержимое named.localhost и named.loopback (рис. [-@fig:006]).

![named.localhost и named.loopback](image/6.png){#fig:006}

Запустим теперь named и осуществим снова dig yandex.ru (рис. [-@fig:007]).

![Запуск named](image/7.png){#fig:007}

Теперь настроим порт eth0 (рис. [-@fig:008]).

![eth0](image/8.png){#fig:008}

Откроем и отредактируем named.conf (рис. [-@fig:009]).

![named.conf](image/9.png){#fig:009}

Установим правила фаервола (рис. [-@fig:010]).

![Правила фаервола](image/10.png){#fig:010}

Теперь переместим файл с настройкой конфига (рис. [-@fig:011]).

![перемещение файла](image/11.png){#fig:011}

И отредактируем наш файл под наши параметры (рис. [-@fig:012]).

![Редактирование файла](image/12.png){#fig:012}

То же самое сделаем с файлом зон (рис. [-@fig:013]).

![Файл зон](image/13.png){#fig:013}

Создадим папки с настройками днс (рис. [-@fig:014]).

![Создание папок и настроек днс](image/14.png){#fig:014}

Отредактируем файл dvkalashnikova.net (рис. [-@fig:015]).

![dvkalashnikova.net](image/15.png){#fig:015}

Теперь посмотрим на файлы из папки rz (рис. [-@fig:016]).

![Папка rz](image/16.png){#fig:016}

Отредактируем следующим образом (рис. [-@fig:017]).

![Редактирование файла](image/17.png){#fig:017}

Настроим Selinux (рис. [-@fig:018]).

![Selinux](image/18.png){#fig:018}

Через dig попробуем подключиться к собственному днс (рис. [-@fig:019]).

![dig](image/19.png){#fig:019}

Оформим нашу работу как конфигурацию для вагранта (рис. [-@fig:020]).

![Конфиг вагрант](image/20.png){#fig:020}

И напишем скрипт для загрузки вагранта (рис. [-@fig:021]).

![скрипт](image/21.png){#fig:021}

И в vagrantfile будем загружать этот скрипт (рис. [-@fig:022]).

![vagrantfile](image/22.png){#fig:022}

# Выводы

В результате выполнения работы были получены навыки настройки днс
