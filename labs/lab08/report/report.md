---
title: "Отчёт о лабораторной работе"
subtitle: "Лабораторная работа 8"
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

Получить практические навыки установки и настройки SMTP-сервера.

# Выполнение лабораторной работы

Сначала заходим на сервер под root и ставим postfix (рис. [-@fig:001]).

![Установка Postfix](image/1.png){#fig:001}

Следом устанавливаем утилиту s-nail (рис. [-@fig:002]).

![Установка s-nail](image/2.png){#fig:002}

Затем открываем в фаерволе доступ к smtp, восстанавливаем контексты selinux и запускаем postfix (рис. [-@fig:003]).

![Предварительная настройка](image/3.png){#fig:003}

Выполняем postconf — команда выводит полный список параметров конфигурации. Вывод получается довольно объёмным (рис. [-@fig:004]).

![postconf](image/4.png){#fig:004}

Смотрим значения myorigin и mydomain. mydomain — это имя домена, а myorigin — имя хоста. Меняем myorigin на доменное имя, проверяем корректность конфигурации через postfix check и перезапускаем службу (рис. [-@fig:005]).

![Обновление конфигурации postfix](image/5.png){#fig:005}

Командой postconf -n выводим только те настройки, которые отличаются от значений по умолчанию (рис. [-@fig:006]).

![postconf -n](image/6.png){#fig:006}

Жёстко фиксируем имя домена как наш домен. После этого смотрим, какие интернет-протоколы разрешены. Сейчас разрешены все — оставляем только ipv4 и перезапускаем postfix (рис. [-@fig:007]).

![Обновление настроек протоколов](image/7.png){#fig:007}

Пробуем отправить письмо самому себе со своей учётной записи (рис. [-@fig:008]).

![Отправка письма](image/8.png){#fig:008}

Открываем в отдельной вкладке лог из /var/log/maillog. Видим, что письмо доставлено — об этом говорит строка «delivered to mailbox» перед последней записью (рис. [-@fig:009]).

![Лог почты](image/9.png){#fig:009}

Также проверяем, что в /var/spool/mail появились файлы пользователей (рис. [-@fig:010]).

![/var/spool/mail](image/10.png){#fig:010}

Переходим на клиентскую машину, заходим под root и тоже устанавливаем postfix (рис. [-@fig:011]).

![Установка Postfix](image/11.png){#fig:011}

Ставим и s-nail (рис. [-@fig:012]).

![Установка s-nail](image/12.png){#fig:012}

На клиенте повторяем действия с сервера: оставляем только ipv4 и перезапускаем postfix (рис. [-@fig:013]).

![Настройка протоколов на клиенте](image/13.png){#fig:013}

Отправляем с клиента письмо на сервер (рис. [-@fig:014]).

![Отправка письма](image/14.png){#fig:014}

На сервере в логах ничего нового не появляется (рис. [-@fig:015]).

![Логи почты](image/15.png){#fig:015}

Разрешаем другим устройствам в сети отправлять почту на сервер. Для этого меняем inet_interfaces с localhost на all и добавляем в mynetworks нашу локальную сеть 192.168.0.0, после чего перезапускаем postfix (рис. [-@fig:016]).

![Включение получения писем из локальной сети](image/16.png){#fig:016}

Снова пробуем отправить письмо с клиента (рис. [-@fig:017]).

![Повторная отправка письма](image/17.png){#fig:017}

Теперь в логах видно новое письмо. Указано «delivered to mailbox» — доставка успешна (рис. [-@fig:018]).

![Успешная отправка письма согласно логам](image/18.png){#fig:018}

Пробуем отправить письмо не на устройство, а пользователю (рис. [-@fig:019]).

![Отправка письма пользователю](image/19.png){#fig:019}

Письмо не доставляется — нет информации о почтовом сервере (No route to host) (рис. [-@fig:020]).

![Неуспешная доставка письма](image/20.png){#fig:020}

Информацию о зависшем письме смотрим командой postqueue -p (рис. [-@fig:021]).

![postqueue -p](image/21.png){#fig:021}

Теперь правим файлы прямой и обратной зоны, чтобы добавить данные о почтовом сервере. В файле прямой зоны появляется запись о почтовом сервере (рис. [-@fig:022]).

![Файл прямой зоны](image/22.png){#fig:022}

В файле обратной зоны — соответствующие изменения (рис. [-@fig:023]).

![Файл обратной зоны](image/23.png){#fig:023}

Обновляем список пунктов назначения, добавив туда сервер, перезапускаем postfix, обновляем метки selinux и перезапускаем dns-сервер. Затем командой postqueue -f выгружаем очередь сообщений (рис. [-@fig:024]).

![Обновление списков назначения почты](image/24.png){#fig:024}

Теперь в логах видно, что письмо доставлено (рис. [-@fig:025]).

![Лог об успешно доставленном письме](image/25.png){#fig:025}

Сохраняем конфигурацию для vagrant с сервера и создаём файл mail.sh (рис. [-@fig:026]).

![Сохранение конфигурации](image/26.png){#fig:026}

В mail.sh записываем скрипт (рис. [-@fig:027]).

![mail.sh](image/27.png){#fig:027}

Переключаемся на клиент и тоже создаём для него mail.sh (рис. [-@fig:028]).

![Создание скрипта mail.sh для клиента](image/28.png){#fig:028}

Скрипт для клиента выглядит так (рис. [-@fig:029]).

![mail.sh для клиента](image/29.png){#fig:029}

В vagrantfile добавляем запуск этих скриптов для клиента и сервера (рис. [-@fig:030]).

![vagrantfile](image/30.png){#fig:030}

# Выводы

В ходе лабораторной работы получены навыки настройки SMTP-сервера.

# Список литературы {.unnumbered}

1. Postfix Project. Postfix Documentation [Электронный ресурс]. — URL: https://www.postfix.org/documentation.html (дата обращения: 13.10.2026).

2. Red Hat. Configuring email servers on Red Hat Enterprise Linux [Электронный ресурс]. — URL: https://docs.redhat.com/ (дата обращения: 13.10.2026).

3. IETF. RFC 5321: Simple Mail Transfer Protocol [Электронный ресурс]. — URL: https://datatracker.ietf.org/doc/html/rfc5321 (дата обращения: 13.10.2026).
