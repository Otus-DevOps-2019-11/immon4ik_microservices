# immon4ik_infra
immon4ik Infra repository
## ДЗ №3
bastion_IP = 35.228.190.122
someinternalhost_IP = 10.166.0.6
Команда подключения к someinternalhost:
ssh -A immon4ik@35.228.190.122 ssh 10.166.0.6
Создания алиаса для подключения к someinternalhost
Добавляем в.ssh\config
Host someinternalhost
     HostName 10.166.0.6
     User immon4ik
     ProxyCommand C:\Windows\System32\OpenSSH\ssh.exe -W %h:%p immon4ik@35.228.190.122
Добавляем алиас
doskey someinternalhost=ssh someinternalhost
Профит
someinternalhost
Last login: Fri Dec 20 07:53:45 2019 from 10.166.0.5
immon4ik@sih:~$
## ДЗ №4
testapp_IP = 35.233.40.32
testapp_port = 9292
Для запуска использовался ps.
### create instances hw default
gcloud compute instances create reddit-app `
  --boot-disk-size=10GB `
  --image-family ubuntu-1604-lts `
  --image-project=ubuntu-os-cloud `
  --machine-type=g1-small `
  --tags puma-server `
  --restart-on-failure
### create instances with startup scripts(install.sh=install_ruby.sh+install_mongodb.sh+deploy.sh)
gcloud compute instances create reddit-app-ss `
  --metadata-from-file startup-script=D:\_System\Study\otus\hw4\install.sh `
  --boot-disk-size=10GB `
  --image-family ubuntu-1604-lts `
  --image-project=ubuntu-os-cloud `
  --machine-type=g1-small `
  --tags puma-server `
  --restart-on-failure
### create instances with startup scripts + fw rules
gcloud compute instances create reddit-app-ss2 `
  --metadata-from-file startup-script=D:\_System\Study\otus\hw4\install.sh `
  --boot-disk-size=10GB `
  --image-family ubuntu-1604-lts `
  --image-project=ubuntu-os-cloud `
  --machine-type=g1-small `
  --tags ss-puma-server `
  --restart-on-failure
### create fw rules
gcloud compute firewall-rules create ss-puma-server `
  --direction=INGRESS `
  --priority=1000 `
  --network=default `
  --action=ALLOW `
  --rules=tcp:9292 `
  --source-ranges=0.0.0.0/0 `
  --target-tags=ss-puma-server
## ДЗ №5
git mv deploy.sh install_mongodb.sh install_ruby.sh config-scripts
add packer/variables.json, variables.json.example ubuntu16.json, immutable.json
add packer/scripts/deploy.sh, install_mongodb.sh, install_ruby.sh hw5.sh
add packer/files/hw5.service
add .gitignore packer/variables.json
packer build paker/ubuntu16.json
packer build paker/immutable.json
add config-scripts/create-reddit-vm.sh
## ДЗ №6
### Основное задание.
Установлен terraform. Скорректирован .gitignore. Добавлен код в main.tf, lb.tf. Сформированы переменные в variables.tf, outputs.tf. Добавлен пример с введенными значениями переменных terraform.tfvars.example. Добавлены files/deploy.sh, files/puma.service для деплоя приложения, выданы права на исполнение скрипта. Определён ряд переменных и внесён в код. Все конфигурационные файлы отформатированы командой terraform fmt.
### Задание со *.
Добавлены ssh ключи в методанные проекта для нескольких пользователей с использованием count.
При добавлении ssh ключа через веб и последующем применении terraform apply -auto-approve удаляется ключ внесённый через веб.
### Задание с **.
На основе открытых источников сформирован код создания lb. Разобрано выполнение всех из использованных в коде ресурсов. Создание инстансов приложений сформировано с использованием count.
В такой конфигурации приложения присутствуют две независимые БД для каждого инстанса приложения, отстутствует кеш. Соответственно данные внесенные на каждый из инстансов никак не реплицируются, что приводит к их разнородности.
## ДЗ №7
### Основное задание.
Изучена взаимосвязь и зависимость ресурсов. Изучена работа с модулями. Конфигурация разбина на несколько .tf файлов. Выполнено разделение приложения на среды prod и stage. Изучена работа с реестром модулей. Создан бакет для хранения state-файлов.
### Задание со *.
Создана конфигурация для хранения state-файлов. State-файлы перемещены, при последовательном применении конфигураций для prod и stage сред проходит без ошибок. При параллельном применении конфигураций для prod и stage сред срабатывает блокировка "Error locking state: Error acquiring the state lock". Доработан модуль terraform-google-storage-bucket для создания нескольких бакетов с for_each, в backend.tf каждой из сред прописан относящийся к среде бакет. В таком варианте возможно одновременное применение конфигураций.
### Задание с **.
На основе открытых источников сформированы provisioner для модулей, которые позволяют работать приложению. Параметризированы модули и среды prod и stage.
## ДЗ №8
### Основное задание.
Результатом повторного запуска ansible-playbook clone.yml является:
```
appserver: ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
Это говорит о том, что после удаления папки reddit появляется возможность вновь её склонировать.
### Задание со *.
Доработаны tf файлы модулей для маркировки по группам "app","db".
Настроена работа virtualenv и python 3.6.8
С использованием открытых источников написаны скрипты inventory.py, run_inventory.py для формирования файлов динамической инвентаризации.
Выполнение задания по:
```
ansible all -i run_inventory.py -m ping
35.205.159.135 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
35.233.117.204 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
```
ansible.cfg изменен для возможности запуска без явного указания файла инвентаризации:
```
inventory = ./run_inventory.py
```
Отличия статической и динамической инвентаризации заключаются в архитектуре формирования блоков групп хостов. Так же наиболее ярким отличием является присутствие блок _meta и содержание в нем переменных хоста(блок hostvars), при этом инвентори скрипт не будет вызываться с --host для каждого хоста. Это позволяет сильно ускорить производительность динамического инвентори и упрощает реализацию кеширования на стороне клиента.
## ДЗ №9
### Основное задание.
В рамках домашнего задания исследована работа плейбуков, ограничений по группам и тегам: плейбука с одним\несколькими сценариями, работа нескольких плейбуков, а так же их работа при объединении импортом в один основной плейбук.
Написаны плейбуки для конфигурирования хостов БД и прилодения: ansible/app.yml, db.yml, deploy.yml, site.yml
Написаны плейбуки для установки ПО хостов БД и приложения используя packer: ansible/packer_app.yml, packer_db.yml
Переработаны сценарии сборки образов packer с использованием провижиенера ansible: app.json, db.json
__Переведена инфраструктура тестирования и выполнения ДЗ с windows на *nix и в gcp. Установлен весь необходимый софт из предидущих ДЗ.__
### Задание со *.
Для реализации динамической инвентаризации принято решение использовать инвентори плагин gcp compute.
ansible.cfg изменен для возможности использовать динамическую инвентаризацию в gcp:
```
[defaults]
inventory = ./inventory_gcp.yml
[inventory]
enable_plugins = gcp_compute, host_list, script, yaml, ini, auto
```
С использованием открытых источников(*http://docs.testing.ansible.com/ansible/latest/plugins/inventory/gcp_compute.html*) написаны файл динамической инвентаризации ansible/inventory_gcp.yml.
Создан и настроен сервисный аккаунт gcp для моего проекта.
С использованием открытых источников(*https://serverfault.com/questions/638507/how-to-access-host-variable-of-a-different-host-with-ansible*) внесена доработка в блок переменных для динамической установки ip-адреса БД в плейбук ansible/app.yml:
```
vars:
  db_host: "{{ hostvars['reddit-db']['ansible_default_ipv4']['address'] }}"
```
## ДЗ №10
### Основное задание.
В рамках ДЗ изучены практики по организации конфигурационного кода, разделение плейбуков по ролям, разделение окружений среды, изучены принцип работы и возможности ansible-galaxy.
Для реализации открытия 80 порта для инстанса приложения в конфигурации terraform/modules/app/variables.tf было добавлено дефолтное значение тега http-server:
```
[...]
variable tags {
  type    = list(string)
  default = ["reddit-app", "http-server"]
}
[...]
```
Добавлен вызов роли jdauphant.nginx в плейбук ansible/playbooks/app.yml:
```
[...]
  roles:
    - app
    - jdauphant.nginx
[...]
```
Изучена и применена работа с ansible-vault. Дополнен конфиг ansible/ansible.cfg для работы с мастер-ключем vault.key.
Дополнен плейбук ansible/playbooks/site.yml для создания дополнительных пользователей из зашифрованных плейбуков соответствующей среды окружения:
```
[...]
- import_playbook: users.yml
[...]
```
Провереня доступность приложения на 80 порту и возможность подключиться новым пользователям после применения ansible/playbooks/site.yml
### Задание со *.
Для созданнового в прошлом задании динамического инвентори добавим фильтрацию по метке среды окружения:
- ansible/environments/prod/inventory_gcp.yml
```
[...]
filters:
  - labels.env = prod
[...]
```
- ansible/environments/stage/inventory_gcp.yml
```
[...]
filters:
  - labels.env = stage
[...]
```
Теперь опишим эту метку в конфигурациях terraform:
- terraform/modules/app/variables.tf
```
[...]
variable label_env {
  type    = string
  description = "dev, stage, prod and etc."
  default     = "dev"
}
[...]
```
- terraform/modules/app/main.tf
```
[...]
labels = {
  ansible_group = var.label_ansible_group
  env = var.label_env
}
[...]
```
- terraform/modules/db/variables.tf
```
[...]
variable label_env {
  type    = string
  description = "dev, stage, prod and etc."
  default     = "dev"
}
[...]
```
- terraform/modules/db/main.tf
```
[...]
labels = {
  ansible_group = var.label_ansible_group
  env = var.label_env
}
[...]
```
- terraform/prod/variables.tf
```
[...]
variable label_env {
  type    = string
  description = "dev, stage, prod and etc."
  default     = "prod"
}
[...]
```
- terraform/prod/main.tf
```
[...]
label_env = var.label_env
[...]
```
- terraform/stage/variables.tf
```
[...]
variable label_env {
  type    = string
  description = "dev, stage, prod and etc."
  default     = "stage"
}
[...]
```
- terraform/stage/main.tf
```
[...]
label_env = var.label_env
[...]
```
Поднимем среду для прода terraform/prod и попробуем выполнить ansible-playbook playbooks/site.yml --check,
```
[...]
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost
does not match 'all'
[WARNING]: While constructing a mapping from
/home/immon4ik/otus/hw/ansible-3/ansible/roles/jdauphant.nginx/tasks/configuration.yml, line 62, column 3,
found a duplicate dict key (when). Using last defined value only.
[WARNING]: Could not match supplied host pattern, ignoring: db
[...]
```
Результат говорит о работе меток, т.к. настроено дефолтное использование динамического инвентори для среды окружения stage.
Выполнив  ansible-playbook -i environments/prod/inventory_gcp.yml playbooks/site.yml получаю настроенное приложение работающее на 80 порту и хосты доступные для дополнительных пользователей.
### Задание с **.
С использованием открытых источников(*https://docs.travis-ci.com/user/job-lifecycle/#breaking-the-build*) созданна следущая структура для выполнения задания:
```
play-travis/ansible-3/run_tests_in_docker.sh - скрипт для TravisCI, выполняется после тестов из ДЗ№3,передает команды в контейнер с тестами, использует пользователя appuser.
play-travis/ansible-3/tests/controls/ansible.rb packer.rb terraform.rb - сценарии тестов для приложений, указанных в задании. Применяется packer validate для всех шаблонов, terraform validate и tflint для окружений stage и prod, ansible-lint для плейбуков ansible.
play-travis/ansible-3/tests/inspec.yml - конфигурационный файл для запуска inspec, в нашей реализации не используется.
play-travis/ansible-3/tests/run_tests.sh - скрипт преподготовки среды тестирования и запуска тестов из подготовленных сценариев.
```
С использованием открытых источников(*https://docs.travis-ci.com/user/job-lifecycle/#breaking-the-build*) изменен .travis.yml для выполнения скриптов и сценариев созданной среды тестирования:
```
[...]
before_script:
- curl https://raw.githubusercontent.com/otus-devops-2019-11/immon4ik_infra/ansible-3/play-travis/ansible-3/run_tests_in_docker.sh | bash
[...]

```
## ДЗ №11
### Основное задание.
__Для выполнения задания были рассмотрены варианты работы с vagrant и virtualbox в gcp. Настроена и проверена работа с плагтном vagrant-google.__
__Настроена и использовалась инфраструктура с вложенной виртуализацией(https://cloud.google.com/compute/docs/instances/enable-nested-virtualization-vm-instances#starting_a_nested_vm), для этого настроен образ на базе centos с лицензией, позволяющей виртуализацию:__
```
gcloud compute images create nested-vm-image \
  --source-disk disk-for-nv --source-disk-zone europ-west1-b \
  --licenses "https://compute.googleapis.com/compute/v1/projects/vm-options/global/licenses/enable-vmx
```
Т.к. использовался хост с низкими ресурсами ansible/Vagrantfile был дополнет:
```
[...]
config.vm.boot_timeout = 1000
[...]
```
ansible/playbooks/base.yml - добавлен плейбук утановки python и использования raw модуля на vb-хосты(в моём случае был необязательным).
ansible/playbooks/site.yml - изменен плейбук для использования base.yml, удалено выполнение users.yml
ansible/playbooks/packer_app.yml и packer_db - включены в использование ролей ansible/roles/app и ansible/roles/db соответственно.
packer/app.json и db.json - доработаны провижионеры в шаблонах packer для работы с ролями ansible:
```
"extra_arguments": ["--tags","nead usefull tag"],
"ansible_env_vars": ["ANSIBLE_ROLES_PATH={{ pwd }}/ansible/roles"]
```
__Собраны актуальные образы используя packer build.__
ansible/roles/app/tasks/ruby.yml - таск с установкой ruby.
ansible/roles/app/tasks/puma.yml - параметризированный таск с установкой unit для puma и добавления конфига.
ansible/roles/app/tasks/main.yml - сводный таск с инструкцией по запуску тасков для роли app.
ansible/roles/app/templates/puma.service.j2 - параметризированный шаблон с unit для puma.
ansible/roles/db/tasks/install_mongo.yml - таск с установкой mongodb.
ansible/roles/db/tasks/config_mongo.yml - таск c добавлением конфига mongodb из шаблона.
ansible/roles/db/tasks/main.yml - сводный таск по запуску тасков для роли db.
ansible/roles/app/default/main.yml - введена перемменная deploy_user параметризации установки компонентов для работы/деплоя приложения.
ansible/playbooks/deploy.yml - доработан плейбук деплоя приложения c добавлением переменной {{ deploy_user }}.
### Задание со *. Часть 1.
На основе ДЗ№9 доработан ansible/Vagrantfile:
```
[...]
ansible.extra_vars = {
  "deploy_user" => "vagrant",
  "nginx_sites" => {
    "default" => [
      "listen 80",
      "server_name \"reddit\"",
      "location / { proxy_pass http://127.0.0.1:9292;}"
      ]
  }
}
[...]
```
Проверим результат выполнения vagrant up:
```
[immon4ik@ansible-as02 ansible]$ curl 10.10.10.20
[...]
<a class='navbar-brand' href='/'>Monolith Reddit</a>
</div>
<div class='navbar-collapse collapse'>
<ul class='nav navbar-nav navbar-right'>
<li>
<a href='/signup'>Sign up</a>
</li>
<li>
<a href='/login'>Login</a>
</li>
[...]
```
### Основное задание. Тестирование ролей.
ansible/roles/db/tasks/molecule/default/molecule.yml - доработан сценарий для использования на хосте с низкой производительностью:
```
[...]
instance_raw_config_args:
  - "vm.boot_timeout = 1000"
[...]
```
ansible/roles/db/tasks/molecule/default/molecule.yml - добавлена проверка плагином testinfra:
```
[...]
verifier:
  name: testinfra
  lint:
    name: flake8
[...]
```
ansible/roles/db/tasks/molecule/default/tests/test_default.py - написан тест к роли db для проверки того, что БД слушает по нужному порту:
```
[...]
def test_mongo_port_is_open(host):
    port = host.socket("tcp://0.0.0.0:27017")
    assert port.is_listening
[...]
```
### Задание со *. Часть 2.
__Создан репо https://github.com/immon4ik/ansible-role-db.git. В него скопирована роль db и удалена из репо https://github.com/Otus-DevOps-2019-11/immon4ik_infra.git.__ __Репо подключен в travisci.__
__Создан ssh ключ пользователя travis для работы в github.__ __Проверена интеграция с github.__ __Создан api_key.py для будущего деплоя приложений в gcp при помощи travis.__
ansible/enviroments/prod/requirements.yml и ansible/enviroments/prod/requirements.yml - добавлена работа с репо для роли db:
```
[...]
- src: https://github.com/immon4ik/ansible-role-db.git
  name: db
[...]
```
Для репо роли db:
ansible/roles/db/tasks/molecule/default/molecule.yml - доработан для автоматического прогона тестов в gce:
```
[...]
driver:
  name: gce
[...]
```
ansible/roles/db/tasks/molecule/default/molecule.yml - включено использование, собранного в основном задание образа через packer:
```
[...]
platforms:
  - name: instance-travis
    zone: europe-west1-b
    machine_type: f1-micro
    image: reddit-base-mongodb-1586298865
[...]
```
.travis.yml - настроен прогон тестов роли db в travisci используя molecule, добавлено оповещение о результате сборки в slack.
README.md - добавлен кастомный бейдж статуса билда:
```
[...]
custom build status badge
------------------
<!-- https://stackoverflow.com/questions/50860850/custom-label-for-travis-ci-badge-on-github-repo -->
[![Build Status](https://img.shields.io/travis/com/immon4ik/ansible-role-db/master?color=9cf&label=immon4ik&style=plastic)](https://img.shields.io/travis/com/immon4ik/ansible-role-db/master?color=9cf&label=immon4ik&style=plastic)
[...]
```
# immon4ik_microservices
immon4ik microservices repository
-------------------------
## ДЗ №12
### Основное задание.
Протестирована работа Container-Optimized OS from Google. Развернута управляющих хост для управления работы с репо microservices на centos 8. Изучены основы работы с docker, docker-machine.
### Задание со *. Часть 1.
docker inspect <u_container_id> - сводная по контейнеру, включает параметризированные данные по имени контейнера(не только id), cpu\ram\networks, настройки среды переменных и примапленных volumes для текущего контенера.
docker inspect <u_image_id> - сводная по образу, включает указание к какому котейнеру относится, какой версией docker собран, на основе каких родительских образов сделана сборка, метаданные, настройки среды переменных и примапленных volumes для образа.
На основании этого можно сделать вывод, что образы являются жестко сбилженной еденицей для формирования на их основе параметризированных сущностей более высокого уровня, т.е. контейнеров.
### Задание со *. Часть 2.
Используя наработки из репо infra доработаны согласно заданию:
docker-monolith/infra/packer - параметризированный сценарий packer по сборки образа с установленным docker.
docker-monolith/infra/terraform - параметризированный сценарий terraform для поднятия инстансов, с заданием их количества(по-умолчанию - 1 экземпляр).
docker-monolith/infra/ansible - комплексный пакет ansible c плейбуками, ролями, средой окружения, с использованием динамического инвентори. Используется для установки docker и запуска там образа приложения из dockerhub.
```
[...]
packer build -var-file=packer/variables.json packer/docker_host.json
terraform apply --auto-approve
ansible-playbook playbooks/otus_reddit.yml
[...]
```
## ДЗ №13
### Основное задание.
Установлен hadolint для windows, добавлен плагин hadolint для vsc. Используя библиотеку рекомендаций hadolint оптимизированы:
src/comment/Dockerfile - вариант сохранен в Dockerfile.1, использован базовый образ ruby:2.6, изменены add => copy, можно выставить версию для увсех устанавлеваемых пакетов.
src/post-py/Dockerfile - вариант сохранен в Dockerfile.1, использован базовый образ 3.6.0-alpine, изменены add => copy, можно выставить версию для увсех устанавлеваемых пакетов.
src/ui/Dockerfile - вариант сохранен в Dockerfile.1, использован базовый образ ruby:2.6, изменены add => copy, можно выставить версию для увсех устанавлеваемых пакетов.
Собраны образы, создана bridge-сеть, подняты контейнеры с прописанными алиасами. Проверена работа приложения.
### Задание со *. Часть 1.
Изменение env без пересборки образа выполнялось путём добавления флага -e:
```
docker run -d --network=reddit --network-alias=post_db2 --network-alias=comment_db2 mongo:latest
docker run -d --network=reddit --network-alias=post2 -e POST_DATABASE_HOST=post_db2 immon/post:1.0
docker run -d --network=reddit --network-alias=comment2 -e COMMENT_DATABASE_HOST=comment_db2 immon/comment:1.0
docker run -d --network=reddit -p 9292:9292 -e POST_SERVICE_HOST=post2 -e COMMENT_SERVICE_HOST=comment2 immon/ui:1.0
```
### Задание со *. Часть 2.
Выполнялося подбор оптимального базового образа и необходимых пакетов для минимизации размера контейнеров, анализировалась возможность удаления временных файлов, добавление флагов блокирующих использование кеша, документации к пакетам и т.п.
Базовый образ ubuntu:16.04  - результат ~420MB в зависимости от доп.софта и флагов его установки/обновления.
src/comment/Dockerfile.2 - базовый образ 2.7.1-alpine3.11, Gemfile.lock изменен BUNDLED WITH 2.1.2 - результат 272MB.
src/ui/Dockerfile.2 - базовый образ 2.7.1-alpine3.11, Gemfile.lock изменен BUNDLED WITH 2.1.2 - результат 275MB.
src/comment/Dockerfile - базовый образ alpine:3.9.4 - результат ~74MB, в зависимости от версии ruby.
src/ui/Dockerfile - базовый образ alpine:3.9.4 - результат ~77MB, в зависимости от версии ruby.
```
[...]
immon/comment       3.14                11a5e8507836        48 minutes ago      272MB
immon/ui            3.14                aaa4f828340f        About an hour ago   275MB
immon/comment       2.1                 783076d76082        2 hours ago         74MB
immon/ui            2.17                f8be7f3f6497        2 hours ago         76.9MB
[...]
```
Проверена работа приложения используя все из собранных образов.
Применено подключение volume к mongodb, подняты новые версии контейнеров, проверено присутствие добавленного ранее поста:
```
docker volume create reddit_db
docker run -d --rm --network=reddit --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db mongo:latest
docker run -d --rm --network=reddit --network-alias=post immon/post:2.0
docker run -d --rm --network=reddit --network-alias=comment immon/comment:2.1
docker run -d --rm --network=reddit -p 9292:9292 immon/ui:2.17
```

for sale:)
----------
[![Build Status](https://img.shields.io/travis/com/Otus-DevOps-2019-11/immon4ik_microservices/master?color=9cf&label=immon4ik&style=plastic)](https://img.shields.io/travis/com/Otus-DevOps-2019-11/immon4ik_microservices/master?color=9cf&label=immon4ik&style=plastic)
