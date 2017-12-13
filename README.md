# aleksvv_infra
Aleksandr Vorotov

Хост bastion, IP: 146.148.18.49, внутр. IP: 10.132.0.2, user: aleksvv.
Хост: someinternalhost, внутр. IP: 10.132.0.3, user: aleksvv.

Способы подключения к someinternalhost в одну команду
1. ssh -o ProxyCommand='ssh -i ~/.ssh/alexvv -W %h:%p aleksvv@146.148.18.49' aleksvv@10.132.0.3
2. 
- Создать файл ~/.ssh/config
_________________	
Host bastion
  Hostname 146.148.18.49
  User aleksvv
  IdentityFile ~/.ssh/alexvv

Host someinternalhost
  Hostname 10.132.0.3
  User aleksvv
  ProxyCommand ssh bastion -W %h:%p
_________________
- Команда для подключения: ssh someinternalhost
