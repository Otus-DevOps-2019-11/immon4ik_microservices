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
## ДЗ №14
### Основное задание.
 - Поднят контейнер только с внутренним сетевым драйвером(флаг --network none). Поднят контейнер использующий сетевой дравер хоста(флаг --network host). При попытке поднятия нескольких контейнеров, использующих сетевой дравер хоста, запущенным остается только первый контейнер, т.к. последующие пытались использовать тот же адрес и порт.
 - Поднято приложение, используя созданную сеть с драйвером bridge(флаг --driver bridge). Проверена работоспособность приложения при присвоение контейнерам имен или сетевых алиасов при старте.
 - Освоено создание docker-сети и подключение к ней контейнеров:
```
docker network create back_net --subnet=10.0.2.0/24
docker network create front_net --subnet=10.0.1.0/24
docker network connect front_net post
docker network connect front_net comment
```
 - Разобран сетевой стек, изучены особенности формирования bridge-сетей, bridge-интерфейсов, iptables, правил DNAT в цепочке DOCKER, работа процесса docker-proxy.
  - Изучена работа docker-compose и её команды.
Сформированы:
src/docker-compose.yml - параметризированный сценарий запуска приложения reddit, включающий работу в двух docker-сетях и сетевых алиасов.
src/.env - переменные окружения для docker-compose(*https://docs.docker.com/compose/environment-variables/#the-env-file*).
src/.env.example - шаблон для выполнения задания.
 - Базовое имя проекта формируется в соответствии с папкой, из которой запускается docker-compose. Его можно задать при помощи специальной переменной среды окружения COMPOSE_PROJECT_NAME. Задана в src/.env.
### Задание со *.
 - Используя *https://docs.docker.com/compose/extends/* сформирован параметризированный файл для переопределения свойств src/docker-compose.override.yml:
```
version: '3.3'

services:
  ui:
    command: ${SERVICE_UI_COMMAND}
    volumes:
      - ${UI_VOLUME_NAME}:${UI_VOLUME_DEST}

  post:
    volumes:
      - ${POST_VOLUME_NAME}:${POST_VOLUME_DEST}

  comment:
    command: ${SERVICE_COMMENT_COMMAND}
    volumes:
      - ${COMMENT_VOLUME_NAME}:${COMMENT_VOLUME_DEST}

volumes:
  app_ui:
  app_comment:
  app_post:
```
 - Добавлен блок volumes для каждого из сервисов, указывающий внешнюю папку для хранения файлов приложения. Использование volume позволяет изменять код каждого из приложений, не выполняя сборку образа.
 - Добавлен блок command, который переопределяет CMD в Dockerfile сервиса. Внесенные команды позволят запустить puma для ruby приложений в дебаг режиме с двумя воркерами (флаги --debug и -w 2).
__Все параметры определены в src/.env__
## ДЗ №15
### Основное задание.
__С предыдущего ДЗ остался хост в gcp с установленными docker, docker-compose, docker-machine.__ __Это ДЗ является отправной точко для выполнения проекта, на основе управляющего хоста будет создан образ и описан в шаблоне packer, для создания инстанса будет использован terraform.__
 - Создана хост docker-gitlab используя docker-machine:
```
export GOOGLE_PROJECT=my_project
docker-machine create --driver google \
 --google-machine-image "ubuntu-os-cloud/global/images/ubuntu-1604-xenial-v20200407" \
 --google-disk-size "50" --google-disk-type "pd-standard" \
 --google-machine-type "n1-standard-1" --google-zone europe-west1-b docker-gitlab
```
 - Добавлены правила firewall используя gcloud(_в рамках проета будет добавлено в сценарий terraform__):
```
gcloud compute firewall-rules create docker-machine-allow-http \
  --allow tcp:80 \
  --target-tags=docker-machine \
  --description="Allow http connections" \
  --direction=INGRESS

gcloud compute firewall-rules create docker-machine-allow-https \
  --allow tcp:443 \
  --target-tags=docker-machine \
  --description="Allow https connections" \
  --direction=INGRESS

gcloud compute firewall-rules create reddit-app \
  --allow tcp:9292 \
  --target-tags=docker-machine \
  --description="Allow PUMA connections" \
  --direction=INGRESS
```
 - Доработан сценарий gitlab-ci/docker-compose.yml - параметризирован external_url:
```
GITLAB_OMNIBUS_CONFIG: |
  external_url '${GITLAB_CI_URL:-http://127.0.0.1}'
```
 - Поднят контейнер с GitLab CI на хосте docker-gitlab используя docker-compose:
```
export GITLAB_CI_URL=my_docker-gitlab_host_ip
docker-machine ssh docker-gitlab mkdir -p /srv/gitlab/config /srv/gitlab/data /srv/gitlab/logs
docker-compose -f ./gitlab-ci/docker-compose.yml config
docker-compose -f ./gitlab-ci/docker-compose.yml up -d
```
 - Согласно заданию настроен проект, зарегестрирован gitlab-runner. Отработаны задания по добавлению билда, тестирования, деплоя в .gitlab-ci.yml. Отработаны задания по созданию сред окружения - статических и динамических, их ограничений по типу запуска и обязательным параметрам(пример с tag) в .gitlab-ci.yml.
### Задание со *.
На основании открытых источников - https://docs.gitlab.com/ee/ci/docker/using_docker_build.html
 - Для выполнения задания сначала сконфигурирован запуск gitlab-runner в безинтерактивном режиме. Написан скрипт, автоматизирующих запуск gitlab-runner на хосте. Т.к. планируется работа c __docker in docker(dind)__ учтена необходимость присутствие сертификатов. Для этого определены сертификаты хоста docker-gitlab и импортированы в переменные(*решение тестовое, не самое безопасное, вижу решение в монтировании volume с сертификатами MOUNT_POINT: /builds/$CI_PROJECT_PATH/mnt_*):
```
export GITLAB_CI_URL=http://your_gitlab_ip/
export GITLAB_CI_TOKEN=your_runner_token
export RUNNER_NAME=${RANDOM}-gitlab-runner

docker-machine env docker-gitlab

export DOCKER_HOST_CA_FILE=$(cat $DOCKER_CERT_PATH/ca.pem)
export DOCKER_HOST_CERT_FILE=$(cat $DOCKER_CERT_PATH/cert.pem)
export DOCKER_HOST_KEY_FILE=$(cat $DOCKER_CERT_PATH/key.pem)

docker run -d --name $RUNNER_NAME --restart always \
  -v /srv/${RUNNER_NAME}/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /home/docker-user/crt:/builds/homework/example \
  gitlab/gitlab-runner:latest
:
docker exec -it $RUNNER_NAME gitlab-runner register \
  --run-untagged \
  --locked=false \
  --non-interactive \
  --url ${GITLAB_CI_URL:-http://127.0.0.1} \
  --registration-token $GITLAB_CI_TOKEN \
  --description "docker-runner" \
  --tag-list "linux,xenial,ubuntu,docker" \
  --executor docker \
  --docker-image "alpine:latest" \
  --docker-privileged \
  --docker-volumes "docker-certs-client:/certs/client" \
  --env "DOCKER_DRIVER=overlay2" \
  --env "DOCKER_TLS_CERTDIR=/certs" \
  --env "DOCKER_HOST_CA_FILE=$(cat $DOCKER_CERT_PATH/ca.pem)" \
  --env "DOCKER_HOST_CERT_FILE=$(cat $DOCKER_CERT_PATH/cert.pem)" \
  --env "DOCKER_HOST_KEY_FILE=$(cat $DOCKER_CERT_PATH/key.pem)"

```
 - На основе этого был написан скрипты: gitlab-ci/set_env.sh - переменные для установи gitlab-runner; gitlab-ci/run_reg_runner.sh - простейший скрипт автоматизации развертывания и регистрации Gitlab CI Runner.
 - В Gitlab CI добавлены переменные, позволяющие подключиться к личному docker hub. Реализовано через ui, можно вкючить в скрипт запуска\регистрации gitlab-runner:
```
DOCKER_HUB_LOGIN=mylogin
DOCKER_HUB_PASSWORD=mypassword
```
 - Интегрированы оповещения от Gitlab CI в мой канал slack(#pavel-batsev), используя встроенную интеграцию Gitlab и добавленное в канал slack приложение Incoming WebHooks.
 - Доработан сценарий .gitlab-ci.yml для реализации билда образов и их пуша в мой docker hub, используя dind. Внесены доработки в Dockerfile:
```
build_job:
    stage: build
    image: 'docker:19.03.8'
    services:
        - 'docker:19.03.8-dind'
    before_script:
        - 'docker info'
        - 'docker login -u $DOCKER_HUB_LOGIN -p $DOCKER_HUB_PASSWORD'
        - 'docker image ls'
    script:
        - 'echo ''Building'''
        - 'docker build -t ${DOCKER_HUB_LOGIN:-user}/otus-reddit:${CI_COMMIT_TAG:-1.0.0}.${CI_COMMIT_SHORT_SHA:-0} ./reddit'
        - 'docker push ${DOCKER_HUB_LOGIN:-user}/otus-reddit:${CI_COMMIT_TAG:-1.0.0}.${CI_COMMIT_SHORT_SHA:-0}'
    after_script:
        - 'docker image ls'
```
 - Доработан сценарий .gitlab-ci.yml для деплоя приложения, используя docker-compose. Написан reddit/docker-compose.yml и внесены доработки в файлы приложения /reddit:
```
branch_review:
    stage: review
    image: 'docker:19.03.8'
    variables:
        DOCKER_TLS_VERIFY: '1'
        DOCKER_HOST: 'tcp://$CI_SERVER_HOST:2376'
        DOCKER_CERT_PATH: /tmp/$CI_COMMIT_REF_NAME
    before_script:
        - 'mkdir -p $DOCKER_CERT_PATH'
        - 'echo "$DOCKER_HOST_CA_FILE" > $DOCKER_CERT_PATH/ca.pem'
        - 'echo "$DOCKER_HOST_CERT_FILE" > $DOCKER_CERT_PATH/cert.pem'
        - 'echo "$DOCKER_HOST_KEY_FILE" > $DOCKER_CERT_PATH/key.pem'
        - 'echo "DOCKER_CERT_PATH=$DOCKER_CERT_PATH"'
        - 'ls -a $DOCKER_CERT_PATH'
        - 'echo "DOCKER_HOST=$DOCKER_HOST"'
        - 'docker info'
        - 'docker login -u $DOCKER_HUB_LOGIN -p $DOCKER_HUB_PASSWORD'
        - 'apk add py-pip python-dev libffi-dev openssl-dev gcc libc-dev make'
        - 'pip install docker-compose'
        - 'docker-compose --version'
        - 'docker ps -as'
        - 'docker image ls'
        - 'docker-compose -f ./reddit/docker-compose.yml config'
    after_script:
        - 'docker ps -as'
        - 'docker image ls'
    only:
        - branches
    except:
        - master
    script:
        - 'echo "Deploy on branch/$CI_COMMIT_REF_NAME environment"'
        - 'docker-compose -f ./reddit/docker-compose.yml up -d'
    environment:
        name: branch/$CI_COMMIT_REF_NAME
        url: 'http://$CI_SERVER_HOST:9292'
        on_stop: stop_branch_review
        auto_stop_in: '3 days'
```
 - Доработан сценарий .gitlab-ci.yml для удаления приложения и образа приложения из личного docker hub:
```
stop_branch_review:
    stage: review
    image: 'docker:19.03.8'
    variables:
        DOCKER_TLS_VERIFY: '1'
        DOCKER_HOST: 'tcp://$CI_SERVER_HOST:2376'
        DOCKER_CERT_PATH: /tmp/$CI_COMMIT_REF_NAME
    before_script:
        - 'mkdir -p $DOCKER_CERT_PATH'
        - 'echo "$DOCKER_HOST_CA_FILE" > $DOCKER_CERT_PATH/ca.pem'
        - 'echo "$DOCKER_HOST_CERT_FILE" > $DOCKER_CERT_PATH/cert.pem'
        - 'echo "$DOCKER_HOST_KEY_FILE" > $DOCKER_CERT_PATH/key.pem'
        - 'echo "DOCKER_CERT_PATH=$DOCKER_CERT_PATH"'
        - 'ls -a $DOCKER_CERT_PATH'
        - 'echo "DOCKER_HOST=$DOCKER_HOST"'
        - 'docker info'
        - 'docker login -u $DOCKER_HUB_LOGIN -p $DOCKER_HUB_PASSWORD'
        - 'apk add py-pip python-dev libffi-dev openssl-dev gcc libc-dev make'
        - 'pip install docker-compose'
        - 'docker-compose --version'
        - 'docker ps -as'
        - 'docker image ls'
        - 'docker-compose -f ./reddit/docker-compose.yml config'
    after_script:
        - 'docker ps -as'
        - 'docker image ls'
    only:
        - branches
    except:
        - master
    when: manual
    script:
        - 'echo ''Remove branch review app'''
        - 'docker-compose -f ./reddit/docker-compose.yml down'
        - 'docker image rm -f $(docker image ls -q ${DOCKER_HUB_LOGIN:-user}/otus-reddit) || echo'
        - 'docker image rm -f $(docker image ls -q --filter ''dangling=true'') || echo'
    environment:
        name: branch/$CI_COMMIT_REF_NAME
        action: stop
```

## ДЗ №16

### Основное задание

- Создана хост docker-gitlab используя docker-machine:

```bash
export GOOGLE_PROJECT=my_project
docker-machine create --driver google \
 --google-machine-image "ubuntu-os-cloud/global/images/ubuntu-1604-xenial-v20200407" \
 --google-disk-size "50" --google-disk-type "pd-standard" \
 --google-machine-type "n1-standard-1" --google-zone europe-west1-b docker-prometheus
eval $(docker-machine env docker-prometheus)

```

- Запущен контейнер готового образа prometheus:

```bash
docker run --rm -p 9090:9090 -d --name prometheus prom/prometheus:latest

```

- Сформированы Dockerfile и prometheus.yml:

/monitoring/prometheus/Dockerfile

```docker
FROM prom/prometheus:latest
ADD prometheus.yml /etc/prometheus/

```

/monitoring/prometheus/prometheus.yml

```yml
---
global:
  scrape_interval: '5s'

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets:
        - 'localhost:9090'

  - job_name: 'ui'
    static_configs:
      - targets:
        - 'ui:9292'

  - job_name: 'comment'
    static_configs:
      - targets:
        - 'comment:9292'

```

- Запущен контейнер из /monitoring/prometheus/

```bash
export USER_NAME=immon
docker build -t $USER_NAME/prometheus .
```

- Собраны образы контейнеров используя docker_build.sh скрипты.

```bash
for i in ui post-py comment; do cd src/$i; bash docker_build.sh; cd -; done
```

- Сформирован docker/docker-compose.yml:

```yml
version: '3.3'
services:
  post_db:
    image: mongo:3.2
    volumes:
      - post_db:/data/db
    networks:
        back_net:
            aliases:
                - ${BACK_NET_ALIAS}
  ui:
    image: ${USERNAME}/ui:${UI_VERSION}
    ports:
      - ${UI_PORT}:${UI_PORT}/tcp
    networks:
      - ${NETWORK_FRONT_NET}
  post:
    image: ${USERNAME}/post:${POST_VERSION}
    networks:
      - ${NETWORK_BACK_NET}
      - ${NETWORK_FRONT_NET}
  comment:
    image: ${USERNAME}/comment:${COMMENT_VERSION}
    networks:
      - ${NETWORK_BACK_NET}
      - ${NETWORK_FRONT_NET}
  prometheus:
    image: ${USERNAME}/prometheus
    ports:
      - '9090:9090'
    volumes:
      - prometheus_data:/prometheus
    networks:
      - ${NETWORK_BACK_NET}
      - ${NETWORK_FRONT_NET}
    command:
      - '--config.file=/etc/prometheus/prometheus.yml'
      - '--storage.tsdb.path=/prometheus'
      - '--storage.tsdb.retention=1d'
  node-exporter:
    image: prom/node-exporter:v0.15.2
    user: root
    volumes:
      - /proc:/host/proc:ro
      - /sys:/host/sys:ro
      - /:/rootfs:ro
    networks:
      - ${NETWORK_BACK_NET}
      - ${NETWORK_FRONT_NET}
    command:
      - '--path.procfs=/host/proc'
      - '--path.sysfs=/host/sys'
      - '--collector.filesystem.ignored-mount-points="^/(sys|proc|dev|host|etc)($$|/)"'

volumes:
  post_db:
  prometheus_data:

networks:
  back_net:
    driver: ${NETWORK_BACK_NET_DRIVER}
    ipam:
      driver: default
      config:
        - subnet: ${NETWORK_BACK_NET_SUBNET}
  front_net:
    driver: ${NETWORK_FRONT_NET_DRIVER}
    ipam:
      driver: default
      config:
        - subnet: ${NETWORK_FRONT_NET_SUBNET}

```

- Сформирован monitoring/prometheus.yml:

```yml
---
global:
  scrape_interval: '5s'

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets:
        - 'localhost:9090'

  - job_name: 'ui'
    static_configs:
      - targets:
        - 'ui:9292'

  - job_name: 'comment'
    static_configs:
      - targets:
        - 'comment:9292'

  - job_name: 'node'
    static_configs:
      - targets:
        - 'node-exporter:9100'

```

- Образы запушены в мой dockerhub <https://hub.docker.com/u/immon>

### Задание со *

- Установлен go1.13.3 linux/amd64.

- Пользуясь открытыми источниками(<https://github.com/percona/mongodb_exporter/blob/v0.11.0/Dockerfile>) написан Dockerfile для экспортера мониторинга MongoDB:
/monitoring/mongodb_exporter/Dockerfile

```docker
FROM golang:1.13.10

WORKDIR /go/src/github.com/percona/mongodb_exporter

RUN git clone -b v0.11.0 https://github.com/percona/mongodb_exporter.git ./

RUN make build

FROM prom/busybox:latest

COPY --from=0 /go/src/github.com/percona/mongodb_exporter/bin/mongodb_exporter /bin/mongodb_exporter

EXPOSE 9216

ENTRYPOINT ["/bin/mongodb_exporter"]

```

- Пользуясь открытыми источниками(<https://github.com/google/cloudprober>, <https://cloudprober.org/getting-started/>) созданы наработки по формированию собственного образа cloudprober_exporter - /monitoring/cloudprober_exporter/Dockerfile.0. Текущая же версия использует уже готовый образ:
/monitoring/cloudprober_exporter/Dockerfile

```dockerfile
FROM cloudprober/cloudprober:v0.10.7
COPY cloudprober.cfg /etc/cloudprober.cfg

```

/monitoring/cloudprober_exporter/cloudprober.cfg

```cfg
probe {
  name: "ui"
  type: HTTP
  targets {
    host_names: "ui:9292"
  }
  interval_msec: 5000  # 5s
  timeout_msec: 1000   # 1s
}
probe {
  name: "comment"
  type: HTTP
  targets {
    host_names: "comment:9292"
  }
  interval_msec: 5000  # 5s
  timeout_msec: 1000   # 1s
}
probe {
  name: "node-exporter"
  type: HTTP
  targets {
    host_names: "node-exporter:9100"
  }
  interval_msec: 5000  # 5s
  timeout_msec: 1000   # 1s
}
probe {
  name: "mongodb_exporter"
  type: HTTP
  targets {
    host_names: "mongodb_exporter:9216"
  }
  interval_msec: 5000  # 5s
  timeout_msec: 1000   # 1s
}
probe {
  name: "cloudprober_exporter"
  type: HTTP
  targets {
    host_names: "cloudprober_exporter:9313"
  }
  interval_msec: 5000  # 5s
  timeout_msec: 1000   # 1s
}

```

- Доработаны monitoring/prometheus.yml:

```yml
---
global:
  scrape_interval: '5s'

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets:
        - 'localhost:9090'

  - job_name: 'ui'
    static_configs:
      - targets:
        - 'ui:9292'

  - job_name: 'comment'
    static_configs:
      - targets:
        - 'comment:9292'

  - job_name: 'node'
    static_configs:
      - targets:
        - 'node-exporter:9100'

  - job_name: 'mongodb'
    static_configs:
      - targets:
        - 'mongodb_exporter:9216'

  - job_name: 'cloudprober'
    scrape_interval: 10s
    static_configs:
      - targets:
        - 'cloudprober_exporter:9313'

```

- Доработан docker/docker-compose.yml:

```yml
version: '3.8'
services:
  post_db:
    image: mongo:3.2
    volumes:
      - post_db:/data/db
    networks:
        back_net:
            aliases:
                - ${BACK_NET_ALIAS}
  ui:
    image: ${USERNAME}/ui:${UI_VERSION}
    ports:
      - ${UI_PORT}:${UI_PORT}/tcp
    networks:
      - ${NETWORK_FRONT_NET}
  post:
    image: ${USERNAME}/post:${POST_VERSION}
    networks:
      - ${NETWORK_BACK_NET}
      - ${NETWORK_FRONT_NET}
  comment:
    image: ${USERNAME}/comment:${COMMENT_VERSION}
    networks:
      - ${NETWORK_BACK_NET}
      - ${NETWORK_FRONT_NET}
  prometheus:
    image: ${USERNAME}/prometheus
    ports:
      - '9090:9090'
    volumes:
      - prometheus_data:/prometheus
    networks:
      - ${NETWORK_BACK_NET}
      - ${NETWORK_FRONT_NET}
    command:
      - '--config.file=/etc/prometheus/prometheus.yml'
      - '--storage.tsdb.path=/prometheus'
      - '--storage.tsdb.retention=1d'
  node-exporter:
    image: prom/node-exporter:latest
    user: root
    volumes:
      - /proc:/host/proc:ro
      - /sys:/host/sys:ro
      - /:/rootfs:ro
    networks:
      - ${NETWORK_BACK_NET}
      - ${NETWORK_FRONT_NET}
    command:
      - '--path.procfs=/host/proc'
      - '--path.sysfs=/host/sys'
      - '--collector.filesystem.ignored-mount-points="^/(sys|proc|dev|host|etc)($$|/)"'
  mongodb_exporter:
    image: ${USERNAME}/mongodb_exporter:${MONGODB_EXPORTER_VERSION}
    environment:
      - MONGODB_URI=${MONGODB_URI}
    ports:
      - '9216:9216'
    networks:
      - ${NETWORK_BACK_NET}
  cloudprober_exporter:
    image: ${USERNAME}/cloudprober_exporter:${CLOUDPROBER_EXPORTER_VERSION}
    ports:
      - '9313:9313'
    networks:
      - ${NETWORK_BACK_NET}
      - ${NETWORK_FRONT_NET}

volumes:
  post_db:
  prometheus_data:

networks:
  back_net:
    driver: ${NETWORK_BACK_NET_DRIVER}
    ipam:
      driver: default
      config:
        - subnet: ${NETWORK_BACK_NET_SUBNET}
  front_net:
    driver: ${NETWORK_FRONT_NET_DRIVER}
    ipam:
      driver: default
      config:
        - subnet: ${NETWORK_FRONT_NET_SUBNET}

```

- Проверена работа mongodb_exporter:

```text
Element
mongodb_exporter_build_info{goversion="go1.13.10",instance="mongodb_exporter:9216",job="mongodb"}

```

- Проверена работа cloudprober_exporter:

```text

Element
success{dst="comment:9292",instance="cloudprober_exporter:9313",job="cloudprober",probe="comment",ptype="http"}
success{dst="ui:9292",instance="cloudprober_exporter:9313",job="cloudprober",probe="ui",ptype="http"}
success{dst="node-exporter:9100",instance="cloudprober_exporter:9313",job="cloudprober",probe="node-exporter",ptype="http"}
success{dst="mongodb_exporter:9216",instance="cloudprober_exporter:9313",job="cloudprober",probe="mongodb_exporter",ptype="http"}
success{dst="cloudprober_exporter:9313",instance="cloudprober_exporter:9313",job="cloudprober",probe="cloudprober_exporter",ptype="http"}

```

- Для реализации makefile понравилось решение в том же cloudprober(<https://github.com/google/cloudprober/blob/master/Makefile>):
/docker/Makefile

```makefile
APP_IMAGES := ui post-py comment
MON_IMAGES := prometheus mongodb_exporter cloudprober_exporter
DOCKER_COMMANDS := build push
COMPOSE_COMMANDS := config up down
COMPOSE_COMMANDS_MON := configmon upmon downmon

ifeq '$(strip $(USER_NAME))' ''
  $(warning Variable USER_NAME is not defined, using value 'user')
  USER_NAME := immon
endif

ENV_FILE := $(shell test -f ../docker/.env && echo '../docker/.env' || echo '../docker/.env.example')

build: $(APP_IMAGES) $(MON_IMAGES)

$(APP_IMAGES):
 cd ../src/$@; bash docker_build.sh; cd -

$(MON_IMAGES):
 cd ../monitoring/$@; bash docker_build.sh; cd -

push:
ifneq '$(strip $(DOCKER_HUB_PASSWORD))' ''
 @docker login -u $(USER_NAME) -p $(DOCKER_HUB_PASSWORD)
 $(foreach i,$(APP_IMAGES) $(MON_IMAGES),docker push $(USER_NAME)/$(i);)
else
 @echo 'Variable DOCKER_HUB_PASSWORD is not defined, cannot push images'
endif

$(COMPOSE_COMMANDS):
 docker-compose --env-file $(ENV_FILE) -f ../docker/docker-compose.yml $(subst up,up -d,$@)

$(COMPOSE_COMMANDS_MON):
 docker-compose --env-file $(ENV_FILE) -f ../docker/docker-compose-monitoring.yml $(subst mon,,$(subst up,up -d,$@))

$(APP_IMAGES) $(MON_IMAGES) $(DOCKER_COMMANDS) $(COMPOSE_COMMANDS) $(COMPOSE_COMMANDS_MON): FORCE

FORCE:

```

- Написаны docker_build.sh для /monitoring/*.

- В Makefile включены команды build\push для docker, config\up\down для docker-compose, сделаны наработки для отдельного поднятия окружения с контенерами мониторинга используя docker-compose(в задании не использовались).

```bash
make build --directory=./docker
make push --directory=./docker
make up --directory=./docker
make down --directory=./docker

```

for sale:)

----------
[![Build Status](https://img.shields.io/travis/com/Otus-DevOps-2019-11/immon4ik_microservices/master?color=9cf&label=immon4ik&style=plastic)](https://img.shields.io/travis/com/Otus-DevOps-2019-11/immon4ik_microservices/master?color=9cf&label=immon4ik&style=plastic)
