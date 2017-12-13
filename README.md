# aleksvv_infra
Aleksandr Vorotov

bastion: aleksvv@146.148.18.49
someinternalhost: aleksvv@10.132.0.3

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
