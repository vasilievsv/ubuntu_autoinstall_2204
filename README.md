# Установочный образ (ubuntu liveusb)

Установка с liveusb)производится в два этапа.

 Устанавливаются пакеты и применяются базовые настройки системы.
 После перезагрузки выполняется одноразовый сервис after-install в котором выполнятся завершающие действия

---



Проект
```
.
├── config
│   └── boot        - grub для загрузки liveusb
├── nocloud
├── private_data    - ресурсы для установщика
├── README.md
├── user-data.example
└── make-iso
 
```



#### <b>Создание образа</b>

Подготовка окружения для сборки 
```
$ apt-get install xorriso isolinux fdisk
```
Для создания образа, нужно выполнить поочередно два скрипта 

```
# 1. Скачивает deb пакеты в директорию nocloud 

$ .gitlab/scripts/do_fetch.sh
```

```
# 2.Скачивает образ livecd с сайта ubuntu, разбирает его 
# и копирует директории nocloud, private_data, user-data.example

$ ./make-iso
```

После выполнения скрипта на выходе будет ISO файл ubuntu-autoinstall-<дата>.iso
Рекомендуется прошивать flash карту rufus'ом что бы была возможность изменить содержимое ISO.


---
#### <b>Запись на Флеш карту</b>

Для записи можно использовать две программы на выбор

- https://www.balena.io/etcher/
- https://rufus.ie/ru/

Запись образа через rufus дает возможность делать изменения после монтирования флешки


#### <b>Прочее</b>
```
https://www.molnar-peter.hu/en/ubuntu-jammy-netinstall-pxe.html
https://github.com/YasuhiroABE/ub2204-autoinstall-iso

VirtualBox Extension Pack
https://superuser.com/questions/373463/how-to-access-an-sd-card-from-a-virtual-machine
```
