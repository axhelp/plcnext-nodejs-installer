# PLCnext Node.js installation script

## In Russian
[In English ↓](#in-english)

### Описание
Данный скрипт предназначен для автоматизации установки [Node.js](https://nodejs.org/en/) и менеджера процессов [pm2](https://pm2.io) для контроллеров на базе [PLCnext Technology](https://www.phoenixcontact.com/plcnext/). Во время установки контроллер должен иметь активное интернет-подключение.

После установки возможен запуск Javascript [приложений](#Applications).

### Процедура установки
#### Копирование файла
Для запуска процедуры установки необходимо скопировать файл `plcnext-nodejs-installer.sh` в файловую систему контроллера.
IP адрес по-умолчанию `192.168.1.10`, пароль по-умолчанию указан на корпусе.

##### Linux/Mac OS:
```bash
scp plcnext-nodejs-installer.sh admin@192.168.1.10:/opt/plcnext
```

##### Windows
Воспользуйтесь [инструкцией](https://www.plcnext-community.net/index.php?option=com_content&view=article&id=58:how-to-use-winscp-2) по использованию утилиты [WinSCP](https://winscp.net/eng/download.php)

#### Запуск
Установить ему права на исполнение и запустить от пользователя `root`.

```bash
# Установка пароля пользователю root
sudo passwd root

# Логин от имени пользователя root
su

# Установка прав на исполнение файла
chmod +x plcnext-nodejs-installer.sh

# Запуск файла
./plcnext-nodejs-installer.sh
```

### Другие способы установки Node.js
Возможные другие способы установки:
-  [PLCnext Store](https://www.plcnextstore.com/#/225)
-  [Offline установка](https://www.plcnext-community.net/en/hn-makers-blog/418-install-node-red-and-pm2-offline.html)
-  [Установка Node.js вместе с примерами MQTT клиента для AWS и Azure](https://github.com/plcnextusa/PLCnext_AWS_AZURE)

## Applications
-  [MQTT client](https://github.com/axhelp/mqtt-client-dataserver)

## In English
[На русском ↑](#in-russian)

### Overview
This script is intended to automate [Node.js](https://nodejs.org/en/) and [pm2](https://pm2.io) process manager installation on [PLCnext Technology](https://www.phoenixcontact.com/plcnext/) based PLC's from Phoenix Contact. PLC should have an active internet connection during the installation procedure.

After the installation, it is possible to run Javascript [applications](#Applications).

### Installation procedure
#### File copy
Copy `plcnext-nodejs-installer.sh` file into PLC file system.
Default IP address is `192.168.1.10`, default password is printed on PLC.

##### Linux/Mac OS:
```bash
scp plcnext-nodejs-installer.sh admin@192.168.1.10:/opt/plcnext
```

##### Windows
Take a look into [short instruction](https://www.plcnext-community.net/index.php?option=com_content&view=article&id=58:how-to-use-winscp-2) how to use [WinSCP](https://winscp.net/eng/download.php) utility.

#### Script execution
Change the file access permission and execute it as `root` user.

```bash
# Change password for user root 
sudo passwd root

# Login as root
su

# Change file permission to execute
chmod +x plcnext-nodejs-installer.sh

# Execute script
./plcnext-nodejs-installer.sh
```

### Other ways to install Node.js
-  [PLCnext Store](https://www.plcnextstore.com/#/225)
-  [Offline installation](https://www.plcnext-community.net/en/hn-makers-blog/418-install-node-red-and-pm2-offline.html)
-  [Node.js installation including MQTT client for AWS and Azure](https://github.com/plcnextusa/PLCnext_AWS_AZURE)
