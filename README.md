# aleksvv_infra
Aleksandr Vorotov

### Стенд
Хост bastion, IP: 146.148.18.49, внутр. IP: 10.132.0.2, user: aleksvv.

Хост: someinternalhost, внутр. IP: 10.132.0.3, user: aleksvv.


### Способы подключения к someinternalhost в одну команду

1. ssh -o ProxyCommand='ssh -i ~/.ssh/alexvv -W %h:%p aleksvv@146.148.18.49' aleksvv@10.132.0.3
2. 
- Создать файл ~/.ssh/config
```	
Host bastion
  Hostname 146.148.18.49
  User aleksvv
  IdentityFile ~/.ssh/alexvv

Host someinternalhost
  Hostname 10.132.0.3
  User aleksvv
  ProxyCommand ssh bastion -W %h:%p
```
- Команда для подключения: ssh someinternalhost

### Homework 6 Infra_2

#### Скрипты создания виртуальной машины:

* install_ruby.sh - установка руби
* install_mongodb.sh - установка MongoDB
* deploy.sh - запуск приложения
* startup_script.sh - запускаеться при создании инстанса

#### Команда создания виртуальной машины:

gcloud compute instances create reddit-app \
    --boot-disk-size=10GB \
    --image-family ubuntu-1604-lts \
    --image-project=ubuntu-os-cloud \
    --machine-type=g1-small \
    --tags puma-server \
    --restart-on-failure \
    --zone=europe-west1-c \
    --metadata-from-file startup-script=startup_script.sh

### Homework 7 packer_base

#### Команда создания образа виртуальной машины:

packer build -var-file=variables.json.example ubuntu16.json 


