# Карта домашних заданий

- [Карта домашних заданий](#карта-домашних-заданий)
- [immon4ik_infra](#immon4ik_infra)
  - [ДЗ №3](#дз-3)
  - [ДЗ №4](#дз-4)
    - [create instances hw default](#create-instances-hw-default)
    - [create instances with startup scripts(install.sh=install_ruby.sh+install_mongodb.sh+deploy.sh)](#create-instances-with-startup-scriptsinstallshinstall_rubyshinstall_mongodbshdeploysh)
    - [create instances with startup scripts + fw rules](#create-instances-with-startup-scripts--fw-rules)
    - [create fw rules](#create-fw-rules)
  - [ДЗ №5](#дз-5)
  - [ДЗ №6](#дз-6)
    - [Основное задание](#основное-задание)
    - [Задание со *](#задание-со-)
    - [Задание с **](#задание-с-)
  - [ДЗ №7](#дз-7)
    - [Основное задание](#основное-задание-1)
    - [Задание со *](#задание-со--1)
    - [Задание с **](#задание-с--1)
  - [ДЗ №8](#дз-8)
    - [Основное задание](#основное-задание-2)
    - [Задание со *](#задание-со--2)
  - [ДЗ №9](#дз-9)
    - [Основное задание](#основное-задание-3)
    - [Задание со *](#задание-со--3)
  - [ДЗ №10](#дз-10)
    - [Основное задание](#основное-задание-4)
    - [Задание со *](#задание-со--4)
    - [Задание с **](#задание-с--2)
  - [ДЗ №11](#дз-11)
    - [Основное задание](#основное-задание-5)
    - [Задание со *. Часть 1.](#задание-со--часть-1)
    - [Основное задание. Тестирование ролей.](#основное-задание-тестирование-ролей)
    - [Задание со *. Часть 2.](#задание-со--часть-2)
- [immon4ik_microservices](#immon4ik_microservices)
  - [ДЗ №12](#дз-12)
    - [Основное задание](#основное-задание-6)
    - [Задание со *. Часть 1.](#задание-со--часть-1-1)
    - [Задание со *. Часть 2.](#задание-со--часть-2-1)
  - [ДЗ №13](#дз-13)
    - [Основное задание](#основное-задание-7)
    - [Задание со *. Часть 1.](#задание-со--часть-1-2)
    - [Задание со *. Часть 2.](#задание-со--часть-2-2)
  - [ДЗ №14](#дз-14)
    - [Основное задание](#основное-задание-8)
    - [Задание со *](#задание-со--5)
  - [ДЗ №15](#дз-15)
    - [Основное задание](#основное-задание-9)
    - [Задание со *](#задание-со--6)
  - [ДЗ №16](#дз-16)
    - [Основное задание](#основное-задание-10)
    - [Задание со *](#задание-со--7)
  - [ДЗ №17](#дз-17)
    - [Основное задание](#основное-задание-11)
    - [Задание со *](#задание-со--8)
    - [Задание с **](#задание-с--3)
    - [Задание с ***](#задание-с--4)
  - [ДЗ №18](#дз-18)
    - [Основное задание](#основное-задание-12)
    - [Задание со *](#задание-со--9)
  - [ДЗ №19](#дз-19)
    - [Основное задание](#основное-задание-13)
    - [Задание со *](#задание-со--10)
  - [ДЗ №20](#дз-20)
    - [Основное задание](#основное-задание-14)
    - [Задание со *](#задание-со--11)
  - [ДЗ №21](#дз-21)
    - [Основное задание](#основное-задание-15)
    - [Задание со *](#задание-со--12)
    - [Основное задание. NetworkPolicy.](#основное-задание-networkpolicy)
    - [Основное задание. Хранилище для базы.](#основное-задание-хранилище-для-базы)

# immon4ik_infra

## ДЗ №3

<details>
  <summary>ДЗ №3.</summary>
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

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №4

<details>
  <summary>ДЗ №4.</summary>
testapp_IP = 35.233.40.32
testapp_port = 9292
Для запуска использовался ps.

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### create instances hw default

<details>
  <summary>create instances hw default</summary>
gcloud compute instances create reddit-app `
  --boot-disk-size=10GB `
  --image-family ubuntu-1604-lts `
  --image-project=ubuntu-os-cloud `
  --machine-type=g1-small `
  --tags puma-server `
  --restart-on-failure

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### create instances with startup scripts(install.sh=install_ruby.sh+install_mongodb.sh+deploy.sh)

<details>
  <summary>create instances with startup scripts</summary>
gcloud compute instances create reddit-app-ss `
  --metadata-from-file startup-script=D:\_System\Study\otus\hw4\install.sh `
  --boot-disk-size=10GB `
  --image-family ubuntu-1604-lts `
  --image-project=ubuntu-os-cloud `
  --machine-type=g1-small `
  --tags puma-server `
  --restart-on-failure

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### create instances with startup scripts + fw rules

<details>
  <summary>create instances with startup scripts + fw rules</summary>
gcloud compute instances create reddit-app-ss2 `
  --metadata-from-file startup-script=D:\_System\Study\otus\hw4\install.sh `
  --boot-disk-size=10GB `
  --image-family ubuntu-1604-lts `
  --image-project=ubuntu-os-cloud `
  --machine-type=g1-small `
  --tags ss-puma-server `
  --restart-on-failure

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### create fw rules

<details>
  <summary>create fw rules</summary>
gcloud compute firewall-rules create ss-puma-server `
  --direction=INGRESS `
  --priority=1000 `
  --network=default `
  --action=ALLOW `
  --rules=tcp:9292 `
  --source-ranges=0.0.0.0/0 `
  --target-tags=ss-puma-server

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №5

<details>
  <summary>ДЗ №5.</summary>
git mv deploy.sh install_mongodb.sh install_ruby.sh config-scripts
add packer/variables.json, variables.json.example ubuntu16.json, immutable.json
add packer/scripts/deploy.sh, install_mongodb.sh, install_ruby.sh hw5.sh
add packer/files/hw5.service
add .gitignore packer/variables.json
packer build paker/ubuntu16.json
packer build paker/immutable.json
add config-scripts/create-reddit-vm.sh

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №6

### Основное задание

<details>
  <summary>ДЗ №6. Основное задание.</summary>
Установлен terraform. Скорректирован .gitignore. Добавлен код в main.tf, lb.tf. Сформированы переменные в variables.tf, outputs.tf. Добавлен пример с введенными значениями переменных terraform.tfvars.example. Добавлены files/deploy.sh, files/puma.service для деплоя приложения, выданы права на исполнение скрипта. Определён ряд переменных и внесён в код. Все конфигурационные файлы отформатированы командой terraform fmt.

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *

<details>
  <summary>ДЗ №6. Задание со *.</summary>
Добавлены ssh ключи в методанные проекта для нескольких пользователей с использованием count.
При добавлении ssh ключа через веб и последующем применении terraform apply -auto-approve удаляется ключ внесённый через веб.

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание с **

<details>
  <summary>ДЗ №6. Задание с **.</summary>
На основе открытых источников сформирован код создания lb. Разобрано выполнение всех из использованных в коде ресурсов. Создание инстансов приложений сформировано с использованием count.
В такой конфигурации приложения присутствуют две независимые БД для каждого инстанса приложения, отстутствует кеш. Соответственно данные внесенные на каждый из инстансов никак не реплицируются, что приводит к их разнородности.

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №7

### Основное задание

<details>
  <summary>ДЗ №7. Основное задание.</summary>
Изучена взаимосвязь и зависимость ресурсов. Изучена работа с модулями. Конфигурация разбина на несколько .tf файлов. Выполнено разделение приложения на среды prod и stage. Изучена работа с реестром модулей. Создан бакет для хранения state-файлов.

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *

<details>
  <summary>ДЗ №7. Задание со *.</summary>
Создана конфигурация для хранения state-файлов. State-файлы перемещены, при последовательном применении конфигураций для prod и stage сред проходит без ошибок. При параллельном применении конфигураций для prod и stage сред срабатывает блокировка "Error locking state: Error acquiring the state lock". Доработан модуль terraform-google-storage-bucket для создания нескольких бакетов с for_each, в backend.tf каждой из сред прописан относящийся к среде бакет. В таком варианте возможно одновременное применение конфигураций.

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание с **

<details>
  <summary>ДЗ №7. Задание с **.</summary>
На основе открытых источников сформированы provisioner для модулей, которые позволяют работать приложению. Параметризированы модули и среды prod и stage.

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №8

### Основное задание

<details>
  <summary>ДЗ №8. Основное задание.</summary>
Результатом повторного запуска ansible-playbook clone.yml является:

```yml
appserver: ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

Это говорит о том, что после удаления папки reddit появляется возможность вновь её склонировать.

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *

<details>
  <summary>ДЗ №8. Задание со *.</summary>
Доработаны tf файлы модулей для маркировки по группам "app","db".
Настроена работа virtualenv и python 3.6.8
С использованием открытых источников написаны скрипты inventory.py, run_inventory.py для формирования файлов динамической инвентаризации.
Выполнение задания по:

```bash
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

```bash
inventory = ./run_inventory.py

```

Отличия статической и динамической инвентаризации заключаются в архитектуре формирования блоков групп хостов. Так же наиболее ярким отличием является присутствие блок _meta и содержание в нем переменных хоста(блок hostvars), при этом инвентори скрипт не будет вызываться с --host для каждого хоста. Это позволяет сильно ускорить производительность динамического инвентори и упрощает реализацию кеширования на стороне клиента.

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №9

### Основное задание

<details>
  <summary>ДЗ №9. Основное задание.</summary>
В рамках домашнего задания исследована работа плейбуков, ограничений по группам и тегам: плейбука с одним\несколькими сценариями, работа нескольких плейбуков, а так же их работа при объединении импортом в один основной плейбук.

Написаны плейбуки для конфигурирования хостов БД и прилодения: ansible/app.yml, db.yml, deploy.yml, site.yml

Написаны плейбуки для установки ПО хостов БД и приложения используя packer: ansible/packer_app.yml, packer_db.yml

Переработаны сценарии сборки образов packer с использованием провижиенера ansible: app.json, db.json

__Переведена инфраструктура тестирования и выполнения ДЗ с windows на *nix и в gcp. Установлен весь необходимый софт из предидущих ДЗ.__

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *

<details>
  <summary>ДЗ №9. Задание со *.</summary>
Для реализации динамической инвентаризации принято решение использовать инвентори плагин gcp compute.
ansible.cfg изменен для возможности использовать динамическую инвентаризацию в gcp:

```cfg
[defaults]
inventory = ./inventory_gcp.yml
[inventory]
enable_plugins = gcp_compute, host_list, script, yaml, ini, auto

```

С использованием открытых источников(*http://docs.testing.ansible.com/ansible/latest/plugins/inventory/gcp_compute.html*) написаны файл динамической инвентаризации ansible/inventory_gcp.yml.

Создан и настроен сервисный аккаунт gcp для моего проекта.

С использованием открытых источников(*https://serverfault.com/questions/638507/how-to-access-host-variable-of-a-different-host-with-ansible*) внесена доработка в блок переменных для динамической установки ip-адреса БД в плейбук ansible/app.yml:

```yml
vars:
  db_host: "{{ hostvars['reddit-db']['ansible_default_ipv4']['address'] }}"

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №10

### Основное задание

<details>
  <summary>ДЗ №10. Основное задание.</summary>
В рамках ДЗ изучены практики по организации конфигурационного кода, разделение плейбуков по ролям, разделение окружений среды, изучены принцип работы и возможности ansible-galaxy.

Для реализации открытия 80 порта для инстанса приложения в конфигурации terraform/modules/app/variables.tf было добавлено дефолтное значение тега http-server:

```tf
[...]
variable tags {
  type    = list(string)
  default = ["reddit-app", "http-server"]
}
[...]

```

Добавлен вызов роли jdauphant.nginx в плейбук ansible/playbooks/app.yml:

```yml
[...]
  roles:
    - app
    - jdauphant.nginx
[...]

```

Изучена и применена работа с ansible-vault. Дополнен конфиг ansible/ansible.cfg для работы с мастер-ключем vault.key.
Дополнен плейбук ansible/playbooks/site.yml для создания дополнительных пользователей из зашифрованных плейбуков соответствующей среды окружения:

```yml
[...]
- import_playbook: users.yml
[...]

```

Провереня доступность приложения на 80 порту и возможность подключиться новым пользователям после применения ansible/playbooks/site.yml

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *

<details>
  <summary>ДЗ №10. Задание со *.</summary>
Для созданнового в прошлом задании динамического инвентори добавим фильтрацию по метке среды окружения:
- ansible/environments/prod/inventory_gcp.yml

```yml
[...]
filters:
  - labels.env = prod
[...]

```

- ansible/environments/stage/inventory_gcp.yml

```yml
[...]
filters:
  - labels.env = stage
[...]

```

Теперь опишим эту метку в конфигурациях terraform:
- terraform/modules/app/variables.tf

```tf
[...]
variable label_env {
  type    = string
  description = "dev, stage, prod and etc."
  default     = "dev"
}
[...]

```

- terraform/modules/app/main.tf

```tf
[...]
labels = {
  ansible_group = var.label_ansible_group
  env = var.label_env
}
[...]

```

- terraform/modules/db/variables.tf

```tf
[...]
variable label_env {
  type    = string
  description = "dev, stage, prod and etc."
  default     = "dev"
}
[...]

```

- terraform/modules/db/main.tf

```tf
[...]
labels = {
  ansible_group = var.label_ansible_group
  env = var.label_env
}
[...]

```

- terraform/prod/variables.tf

```tf
[...]
variable label_env {
  type    = string
  description = "dev, stage, prod and etc."
  default     = "prod"
}
[...]

```

- terraform/prod/main.tf

```tf
[...]
label_env = var.label_env
[...]

```

- terraform/stage/variables.tf

```tf
[...]
variable label_env {
  type    = string
  description = "dev, stage, prod and etc."
  default     = "stage"
}
[...]

```

- terraform/stage/main.tf

```tf
[...]
label_env = var.label_env
[...]

```

Поднимем среду для прода terraform/prod и попробуем выполнить ansible-playbook playbooks/site.yml --check:

```bash
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

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание с **

<details>
  <summary>ДЗ №10. Задание с **.</summary>
С использованием открытых источников - <https://docs.travis-ci.com/user/job-lifecycle/#breaking-the-build> созданна следущая структура для выполнения задания:

```bash
play-travis/ansible-3/run_tests_in_docker.sh - скрипт для TravisCI, выполняется после тестов из ДЗ№3,передает команды в контейнер с тестами, использует пользователя appuser.
play-travis/ansible-3/tests/controls/ansible.rb packer.rb terraform.rb - сценарии тестов для приложений, указанных в задании. Применяется packer validate для всех шаблонов, terraform validate и tflint для окружений stage и prod, ansible-lint для плейбуков ansible.
play-travis/ansible-3/tests/inspec.yml - конфигурационный файл для запуска inspec, в нашей реализации не используется.
play-travis/ansible-3/tests/run_tests.sh - скрипт преподготовки среды тестирования и запуска тестов из подготовленных сценариев.

```

С использованием открытых источников - <https://docs.travis-ci.com/user/job-lifecycle/#breaking-the-build> изменен .travis.yml для выполнения скриптов и сценариев созданной среды тестирования:

```yml
[...]
before_script:
- curl https://raw.githubusercontent.com/otus-devops-2019-11/immon4ik_infra/ansible-3/play-travis/ansible-3/run_tests_in_docker.sh | bash
[...]

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №11

### Основное задание

<details>
  <summary>ДЗ №11. Основное задание.</summary>

__Для выполнения задания были рассмотрены варианты работы с vagrant и virtualbox в gcp. Настроена и проверена работа с плагтном vagrant-google.__
__Настроена и использовалась инфраструктура с вложенной виртуализацие - <https://cloud.google.com/compute/docs/instances/enable-nested-virtualization-vm-instances#starting_a_nested_vm>, для этого настроен образ на базе centos с лицензией, позволяющей виртуализацию:__

```bash
gcloud compute images create nested-vm-image \
  --source-disk disk-for-nv --source-disk-zone europ-west1-b \
  --licenses "https://compute.googleapis.com/compute/v1/projects/vm-options/global/licenses/enable-vmx

```

Т.к. использовался хост с низкими ресурсами ansible/Vagrantfile был дополнет:

```bash
[...]
config.vm.boot_timeout = 1000
[...]

```

ansible/playbooks/base.yml - добавлен плейбук утановки python и использования raw модуля на vb-хосты(в моём случае был необязательным).

ansible/playbooks/site.yml - изменен плейбук для использования base.yml, удалено выполнение users.yml

ansible/playbooks/packer_app.yml и packer_db - включены в использование ролей ansible/roles/app и ansible/roles/db соответственно.

packer/app.json и db.json - доработаны провижионеры в шаблонах packer для работы с ролями ansible:

```json
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

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *. Часть 1.

<details>
  <summary>ДЗ №11. Задание со *. Часть 1.</summary>
На основе ДЗ№9 доработан ansible/Vagrantfile:

```vagrantfile
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

```bash
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

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Основное задание. Тестирование ролей.

<details>
  <summary>ДЗ №11. Основное задание. Тестирование ролей.</summary>
ansible/roles/db/tasks/molecule/default/molecule.yml - доработан сценарий для использования на хосте с низкой производительностью:

```yml
[...]
instance_raw_config_args:
  - "vm.boot_timeout = 1000"
[...]

```

ansible/roles/db/tasks/molecule/default/molecule.yml - добавлена проверка плагином testinfra:

```yml
[...]
verifier:
  name: testinfra
  lint:
    name: flake8
[...]

```

ansible/roles/db/tasks/molecule/default/tests/test_default.py - написан тест к роли db для проверки того, что БД слушает по нужному порту:

```py
[...]
def test_mongo_port_is_open(host):
    port = host.socket("tcp://0.0.0.0:27017")
    assert port.is_listening
[...]

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *. Часть 2.

<details>
  <summary>ДЗ №11. Задание со *. Часть 2.</summary>

__Создан репо https://github.com/immon4ik/ansible-role-db.git. В него скопирована роль db и удалена из репо https://github.com/Otus-DevOps-2019-11/immon4ik_infra.git.__ __Репо подключен в travisci.__
__Создан ssh ключ пользователя travis для работы в github.__ __Проверена интеграция с github.__ __Создан api_key.py для будущего деплоя приложений в gcp при помощи travis.__

ansible/enviroments/prod/requirements.yml и ansible/enviroments/prod/requirements.yml - добавлена работа с репо для роли db:

```yml
[...]
- src: https://github.com/immon4ik/ansible-role-db.git
  name: db
[...]

```

__Для репо роли db:__

ansible/roles/db/tasks/molecule/default/molecule.yml - доработан для автоматического прогона тестов в gce:

```yml
[...]
driver:
  name: gce
[...]

```

ansible/roles/db/tasks/molecule/default/molecule.yml - включено использование, собранного в основном задание образа через packer:

```yml
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

```md
[...]
custom build status badge
------------------
<!-- https://stackoverflow.com/questions/50860850/custom-label-for-travis-ci-badge-on-github-repo -->
[![Build Status](https://img.shields.io/travis/com/immon4ik/ansible-role-db/master?color=9cf&label=immon4ik&style=plastic)](https://img.shields.io/travis/com/immon4ik/ansible-role-db/master?color=9cf&label=immon4ik&style=plastic)
[...]

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

# immon4ik_microservices

## ДЗ №12

### Основное задание

<details>
  <summary>ДЗ №12. Основное задание.</summary>
Протестирована работа Container-Optimized OS from Google. Развернута управляющих хост для управления работы с репо microservices на centos 8. Изучены основы работы с docker, docker-machine.

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *. Часть 1.

<details>
  <summary>ДЗ №12. Задание со *. Часть 1.</summary>
docker inspect <u_container_id> - сводная по контейнеру, включает параметризированные данные по имени контейнера(не только id), cpu\ram\networks, настройки среды переменных и примапленных volumes для текущего контенера.

docker inspect <u_image_id> - сводная по образу, включает указание к какому котейнеру относится, какой версией docker собран, на основе каких родительских образов сделана сборка, метаданные, настройки среды переменных и примапленных volumes для образа.

На основании этого можно сделать вывод, что образы являются жестко сбилженной еденицей для формирования на их основе параметризированных сущностей более высокого уровня, т.е. контейнеров.

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *. Часть 2.

<details>
  <summary>ДЗ №12. Задание со *. Часть 2.</summary>
Используя наработки из репо infra доработаны согласно заданию:

docker-monolith/infra/packer - параметризированный сценарий packer по сборки образа с установленным docker.

docker-monolith/infra/terraform - параметризированный сценарий terraform для поднятия инстансов, с заданием их количества(по-умолчанию - 1 экземпляр).

docker-monolith/infra/ansible - комплексный пакет ansible c плейбуками, ролями, средой окружения, с использованием динамического инвентори.

Используется для установки docker и запуска там образа приложения из dockerhub.

```bash
[...]
packer build -var-file=packer/variables.json packer/docker_host.json
terraform apply --auto-approve
ansible-playbook playbooks/otus_reddit.yml
[...]

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №13

### Основное задание

<details>
  <summary>ДЗ №13. Основное задание.</summary>
Установлен hadolint для windows, добавлен плагин hadolint для vsc. Используя библиотеку рекомендаций hadolint оптимизированы:

src/comment/Dockerfile - вариант сохранен в Dockerfile.1, использован базовый образ ruby:2.6, изменены add => copy, можно выставить версию для увсех устанавлеваемых пакетов.

src/post-py/Dockerfile - вариант сохранен в Dockerfile.1, использован базовый образ 3.6.0-alpine, изменены add => copy, можно выставить версию для увсех устанавлеваемых пакетов.

src/ui/Dockerfile - вариант сохранен в Dockerfile.1, использован базовый образ ruby:2.6, изменены add => copy, можно выставить версию для увсех устанавлеваемых пакетов.

Собраны образы, создана bridge-сеть, подняты контейнеры с прописанными алиасами. Проверена работа приложения.

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *. Часть 1.

<details>
  <summary>ДЗ №13. Задание со *. Часть 1.</summary>
Изменение env без пересборки образа выполнялось путём добавления флага -e:

```bash
docker run -d --network=reddit --network-alias=post_db2 --network-alias=comment_db2 mongo:latest
docker run -d --network=reddit --network-alias=post2 -e POST_DATABASE_HOST=post_db2 immon/post:1.0
docker run -d --network=reddit --network-alias=comment2 -e COMMENT_DATABASE_HOST=comment_db2 immon/comment:1.0
docker run -d --network=reddit -p 9292:9292 -e POST_SERVICE_HOST=post2 -e COMMENT_SERVICE_HOST=comment2 immon/ui:1.0

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *. Часть 2.

<details>
  <summary>ДЗ №13. Задание со *. Часть 2.</summary>
Выполнялся подбор оптимального базового образа и необходимых пакетов для минимизации размера контейнеров, анализировалась возможность удаления временных файлов, добавление флагов блокирующих использование кеша, документации к пакетам и т.п.

Базовый образ ubuntu:16.04  - результат ~420MB в зависимости от доп.софта и флагов его установки/обновления.

src/comment/Dockerfile.2 - базовый образ 2.7.1-alpine3.11, Gemfile.lock изменен BUNDLED WITH 2.1.2 - результат 272MB.

src/ui/Dockerfile.2 - базовый образ 2.7.1-alpine3.11, Gemfile.lock изменен BUNDLED WITH 2.1.2 - результат 275MB.

src/comment/Dockerfile - базовый образ alpine:3.9.4 - результат ~74MB, в зависимости от версии ruby.

src/ui/Dockerfile - базовый образ alpine:3.9.4 - результат ~77MB, в зависимости от версии ruby.

```bash
[...]
immon/comment       3.14                11a5e8507836        48 minutes ago      272MB
immon/ui            3.14                aaa4f828340f        About an hour ago   275MB
immon/comment       2.1                 783076d76082        2 hours ago         74MB
immon/ui            2.17                f8be7f3f6497        2 hours ago         76.9MB
[...]

```

Проверена работа приложения используя все из собранных образов.

Применено подключение volume к mongodb, подняты новые версии контейнеров, проверено присутствие добавленного ранее поста:

```bash
docker volume create reddit_db
docker run -d --rm --network=reddit --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db mongo:latest
docker run -d --rm --network=reddit --network-alias=post immon/post:2.0
docker run -d --rm --network=reddit --network-alias=comment immon/comment:2.1
docker run -d --rm --network=reddit -p 9292:9292 immon/ui:2.17

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №14

### Основное задание

<details>
  <summary>ДЗ №14. Основное задание.</summary>

- Поднят контейнер только с внутренним сетевым драйвером(флаг --network none). Поднят контейнер использующий сетевой дравер хоста(флаг --network host). При попытке поднятия нескольких контейнеров, использующих сетевой дравер хоста, запущенным остается только первый контейнер, т.к. последующие пытались использовать тот же адрес и порт.
- Поднято приложение, используя созданную сеть с драйвером bridge(флаг --driver bridge). Проверена работоспособность приложения при присвоение контейнерам имен или сетевых алиасов при старте.
- Освоено создание docker-сети и подключение к ней контейнеров:

```bash
docker network create back_net --subnet=10.0.2.0/24
docker network create front_net --subnet=10.0.1.0/24
docker network connect front_net post
docker network connect front_net comment

```

- Разобран сетевой стек, изучены особенности формирования bridge-сетей, bridge-интерфейсов, iptables, правил DNAT в цепочке DOCKER, работа процесса docker-proxy.
- Изучена работа docker-compose и её команды.
Сформированы:

src/docker-compose.yml - параметризированный сценарий запуска приложения reddit, включающий работу в двух docker-сетях и сетевых алиасов.

src/.env - переменные окружения для docker-compose - <https://docs.docker.com/compose/environment-variables/#the-env-file>.

src/.env.example - шаблон для выполнения задания.

- Базовое имя проекта формируется в соответствии с папкой, из которой запускается docker-compose. Его можно задать при помощи специальной переменной среды окружения COMPOSE_PROJECT_NAME. Задана в src/.env.

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *

<details>
  <summary>ДЗ №14. Задание со *.</summary>

- Используя <https://docs.docker.com/compose/extends/> сформирован параметризированный файл для переопределения свойств src/docker-compose.
override.yml:

```yml
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

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №15

### Основное задание

<details>
  <summary>ДЗ №15. Основное задание.</summary>

__С предидущего ДЗ остался хост в gcp с установленными docker, docker-compose, docker-machine.__ __Это ДЗ является отправной точко для выполнения проекта, на основе управляющего хоста будет создан образ и описан в шаблоне packer, для создания инстанса будет использован terraform.__

- Создана хост docker-gitlab используя docker-machine:

```bash
export GOOGLE_PROJECT=my_project
docker-machine create --driver google \
 --google-machine-image "ubuntu-os-cloud/global/images/ubuntu-1604-xenial-v20200407" \
 --google-disk-size "50" --google-disk-type "pd-standard" \
 --google-machine-type "n1-standard-1" --google-zone europe-west1-b docker-gitlab

```

- Добавлены правила firewall используя gcloud(_в рамках проета будет добавлено в сценарий terraform__):

```bash
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

```yml
GITLAB_OMNIBUS_CONFIG: |
  external_url '${GITLAB_CI_URL:-http://127.0.0.1}'

```

- Поднят контейнер с GitLab CI на хосте docker-gitlab используя docker-compose:

```bash
export GITLAB_CI_URL=my_docker-gitlab_host_ip
docker-machine ssh docker-gitlab mkdir -p /srv/gitlab/config /srv/gitlab/data /srv/gitlab/logs
docker-compose -f ./gitlab-ci/docker-compose.yml config
docker-compose -f ./gitlab-ci/docker-compose.yml up -d

```

- Согласно заданию настроен проект, зарегестрирован gitlab-runner. Отработаны задания по добавлению билда, тестирования, деплоя в .gitlab-ci.yml. Отработаны задания по созданию сред окружения - статических и динамических, их ограничений по типу запуска и обязательным параметрам(пример с tag) в .gitlab-ci.yml.

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *

<details>
  <summary>ДЗ №15. Задание со *.</summary>

На основании открытых источников - <https://docs.gitlab.com/ee/ci/docker/using_docker_build.html>

- Для выполнения задания сначала сконфигурирован запуск gitlab-runner в безинтерактивном режиме. Написан скрипт, автоматизирующих запуск gitlab-runner на хосте. Т.к. планируется работа c __docker in docker(dind)__ учтена необходимость присутствие сертификатов. Для этого определены сертификаты хоста docker-gitlab и импортированы в переменные(*решение тестовое, не самое безопасное, вижу решение в монтировании volume с сертификатами MOUNT_POINT: /builds/$CI_PROJECT_PATH/mnt_*):

```bash
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

```bash
DOCKER_HUB_LOGIN=mylogin
DOCKER_HUB_PASSWORD=mypassword

```

- Интегрированы оповещения от Gitlab CI в мой канал slack(#pavel-batsev), используя встроенную интеграцию Gitlab и добавленное в канал slack приложение Incoming WebHooks.

- Доработан сценарий .gitlab-ci.yml для реализации билда образов и их пуша в мой docker hub, используя dind. Внесены доработки в .gitlab-ci.yml:

```yml
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

```yml
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

```yml
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

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №16

### Основное задание

<details>
  <summary>ДЗ №16. Основное задание.</summary>

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

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *

<details>
  <summary>ДЗ №16. Задание со *.</summary>

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

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №17

### Основное задание

<details>
  <summary>ДЗ №17. Основное задание.</summary>

- Создан хост docker-giprometheus используя docker-machine:

```bash
export GOOGLE_PROJECT=my_project
docker-machine create --driver google \
 --google-machine-image "ubuntu-os-cloud/global/images/ubuntu-1604-xenial-v20200407" \
 --google-disk-size "50" --google-disk-type "pd-standard" \
 --google-machine-type "n1-standard-1" --google-zone europe-west1-b docker-prometheus
eval $(docker-machine env docker-prometheus)

```

- Созданы правила firewall открытия портов в проекте immon4ik-docker для выполнения домашнего задания:

```bash
gcloud compute firewall-rules create cadvisor \
  --allow tcp:8080 \
  --target-tags=docker-machine \
  --description="Allow cAdvisor" \
  --direction=INGRESS

gcloud compute firewall-rules create grafana \
  --allow tcp:3000 \
  --target-tags=docker-machine \
  --description="Allow Grafana" \
  --direction=INGRESS

gcloud compute firewall-rules create alertmanager \
  --allow tcp:9093 \
  --target-tags=docker-machine \
  --description="Allow AlertManager" \
  --direction=INGRESS

```

- Скорректирован docker/docker-compose.yml и сформирован docker/docker-compose-monitiring.yml

```yml
version: '3.8'
services:
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
  cadvisor:
    image: google/cadvisor:${CADVISOR_VERSION}
    volumes:
      - '/:/rootfs:ro'
      - '/var/run:/var/run:rw'
      - '/sys:/sys:ro'
      - '/var/lib/docker/:/var/lib/docker:ro'
    ports:
      - '8080:8080'
    networks:
        - ${NETWORK_FRONT_NET}
  grafana:
    image: grafana/grafana:${GRAFANA_VERSION}
    volumes:
      - grafana_data:/var/lib/grafana
    environment:
      - GF_SECURITY_ADMIN_USER=admin
      - GF_SECURITY_ADMIN_PASSWORD=secret
    depends_on:
      - prometheus
    ports:
      - 3000:3000
    networks:
      - ${NETWORK_BACK_NET}
      - ${NETWORK_FRONT_NET}
  alertmanager:
    image: ${USERNAME}/alertmanager:${ALERTMANAGER_VERSION}
    command:
      - '--config.file=/etc/alertmanager/config.yml'
    ports:
      - 9093:9093
    networks:
      - ${NETWORK_BACK_NET}
      - ${NETWORK_FRONT_NET}

volumes:
  prometheus_data:
  grafana_data:

networks:
  back_net:
  front_net:

```

- Экспортированы дашборды grafana в monitoring/grafana/dashboards.

- Доработан сценарий формирования prometheus, добавлены джобы для post и cadvisor:
monitoring/prometheus/prometheus.yml

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

  - job_name: 'cadvisor'
    static_configs:
      - targets:
          - 'cadvisor:8080'

  - job_name: 'post'
    static_configs:
      - targets:
          - 'post:5000'

rule_files:
  - 'alerts.yml'

alerting:
  alertmanagers:
  - scheme: http
    static_configs:
    - targets:
      - 'alertmanager:9093'

```

- Настроена интеграция Incoming WebHooks - <https://devops-team-otus.slack.com/apps/A0F7XDUAZ-incoming-webhooks?next_id=0> с именем AlertManager в моём канале slack.

- Для алертов добавлены файлы monitoring/alertmanager/* и monitoring/prometheus/alert.yml

- __Замечено отсутствием метрик, указанных в методичке: ui_request_latency_seconds_bucket(как видно из названия - задержка при ответе приложения), была использована метрика ui_request_response_time_bucket; comment_count - до момента создания любого комментария. Принцип создания\экспорта\импорта дашбордов изучен.__

- __Так же считаю, что оповещения в grafana v.6.7.3 уже на достаточно хорошем уровне, что особенно важно для меня добавлена интеграция с telegram.__

- Образы запушены в мой dockerhub <https://hub.docker.com/u/immon>

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *

<details>
  <summary>ДЗ №17. Задание со *.</summary>

- Для удобства работы создан Makefile в корне репо, разделены команды docker-compose для приложения и мониторинга:

```makefile
APP_IMAGES := ui post-py comment
MON_IMAGES := prometheus mongodb_exporter cloudprober_exporter alertmanager telegraf
DOCKER_COMMANDS := build push
COMPOSE_COMMANDS := config up down
COMPOSE_COMMANDS_MON := configmon upmon downmon

ifeq '$(strip $(USER_NAME))' ''
  $(warning Variable USER_NAME is not defined, using value 'user')
  USER_NAME := immon
endif

ENV_FILE := $(shell test -f docker/.env && echo 'docker/.env' || echo 'docker/.env.example')

build: $(APP_IMAGES) $(MON_IMAGES)

$(APP_IMAGES):
 cd src/$@; bash docker_build.sh; cd -

$(MON_IMAGES):
 cd monitoring/$@; bash docker_build.sh; cd -

push:
ifneq '$(strip $(DOCKER_HUB_PASSWORD))' ''
 @docker login -u $(USER_NAME) -p $(DOCKER_HUB_PASSWORD)
 $(foreach i,$(APP_IMAGES) $(MON_IMAGES),docker push $(USER_NAME)/$(i);)
else
 @echo 'Variable DOCKER_HUB_PASSWORD is not defined, cannot push images'
endif

$(COMPOSE_COMMANDS):
 docker-compose --env-file $(ENV_FILE) -f docker/docker-compose.yml $(subst up,up -d,$@)

$(COMPOSE_COMMANDS_MON):
 docker-compose --env-file $(ENV_FILE) -f docker/docker-compose-monitoring.yml $(subst mon,,$(subst up,up -d,$@))

$(APP_IMAGES) $(MON_IMAGES) $(DOCKER_COMMANDS) $(COMPOSE_COMMANDS) $(COMPOSE_COMMANDS_MON): FORCE

FORCE:

```

- Настроено согласно документации <https://docs.docker.com/config/daemon/prometheus/>:

```bash
docker-machine ssh docker-prometheus sudo vi /etc/docker/daemon.json

```

/etc/docker/demon.json - __в документации указан 127.0.0.1 - с ним не работает, поэтому исправил на 0.0.0.0__

```json
{
  "metrics-addr" : "0.0.0.0:9323",
  "experimental" : true
}

```

- Перезапущен docker:

```bash
docker-machine ssh docker-prometheus sudo systemctl restart docker

```

- Настроено согласно документации - <https://docs.influxdata.com/telegraf/v1.14/>:
monitoring/telegraf/Dockerfile

```dockerfile
FROM telegraf:1.14.2-alpine
COPY telegraf.conf /etc/telegraf/

```

monitoring/telegraf/telegraf.conf - получен из <https://github.com/influxdata/telegraf/blob/v1.14.2/etc/telegraf.conf>  и раскомменчены настройки [[inputs.docker]] и [[outputs.prometheus_client]]. Можно было использовать "RUN telegraf config > /etc/telegraf/telegraf.conf" в Dockerfile, но я захотел иметь шаблон конфига у себя в репо.

- Для внедрения сбора метрик docker и telegraf доработан monitoring/prometheus/prometheus.yml:

```yml
---
global:
  scrape_interval: '5s'
[...]
  - job_name: 'docker'
    static_configs:
      - targets:
        - 'docker-prometheus:9323'

  - job_name: 'telegraf'
    static_configs:
      - targets:
        - 'telegraf:9273'
[...]

```

- Доработан docker/docker-compose-monitiring.yml

```yml
[...]
  telegraf:
    image: ${USERNAME}/telegraf:${TELEGRAF_VERSION}
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    ports:
      - 9273:9273
    networks:
      - ${NETWORK_BACK_NET}
      - ${NETWORK_FRONT_NET}

```

- Выгружены дашборды DockerSwarmMonitoring.json, Telegraf.json в monitoring/grafana/dashboards/

- На основе открытых источников - <https://awesome-prometheus-alerts.grep.to/rules.html> реализованы некоторые алерты:

monitoring/prometheus/alerts.yml

```yml
groups:
    - name: alert.rules
      rules:
      - alert: InstanceDown
        expr: up == 0
        for: 1m
        labels:
          severity: page
        annotations:
          summary: "Instance {{ $labels.instance }} down"
          description: "{{ $labels.instance }} of job {{ $labels.job }} has been down for more than 1 minute"
      - alert: InstanceUp
        expr: up == 1
        for: 1m
        labels:
          severity: info
        annotations:
          summary: "Instance {{$labels.instance}} up"
          description: "{{$labels.instance}} of job {{$labels.job}} has been up for more than 1 minutes."
      - alert: PrometheusNotConnectedToAlertmanager
        expr: prometheus_notifications_alertmanagers_discovered < 1
        for: 5m
        labels:
          severity: error
        annotations:
          summary: "Prometheus not connected to alertmanager (instance {{ $labels.instance }})"
          description: "Prometheus cannot connect the alertmanager\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"

```

- Сбилжены\запушены новые образы мониторинга, поднят мониторинг используя отдельную команду из Makefile:

```bash
make build && make push && make upmon

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание с **

<details>
  <summary>ДЗ №17. Задание с **.</summary>

- Написан monitoring/grafana/Dockerfile:

```dockerfile
FROM grafana/grafana:6.7.3
COPY datasources.yml /etc/grafana/provisioning/datasources/
COPY providers.yml /etc/grafana/provisioning/dashboards/
COPY ./dashboards/* /etc/grafana/provisioning/dashboards_files/

```

- Написан monitoring/grafana/datasources.yml - <https://grafana.com/docs/grafana/latest/administration/provisioning/>:

```yml
---
# config file version
apiVersion: 1

# list of datasources to insert/update depending
# what's available in the database
datasources:
  # <string, required> name of the datasource. Required
- name: Prometheus
    # <string, required> datasource type. Required
  type: prometheus
    # <string, required> access mode. proxy or direct (Server or Browser in the UI). Required
  access: proxy
    # <int> org id. will default to orgId 1 if not specified
  orgId: 1
    # <string> url
  url: http://prometheus:9090
    # <bool> mark as default datasource. Max one per org
  isDefault: true
  version: 1
    # <bool> allow users to edit datasources from the UI.
  editable: true

```

- Написан monitoring/grafana/providers.yml - <https://grafana.com/docs/grafana/latest/administration/provisioning/>:

```yml
---
# config file version
apiVersion: 1

providers:
  # <string> an unique provider name
- name: 'immon4ik_dashboards'
    # <int> org id. will default to orgId 1 if not specified
  orgId: 1
    # <string, required> name of the dashboard folder. Required
  folder: ''
    # <string> folder UID. will be automatically generated if not specified
  folderUid: ''
    # <string, required> provider type. Required
  type: file
    # <bool> disable dashboard deletion
  disableDeletion: false
    # <bool> enable dashboard editing
  editable: true
    # <int> how often Grafana will scan for changed dashboards
  updateIntervalSeconds: 10
    # <bool> allow updating provisioned dashboards from the UI
  allowUiUpdates: false
  options:
    # <string, required> path to dashboard files on disk. Required
    path: /etc/grafana/provisioning/dashboards_files/

```

- Немного доработаны Makefile и docker/docker-compose-monitoring.yml:
Makefile

```makefile
[...]
MON_IMAGES := prometheus mongodb_exporter cloudprober_exporter alertmanager telegraf grafana
[...]

```

docker/docker-compose-monitoring.yml

```yml
[...]
image: ${USERNAME}/grafana:${GRAFANA_VERSION}
[...]

```

- Реализована отправка оповещений по email - <https://www.robustperception.io/sending-alert-notifications-to-multiple-destinations> и <https://help.mail.ru/mail/mailer/popsmtp>:
monitoring/alertmanager/config.yml

```yml
---
global:
  slack_api_url: 'https://hooks.slack.com/services/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'

route:
 receiver: slack-notifications

receivers:
- name: slack-notifications
  slack_configs:
  - channel: '#pavel-batsev'
    title: "{{ range .Alerts }}{{ .Annotations.summary }}\n{{ end }}"
    text: "{{ range .Alerts }}{{ .Annotations.description }}\n{{ end }}"
  email_configs:
  - to: 'otus@immon.pro'
    from: 'otus@immon.pro'
    smarthost: 'smtp.mail.ru:465'
    auth_username: 'otus@immon.pro'
    auth_password: 'Trewq123'
    send_resolved: true
    require_tls: false
    headers:
      Subject: "{{ range .Alerts }}{{ .Annotations.summary }}\n{{ end }}"

```

- Сбилжены\запушены новые образы мониторинга, поднят мониторинг используя отдельную команду из Makefile:

```bash
make build && make push && make upmon

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание с ***

<details>
  <summary>ДЗ №17. Задание с ***.</summary>

- _Используя связку Autoheal + AWX, реализуйте автоматическое исправление проблем (например рестарт одного из микросервисов при падении)_ - не реализовывалось, т.к. считаю в рамках ДЗ избыточным, планирую выполнить в рамках проекта - <https://github.com/immon4ik/immon4ik_project>

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №18

### Основное задание

<details>
  <summary>ДЗ №18. Основное задание.</summary>

- __Переработан README.md. Включены быстрые переходы между заданиями и сполеры для компактного отображения.__

- Выгружен и доработан актуальный код приложения в /src. Старый /src переименован в /src_mcsrv.

- Создан хост docker-logging используя docker-machine:

```bash
export GOOGLE_PROJECT=my_project
docker-machine create --driver google \
 --google-machine-image "ubuntu-os-cloud/global/images/ubuntu-1604-xenial-v20200407" \
 --google-disk-size "50" --google-disk-type "pd-standard" \
 --google-machine-type "n1-standard-1" \
 --google-open-port 5601/tcp \
 --google-open-port 9292/tcp \
 --google-open-port 9411/tcp --google-zone europe-west1-b docker-logging
eval $(docker-machine env docker-logging)

```

- Созданы правила firewall открытия портов в проекте immon4ik-docker для выполнения домашнего задания:

```bash
gcloud compute firewall-rules create fluentd \
  --allow tcp:24224 \
  --target-tags=docker-machine \
  --description="Allow fluentd" \
  --direction=INGRESS

```

- Создан сценарий сборки контейнеров логирования:

docker/docker-compose-logging.yml

```yml
version: '3.8'
services:
  fluentd:
    image: ${USERNAME}/fluentd
    ports:
      - '24224:24224'
      - '24224:24224/udp'

  elasticsearch:
    image: elasticsearch:7.6.2
    environment:
      - 'discovery.type=single-node'
    expose:
      - 9200
    ports:
      - '9200:9200'

  kibana:
    image: kibana:7.6.2
    ports:
      - '5601:5601'

networks:
  back_net:
  front_net:

```

- Написан\сбилжен\запушен образ fluentd:

logging/fluentd/Dockerfile

```dockerfile
FROM fluent/fluentd:v0.12
RUN fluent-gem install fluent-plugin-elasticsearch --no-rdoc --no-ri --version 1.18.1
RUN fluent-gem install fluent-plugin-grok-parser --no-rdoc --no-ri --version 1.0.0
COPY fluent.conf /fluentd/etc

```

- Доработан Makefile:

```makefile
APP_IMAGES := ui post-py comment
MON_IMAGES := prometheus mongodb_exporter cloudprober_exporter alertmanager telegraf grafana
LOG_IMAGES := fluentd
DOCKER_COMMANDS := build push
COMPOSE_COMMANDS := config up down
COMPOSE_COMMANDS_MON := configmon upmon downmon
COMPOSE_COMMANDS_LOG := configlog uplog downlog

ifeq '$(strip $(USER_NAME))' ''
  $(warning Variable USER_NAME is not defined, using value 'user')
  USER_NAME := immon
endif

ENV_FILE := $(shell test -f docker/.env && echo 'docker/.env' || echo 'docker/.env.example')

build: $(APP_IMAGES) $(MON_IMAGES)

$(APP_IMAGES):
 cd src/$(subst post,post-py,$@); bash docker_build.sh; cd -

$(MON_IMAGES):
 cd monitoring/$@; bash docker_build.sh; cd -

$(LOG_IMAGES):
 cd loggging/$@; bash docker_build.sh; cd -

push:
ifneq '$(strip $(DOCKER_HUB_PASSWORD))' ''
 @docker login -u $(USER_NAME) -p $(DOCKER_HUB_PASSWORD)
 $(foreach i,$(APP_IMAGES) $(MON_IMAGES) $(LOG_IMAGES),docker push $(USER_NAME)/$(i);)
else
 @echo 'Variable DOCKER_HUB_PASSWORD is not defined, cannot push images'
endif

$(COMPOSE_COMMANDS):
 docker-compose --env-file $(ENV_FILE) -f docker/docker-compose.yml $(subst up,up -d,$@)

$(COMPOSE_COMMANDS_MON):
 docker-compose --env-file $(ENV_FILE) -f docker/docker-compose-monitoring.yml $(subst mon,,$(subst up,up -d,$@))

$(COMPOSE_COMMANDS_LOG):
 docker-compose --env-file $(ENV_FILE) -f docker/docker-compose-logging.yml $(subst log,,$(subst up,up -d,$@))

$(APP_IMAGES) $(MON_IMAGES) $(DOCKER_COMMANDS) $(COMPOSE_COMMANDS) $(COMPOSE_COMMANDS_MON) $(COMPOSE_COMMANDS_LOG): FORCE

FORCE:

```

- Для устранения ошибок и остановки контейнера elasticsearch - добавлено увеличение парасетра хоста vm.max_map_count:

```bash
docker-machine ssh docker-logging sudo sysctl -w vm.max_map_count=262144

```

- Для устранения ошибок и остановки контейнера elasticsearch - определена переменная discovery.type:

docker/docker-compose-logging.yml

```yml
[...]
    environment:
      - 'discovery.type=single-node'

```

- Отработаны все шаги домашнего задания, в завершение основного задания:

logging/fluentd/fluent.conf

```conf
<source>
  @type forward
  port 24224
  bind 0.0.0.0
</source>

<filter service.post>
  @type parser
  format json
  key_name log
</filter>

<filter service.ui>
  @type parser
  key_name log
  format grok
  grok_pattern %{RUBY_LOGGER}
</filter>

<filter service.ui>
  @type parser
  format grok
  grok_pattern service=%{WORD:service} \| event=%{WORD:event} \| request_id=%{GREEDYDATA:request_id} \| message='%{GREEDYDATA:message}'
  key_name message
  reserve_data true
</filter>

<match *.**>
  @type copy
  <store>
    @type elasticsearch
    host elasticsearch
    port 9200
    logstash_format true
    logstash_prefix fluentd
    logstash_dateformat %Y%m%d
    include_tag_key true
    type_name access_log
    tag_key @log_name
    flush_interval 1s
  </store>
  <store>
    @type stdout
  </store>
</match>

```

- Добавлен и освоена работа с Zipkin.

docker/docker-compose.yml

```yml
[...]
    environment:
      - ZIPKIN_ENABLED=${ZIPKIN_ENABLED} # Для всех микросервисов приложения.
[...]

```

docker/docker-compose-logging.yml

```yml
[...]
  zipkin:
    image: openzipkin/zipkin
    ports:
      - '9411:9411'
    networks:
      - front_net
      - back_net
[...]

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *

<details>
  <summary>ДЗ №18. Задание со *.</summary>

- Обранужено различие в форматах только для поля message. Используя открытые источники - <https://github.com/fluent/fluent-plugin-grok-parser> доработан конфиг fluentd, чтобы сработал лишь тот шаблон, что совпадёт первым:

logging/fluentd/fluent.conf

```conf
[...]
<filter service.ui>
  @type parser
  format grok
  <grok>
    pattern service=%{WORD:service} \| event=%{WORD:event} \| request_id=%{GREEDYDATA:request_id} \| message='%{GREEDYDATA:message}'
  </grok>
  <grok>
    pattern service=%{WORD:service} \| event=%{WORD:event} \| path=%{URIPATH:path} \| request_id=%{GREEDYDATA:request_id} \| remote_addr=%{IP:remote_addr} \| method= %{WORD:message} \| response_status=%{INT:response_status}
  </grok>
  key_name message
  reserve_data true
</filter>
[...]

```

- Приложение со сломанным кодом выгружено в logging/bugged. Немного доработаны Dokerfile микросервисов приложения(добавлены переменные среды, чтобы не захламлять docker-compose.yml) и скрипты сборки docker_build.sh(добавлен тег bug для разделения образов). Доработан Makefile для разделения разделения рабочего и нерабочего кода:

Makefile

```makefile
APP_IMAGES := ui post-py comment
APP_BUG_IMAGES := ui post-py comment
MON_IMAGES := prometheus mongodb_exporter cloudprober_exporter alertmanager telegraf grafana
LOG_IMAGES := fluentd
DOCKER_COMMANDS := build push
COMPOSE_COMMANDS := config up down
COMPOSE_COMMANDS_MON := configmon upmon downmon
COMPOSE_COMMANDS_LOG := configlog uplog downlog
COMPOSE_COMMANDS_BUG:= configbug upbug downbug

ifeq '$(strip $(USER_NAME))' ''
  $(warning Variable USER_NAME is not defined, using value 'user')
  USER_NAME := immon
endif

ENV_FILE := $(shell test -f docker/.env && echo 'docker/.env' || echo 'docker/.env.example')
ENV_BUG_FILE := $(shell test -f logging/bugged/.env && echo 'logging/bugged/.env')

build: $(APP_IMAGES) $(MON_IMAGES) $(LOG_IMAGES) $(APP_BUG_IMAGES)

$(APP_IMAGES):
 cd src/$(subst post,post-py,$@); bash docker_build.sh; cd -

$(MON_IMAGES):
 cd monitoring/$@; bash docker_build.sh; cd -

$(LOG_IMAGES):
 cd logging/$@; bash docker_build.sh; cd -

$(APP_BUG_IMAGES):
 cd logging/bugged/$(subst post,post-py,$@); bash docker_build.sh; cd -

push:
ifneq '$(strip $(DOCKER_HUB_PASSWORD))' ''
 @docker login -u $(USER_NAME) -p $(DOCKER_HUB_PASSWORD)
 $(foreach i,$(APP_IMAGES) $(MON_IMAGES) $(LOG_IMAGES) $(APP_BUG_IMAGES),docker push $(USER_NAME)/$(i);)
else
 @echo 'Variable DOCKER_HUB_PASSWORD is not defined, cannot push images'
endif

$(COMPOSE_COMMANDS):
 docker-compose --env-file $(ENV_FILE) -f docker/docker-compose.yml $(subst up,up -d,$@)

$(COMPOSE_COMMANDS_MON):
 docker-compose --env-file $(ENV_FILE) -f docker/docker-compose-monitoring.yml $(subst mon,,$(subst up,up -d,$@))

$(COMPOSE_COMMANDS_LOG):
 docker-compose --env-file $(ENV_FILE) -f docker/docker-compose-logging.yml $(subst log,,$(subst up,up -d,$@))

$(COMPOSE_COMMANDS_BUG):
 docker-compose --env-file $(ENV_BUG_FILE) -f logging/bugged/docker-compose.yml $(subst bug,,$(subst up,up -d,$@))

$(APP_IMAGES) $(MON_IMAGES) $(DOCKER_COMMANDS) $(COMPOSE_COMMANDS) $(COMPOSE_COMMANDS_MON) $(COMPOSE_COMMANDS_LOG) $(COMPOSE_COMMANDS_BUG): FORCE

FORCE:

```

- Запущено приложение, созданы тестовые посты, выявлена явная задержка при переходе на опубликованный пост. Выполнен анализ трейсов, особо примечательно значение span-а db_find_single_post занимающее более 3 секунды:

```read
POST
db_find_single_post
[3.006s]

```

- Делаем предположение, что ошибка в коде микросервиса post-py. Ищем в коде /logging/bugged/post-py/post_app.py все, что связано с db_find_single_post. Находим функцию:

/logging/bugged/post-py/post_app.py

```py
[...]
# Retrieve information about a post
@zipkin_span(service_name='post', span_name='db_find_single_post')
def find_post(id):
    start_time = time.time()
    try:
        post = app.db.find_one({'_id': ObjectId(id)})
    except Exception as e:
        log_event('error', 'post_find',
                  "Failed to find the post. Reason: {}".format(str(e)),
                  request.values)
        abort(500)
    else:
        stop_time = time.time()  # + 0.3
        resp_time = stop_time - start_time
        app.post_read_db_seconds.observe(resp_time)
        time.sleep(3)
        log_event('info', 'post_find',
                  'Successfully found the post information',
                  {'post_id': id})
        return dumps(post)
[...]

```

- Анализ функции показал присутствие принудительной задержки time.sleep(3) в блоке else функции find_post(id), комментим данную строчку кода:

/logging/bugged/post-py/post_app.py

```py
[...]
    else:
        stop_time = time.time()  # + 0.3
        resp_time = stop_time - start_time
        app.post_read_db_seconds.observe(resp_time)
        # time.sleep(3)
        log_event('info', 'post_find',
                  'Successfully found the post information',
                  {'post_id': id})
        return dumps(post)
[...]

```

- Билдим\пушим обновленный образ post-py и поднимаем приложение:

```bash
make build && make push && make upbug

```

- Проверена работа перехода по постам и получены удовлетворительные результаты:

```read
POST
db_find_single_post
[3.357ms]

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №19

### Основное задание

<details>
  <summary>ДЗ №19. Основное задание.</summary>

- Выполнен туториал "сложного пути" до шага Cleaning Up. Разобраны особенности инсталяции. Еще раз убедился в удобстве tmux, для себя подчерпнул возможность синхронизации выполнения команд\скриптов в разных панелях - <https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/master/docs/01-prerequisites.md>.

- Написаны манифесты и сохранены в kubernetes/reddit. Подняты поды с микросервисами приложения:

```bash
kubectl apply -f kubernetes/reddit/mongo-deployment.yml
kubectl apply -f kubernetes/reddit/post-deployment.yml
kubectl apply -f kubernetes/reddit/comment-deployment.yml
kubectl apply -f kubernetes/reddit/ui-deployment.yml

```

> output

```bash
deployment.apps/mongo-deployment created
deployment.apps/post-deployment created
deployment.apps/comment-deployment created
deployment.apps/ui-deployment created

```

- Проверен статус под:

```bash
kubectl get pods

```

> output

```bash
NAME                                  READY   STATUS    RESTARTS   AGE
busybox                               1/1     Running   0          35m
comment-deployment-6d9798fc9b-79fcz   1/1     Running   0          26s
mongo-deployment-86d49445c4-ht6ct     1/1     Running   0          67s
nginx-554b9c67f9-ztr7k                1/1     Running   0          32m
post-deployment-76648c64c6-bgmbd      1/1     Running   0          43s
ui-deployment-58985d7644-njhn8        1/1     Running   0          13s

```

- Удален кластер, используя шаг Cleaning Up.

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *

<details>
  <summary>ДЗ №19. Задание со *.</summary>

- На основе открытых источников рассмотрены различные варианты реализации. Вариант 1 - <https://github.com/pythops/Kubernetes-the-hard-way-with-Ansible> решил не реализовывать, т.к. используется не gcp, а vagrant и я не располагаю физическим\виртуальным железом для его работы, а облачный вариант, который был реализован в рамках ДЗ №11 - <https://github.com/Otus-DevOps-2019-11/immon4ik_infra/tree/ansible-4> показался мне избыточным.

- За основу было взято решение - <https://github.com/jugatsu/kubernates-the-hard-way-using-only-ansible>. Репо был форкнут - <https://github.com/immon4ik/kubernates-the-hard-way-using-only-ansible>.

- Плейбуки реализации были рассмотрены и требуют кастомизации. После этого можно использовать готовые плейбуки из репо. Также есть вариант с переработкой репо в роль thw. Основная идея: используя среды окружения, роли и сводный плейбук развернуть всё описанное в туториале. Сформировани каркас решения задачи, основные наработки и архитектура реализации добавлены в kubernetes/ansible.

kubernetes/ansible/requirements.

```yml
---
- src: https://github.com/immon4ik/kubernates-the-hard-way-using-only-ansible.git
  name: thw

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №20

### Основное задание

<details>
  <summary>ДЗ №20. Основное задание.</summary>

- Наработки плейбуков из задания со * ДЗ№19 перенесены в каталог kubernetes/exta-k8s-1

__Настроена и использовалась инфраструктура с вложенной виртуализацией - <https://cloud.google.com/compute/docs/instances/enable-nested-virtualization-vm-instances#starting_a_nested_vm>, для этого настроен образ на базе centos с лицензией, позволяющей виртуализацию:__

```bash
gcloud compute disks create disk-for-nv --project=immon4ik-k8s --type=pd-standard \
  --size=20GB --zone=europe-west1-b --image=centos-8-v20200504 --image-project=centos-cloud

gcloud compute images create centos8-nested-vm-image --project=immon4ik-k8s \
  --source-disk=disk-for-nv --source-disk-zone=europe-west1-b \
  --licenses "https://compute.googleapis.com/compute/v1/projects/vm-options/global/licenses/enable-vmx"

gcloud compute instances create k8s-local-01 --zone=europe-west1-b --machine-type=n1-standard-1 \
  --min-cpu-platform "Intel Haswell" --tags=http-server,https-server --image=centos8-nested-vm-image

```

- Откроем порты для проверки микросервисов:

```bash
gcloud compute firewall-rules create reddit-app \
  --direction=INGRESS \
  --priority=1000 \
  --network=default \
  --action=ALLOW \
  --rules=tcp:8080,tcp:9292,tcp:5000 \
  --source-ranges=0.0.0.0/0 \
  --target-tags=ss-reddit-app-k8s

```

- Добавим созданный тег в инстанс k8s-local-01:

```bash
gcloud compute instances add-tags k8s-local-01 --tags=ss-reddit-app-k8s

```

- Подключаемся к созданному хосту:

```bash
ssh immon4ik@ip

```

- Устанавливаем kubectl, проверяем версию:

```bash
sudo dnf install -y kubectl && kubectl version --client

```

- Устанавливаем VB:

```bash
sudo dnf config-manager --add-repo=https://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo

sudo dnf update -y
sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo dnf install -y binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms
sudo dnf install -y VirtualBox-6.1
sudo /usr/lib/virtualbox/vboxdrv.sh setup
sudo usermod -a -G vboxusers immon4ik

```

- Устанавливаем minikube:

```bash
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube

sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/

```

- __Замечена ошибки методички(по состоянию на 14.05.2020): неактуальная версии api для deployment, заменяем на apps/v1; неверная команда для minikube - minikube services list, заменяем на minikube service list__

- Выполнив все парктические задания, касаемые minikube, сформирован пул yml-файлов расположенных в kubernetes/reddit/

- __Т.к. я использую ресурсы gcp(рекомендую не скупиться и добавить) важным моментом является проброс портов vb,для проверки работы микросервисов и возможность ознакомится с веб-интерфейсом minikube.__ Воспользуемся открытыми источниками для решения данной задачи - <https://stackoverflow.com/questions/58093910/how-to-start-minikube-on-specific-network>

```bash
vboxmanage list vms
vboxmanage controlvm "minikube" natpf1 "app,tcp,,9292,,32092"

```

- Выполнив все парктические задания, касаемые gke выявлена масса ошибок в методичке, особенно явная разница рассматриваемой версии и актуальной.

-Сделан скриншот приложения kubernetes/screenshot/reddit-app.png:

![reddit-app](https://github.com/immon4ik/otus_2019/blob/kubernetes-2/kubernetes/screenshot/reddit-app.png?raw=true)

И сформировано правило firewall:

```bash
gcloud compute firewall-rules create k8s-allow \
  --direction=INGRESS --priority=1000 --network=default \
  --action=ALLOW --rules=tcp:30000-32767 --source-ranges=0.0.0.0/0
```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *

<details>
  <summary>ДЗ №20. Задание со *.</summary>

- При помощи открытых источников (<https://learn.hashicorp.com/terraform/kubernetes/provision-gke-cluster>) сформированы сценарии сборки terraform, расположены в kubernetes/extra-k8s-2/terraform-provision-gke-cluster/

gke.tf

```tf
# GKE cluster
resource "google_container_cluster" "primary" {
  name     = "${var.project_id}-gke"
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  master_auth {
    username = var.gke_username
    password = var.gke_password

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project_id
    }

    # preemptible  = true
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}

```

vpc.tf

```tf
provider "google" {
  project = var.project_id
  region  = var.region
}

# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"

}

resource "google_compute_firewall" "firewall-k8s" {
  name    = "allow-k8s"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = var.ports
  }
  direction     = "INGRESS"
  source_ranges = var.source_ranges
  target_tags   = ["gke-node", "${var.project_id}-gke"]
}

```

versions.tf

```tf

terraform {
  required_version = ">= 0.12"
}

```

variables.tf

```tf
variable "project_id" {
  type        = string
  description = "project id"
}

variable "region" {
  type        = string
  description = "region"
}

variable "source_ranges" {
  type        = list(string)
  description = "IP source range"
}

variable "ports" {
  type        = list(string)
  description = "Port range"
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}

```

terraform.tfvars

```tf
project_id    = "immon4ik-k8s"
region        = "europe-west3"
source_ranges = ["0.0.0.0/0"]
ports         = ["30000-32767"]

```

outputs.tf

```tf
output "step_01_gcloud_connect_command" {
  value = "gcloud container clusters get-credentials ${var.project_id}-gke --region ${var.region}"
}

output "step_02_deploy_the_k8s_dashboard_command" {
  value = "kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml"
}

output "step_03_create_a_ClusterRoleBinding_command" {
  value = "kubectl apply -f https://raw.githubusercontent.com/hashicorp/learn-terraform-provision-eks-cluster/master/kubernetes-dashboard-admin.rbac.yaml"
}

output "step_04_generate_the_authorization_token_command" {
  value = "kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep service-controller-token | awk '{print $1}')"
}

output "step_05_create_a_proxy_server_command" {
  value = "kubectl proxy"
}

output "step_05_k8s_dashboard_link" {
  value = "http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"
}


```

- Запускаем поднятие кластера из каталога kubernetes/extra-k8s-2/terraform-gke-cluster/:

```bash
cd kubernetes/extra-k8s-2/terraform-gke-cluster/
terraform fmt
terraform init
terraform apply --auto-approve

```

- Чтобы подключиться к кластеру, установить дашборд и настроить доступ можно воспользоваться командами из outputs:

```bash
gcloud container clusters get-credentials immon4ik-k8s-gke --region europe-west3
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml
kubectl apply -f https://raw.githubusercontent.com/hashicorp/learn-terraform-provision-eks-cluster/master/kubernetes-dashboard-admin.rbac.yaml
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep service-controller-token | awk '{print $1}')
kubectl proxy --address 0.0.0.0 --accept-hosts '.*'
curl http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

```

- Погасим кластер:

```bash
terraform destroy --auto-approve

```

- Добавим в свой репо настройки dashboard:

kubernetes/extra-k8s-2/terraform-gke-cluster/recommended.yaml

```yml
---
apiVersion: v1
kind: Namespace
metadata:
  name: kubernetes-dashboard

---

apiVersion: v1
kind: ServiceAccount
metadata:
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard
  namespace: kubernetes-dashboard

---

kind: Service
apiVersion: v1
metadata:
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard
  namespace: kubernetes-dashboard
spec:
  ports:
    - port: 443
      targetPort: 8443
  selector:
    k8s-app: kubernetes-dashboard

---

apiVersion: v1
kind: Secret
metadata:
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard-certs
  namespace: kubernetes-dashboard
type: Opaque

---

apiVersion: v1
kind: Secret
metadata:
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard-csrf
  namespace: kubernetes-dashboard
type: Opaque
data:
  csrf: ""

---

apiVersion: v1
kind: Secret
metadata:
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard-key-holder
  namespace: kubernetes-dashboard
type: Opaque

---

kind: ConfigMap
apiVersion: v1
metadata:
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard-settings
  namespace: kubernetes-dashboard

---

kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard
  namespace: kubernetes-dashboard
rules:
  # Allow Dashboard to get, update and delete Dashboard exclusive secrets.
  - apiGroups: [""]
    resources: ["secrets"]
    resourceNames: ["kubernetes-dashboard-key-holder", "kubernetes-dashboard-certs", "kubernetes-dashboard-csrf"]
    verbs: ["get", "update", "delete"]
    # Allow Dashboard to get and update 'kubernetes-dashboard-settings' config map.
  - apiGroups: [""]
    resources: ["configmaps"]
    resourceNames: ["kubernetes-dashboard-settings"]
    verbs: ["get", "update"]
    # Allow Dashboard to get metrics.
  - apiGroups: [""]
    resources: ["services"]
    resourceNames: ["heapster", "dashboard-metrics-scraper"]
    verbs: ["proxy"]
  - apiGroups: [""]
    resources: ["services/proxy"]
    resourceNames: ["heapster", "http:heapster:", "https:heapster:", "dashboard-metrics-scraper", "http:dashboard-metrics-scraper"]
    verbs: ["get"]

---

kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard
rules:
  # Allow Metrics Scraper to get metrics from the Metrics server
  - apiGroups: ["metrics.k8s.io"]
    resources: ["pods", "nodes"]
    verbs: ["get", "list", "watch"]

---

apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard
  namespace: kubernetes-dashboard
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: kubernetes-dashboard
subjects:
  - kind: ServiceAccount
    name: kubernetes-dashboard
    namespace: kubernetes-dashboard

---

apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: kubernetes-dashboard
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: kubernetes-dashboard
subjects:
  - kind: ServiceAccount
    name: kubernetes-dashboard
    namespace: kubernetes-dashboard

---

kind: Deployment
apiVersion: apps/v1
metadata:
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard
  namespace: kubernetes-dashboard
spec:
  replicas: 1
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      k8s-app: kubernetes-dashboard
  template:
    metadata:
      labels:
        k8s-app: kubernetes-dashboard
    spec:
      containers:
        - name: kubernetes-dashboard
          image: kubernetesui/dashboard:v2.0.0-beta8
          imagePullPolicy: Always
          ports:
            - containerPort: 8443
              protocol: TCP
          args:
            - --auto-generate-certificates
            - --namespace=kubernetes-dashboard
            # Uncomment the following line to manually specify Kubernetes API server Host
            # If not specified, Dashboard will attempt to auto discover the API server and connect
            # to it. Uncomment only if the default does not work.
            # - --apiserver-host=http://my-address:port
          volumeMounts:
            - name: kubernetes-dashboard-certs
              mountPath: /certs
              # Create on-disk volume to store exec logs
            - mountPath: /tmp
              name: tmp-volume
          livenessProbe:
            httpGet:
              scheme: HTTPS
              path: /
              port: 8443
            initialDelaySeconds: 30
            timeoutSeconds: 30
          securityContext:
            allowPrivilegeEscalation: false
            readOnlyRootFilesystem: true
            runAsUser: 1001
            runAsGroup: 2001
      volumes:
        - name: kubernetes-dashboard-certs
          secret:
            secretName: kubernetes-dashboard-certs
        - name: tmp-volume
          emptyDir: {}
      serviceAccountName: kubernetes-dashboard
      nodeSelector:
        "beta.kubernetes.io/os": linux
      # Comment the following tolerations if Dashboard must not be deployed on master
      tolerations:
        - key: node-role.kubernetes.io/master
          effect: NoSchedule

---

kind: Service
apiVersion: v1
metadata:
  labels:
    k8s-app: dashboard-metrics-scraper
  name: dashboard-metrics-scraper
  namespace: kubernetes-dashboard
spec:
  ports:
    - port: 8000
      targetPort: 8000
  selector:
    k8s-app: dashboard-metrics-scraper

---

kind: Deployment
apiVersion: apps/v1
metadata:
  labels:
    k8s-app: dashboard-metrics-scraper
  name: dashboard-metrics-scraper
  namespace: kubernetes-dashboard
spec:
  replicas: 1
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      k8s-app: dashboard-metrics-scraper
  template:
    metadata:
      labels:
        k8s-app: dashboard-metrics-scraper
      annotations:
        seccomp.security.alpha.kubernetes.io/pod: 'runtime/default'
    spec:
      containers:
        - name: dashboard-metrics-scraper
          image: kubernetesui/metrics-scraper:v1.0.1
          ports:
            - containerPort: 8000
              protocol: TCP
          livenessProbe:
            httpGet:
              scheme: HTTP
              path: /
              port: 8000
            initialDelaySeconds: 30
            timeoutSeconds: 30
          volumeMounts:
          - mountPath: /tmp
            name: tmp-volume
          securityContext:
            allowPrivilegeEscalation: false
            readOnlyRootFilesystem: true
            runAsUser: 1001
            runAsGroup: 2001
      serviceAccountName: kubernetes-dashboard
      nodeSelector:
        "beta.kubernetes.io/os": linux
      # Comment the following tolerations if Dashboard must not be deployed on master
      tolerations:
        - key: node-role.kubernetes.io/master
          effect: NoSchedule
      volumes:
        - name: tmp-volume
          emptyDir: {}

```

kubernetes/extra-k8s-2/terraform-gke-cluster/kubernetes-dashboard-admin.rbac.yaml

```yml
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kube-system
---
# Create ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kube-system

```

- Теперь перейдём на свою локальный хост windows и проделаем все теже операции, но из корня репо и с собственными сценариями для дашборда:

```powershell
cd kubernetes/extra-k8s-2/terraform-gke-cluster/
terraform fmt
terraform init
terraform apply --auto-approve
gcloud container clusters get-credentials immon4ik-k8s-gke --region europe-west3
kubectl apply -f recommended.yaml
kubectl apply -f kubernetes-dashboard-admin.rbac.yaml
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | findstr service-controller-token | awk '{print $1}')
kubectl proxy --address 0.0.0.0 --accept-hosts '.*'
curl http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

```

- Получили рабочий дашборд, в который можно авторизоваться, используя сгенерированный токен service-controller-token-*

![k8s-dashboard-localhost](https://github.com/immon4ik/otus_2019/blob/kubernetes-2/kubernetes/screenshot/k8s-dashboard-localhost.png?raw=true)

- Погасим кластер:

```powershell
terraform destroy --auto-approve

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

## ДЗ №21

### Основное задание

<details>
  <summary>ДЗ №21. Основное задание.</summary>

- Поднят кластер:

```powershell
cd kubernetes/extra-k8s-2/terraform-gke-cluster/
terraform fmt
terraform init
terraform apply --auto-approve
gcloud container clusters get-credentials immon4ik-k8s-gke --region europe-west3

```

- Поднята рабочее приложение с namespase dev:

```powershell

cd kubernetes/reddit/
kubectl apply  -f kubernetes/reddit/ -n dev

```

- Выполнив все практические задания, сформирован сертификат и ключ, ingress сценарий балансировщика, обновлён ui-service:

kubernetes/reddit/ui-service.yml

```yml
---
apiVersion: v1
kind: Service
metadata:
  name: ui
  labels:
    app: reddit
    component: ui
spec:
  type: NodePort
  ports:
    - port: 9292
      protocol: TCP
      targetPort: 9292
  selector:
    app: reddit
    component: ui

```

kubernetes/reddit/ui-ingress.yml

```yml
---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ui
  annotations:
    kubernetes.io/ingress.allow-http: "false"
spec:
  tls:
  - secretName: ui-ingress
  backend:
    serviceName: ui
    servicePort: 9292

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Задание со *

<details>
  <summary>ДЗ №21. Задание со *.</summary>

- Используя <https://kubernetes.io/docs/concepts/services-networking/ingress/>, сформирован создаваемый объект Secret в виде Kubernetes-манифеста. Согласно условию ввода значения сертификата и ключа в формате "base64 encoded cert/key", преобразован их вывод:

```powershell
openssl base64 -e -A -in tls.crt
openssl base64 -e -A -in tls.key

```

- Вывод внесен в манифест:

kubernetes/extra-k8s-3/tls-secret.yml

```yml
---
apiVersion: v1
kind: Secret
metadata:
    name: ui-extra-ingress
    namespace: dev
    selfLink: /api/v1/namespaces/dev/secrets/ui-ingress
data:
    tls.crt: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURNakNDQWhxZ0F3SUJBZ0lKQUpvSzJITzU3WlpjTUEwR0NTcUdTSWIzRFFFQkJRVUFNQm94R0RBV0JnTlYKQkFNVER5QXpOUzR5TWpjdU1qTTJMakUwTmpBZUZ3MHlNREExTVRjeE5EVXpNRGRhRncweU1UQTFNVGN4TkRVegpNRGRhTUJveEdEQVdCZ05WQkFNVER5QXpOUzR5TWpjdU1qTTJMakUwTmpDQ0FTSXdEUVlKS29aSWh2Y05BUUVCCkJRQURnZ0VQQURDQ0FRb0NnZ0VCQU5qVnVJRnpUZlRiME5MekZXc1FoL2RmY1lWSkIzcUptaGFHV3J6eFlmR04KRXhoYU5EVVRmL1Fna211UEUxVTlxTmlzYVRUUTdsblNNTVRUNmNVQnlsMS9ZMHJlVXBCK2picXp2eTY1aUo1TQpEMEg1NSsxdncyNDBXc1llbS90emRHM252TlBUaVJPQ0QrRmNraklKWGhIREV4Vyt4SnRVWmV5WlRnU3BGWnhBCkRZeFBVaENncFdBTjljRE1yRTRLU2hYQjBpaVc2T0hFMTlsOVhaVDBmWktKcE9saWJUL3JVSDlHQVJYSG1JM0MKeDFhSUt0NERHQ3JkWUZ5U1JvNndiTmh3WXhGYXpFQ3VWYXFOajF6OFJUY0JzT3l0b1dPVHJ0OGFJYXBSVTZQdgo4QUp3NHhPV3dxSmZMeEk3K2JSNTZ0NXhZSHZwZzQrS0E2NUxRc0hZOHhNQ0F3RUFBYU43TUhrd0hRWURWUjBPCkJCWUVGUERqSTc2Yk1QSGhEc1phS0FJMDdFdXplUVNzTUVvR0ExVWRJd1JETUVHQUZQRGpJNzZiTVBIaERzWmEKS0FJMDdFdXplUVNzb1I2a0hEQWFNUmd3RmdZRFZRUURFdzhnTXpVdU1qSTNMakl6Tmk0eE5EYUNDUUNhQ3Roegp1ZTJXWERBTUJnTlZIUk1FQlRBREFRSC9NQTBHQ1NxR1NJYjNEUUVCQlFVQUE0SUJBUUJLLzRIckNOWDY3MjlaCmVJc1YzWndkZTlMaGtZendNUmlVMVdxYkN2RjhZVjAxM1pHYzQxVHhIbE4xbHdFZnpQTXBGMkZUMUdnRXZnMUsKd3pBYkt3YUl1QUZlajRpMGJOVDg5aFpTME9RU1JxOEFrbmVPM0NLV1BSSCtWazRnU3ZJVHBDamtmWHFXMldVYwpEVEpXL2ZPTlpvamFid3pFTHdKT2tiS1V5cnlKK2VtUkZTYy9XSWpGZVgzdXZsbjc5WEZRbHRiZ0l6VnRkaTRuCjBrVmg2RFJqTllEK0VCUFJvNjlLSVJ2dkFoRmNDRmxRY0p1Y0UyNm14cFczZ09DbEZwRVNpbXRpeE12bnYvREkKTTMzaHVMQkk4VlhvRnpvWFVOcm0rbmN1aGFIb015ekh1dWcwbnFNb2EzSk0yS29VL1psOWNrU1JTSUFGUy9SNAozMit6NjdXOQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==
    tls.key: LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFcEFJQkFBS0NBUUVBMk5XNGdYTk45TnZRMHZNVmF4Q0g5MTl4aFVrSGVvbWFGb1phdlBGaDhZMFRHRm8wCk5STi85Q0NTYTQ4VFZUMm8yS3hwTk5EdVdkSXd4TlBweFFIS1hYOWpTdDVTa0g2TnVyTy9Mcm1Jbmt3UFFmbm4KN1cvRGJqUmF4aDZiKzNOMGJlZTgwOU9KRTRJUDRWeVNNZ2xlRWNNVEZiN0VtMVJsN0psT0JLa1ZuRUFOakU5UwpFS0NsWUEzMXdNeXNUZ3BLRmNIU0tKYm80Y1RYMlgxZGxQUjlrb21rNldKdFArdFFmMFlCRmNlWWpjTEhWb2dxCjNnTVlLdDFnWEpKR2pyQnMySEJqRVZyTVFLNVZxbzJQWFB4Rk53R3c3SzJoWTVPdTN4b2hxbEZUbysvd0FuRGoKRTViQ29sOHZFanY1dEhucTNuRmdlK21EajRvRHJrdEN3ZGp6RXdJREFRQUJBb0lCQUZpSTB5QVArMm1hQXliTwoyQlR5R0FJYU4xakxtOEVkeEF1a2FoSXhvT01temdBb2ZKNmJTcWhjVUV5WWk3VkhTdFRGZU9OMjE0dFhObEIzCmtrQzlYV3BWcEM0aW5xV2U5ckdmeU5VRUxsTXNEU0xNTGpXVlo3OXNvdyszMmNxT3RxQlZlWlVvRHhVbkN1TGkKa0ZMYjNrdjBVYXVVUytSOFRtMlBudnBxSzRlekl5eHZHOWh2Y3I1blFPeG5DZHJ1bkRXZ0JnZmpadk8vQkZGZApJdDdEKzVKblI2cUo3QjE0WWFpaEhDQXFIQjhzREZYZkFyS1QySmtRcC9Ubjd2RlZOdU5xcC9CbGpkM3R0ZE9IClg4WnZwbmF2cUoxbDJoZDhiNDlUMDlGdVRXc3RvOU9CVUdzU1duTXpuVW5BbEdHRXJMa0YxU1JJY2NqSUhFcjIKdGcvTE9Ra0NnWUVBN2QwbVpiaU9aOERLa2NrT09IbmUrRnNXeTAzc1Iyd1VMNG5tZ0hac3hiM0l0SzZzR05YdwphK1RLb21FQ3F1M2JrMEsrVEV0ZUQ2MFB1a2V0WmRScUxFaHJPY3BlcDM0M0d4UGM4dmRMbGFvS3JJU0VqWEdLCnU2WW9xcEV4QWlQRnpGZWZPOTVRUnBmS0oxcGx1UzF4OE5aMlhKMVNtcDVDYzljcjU5OUlHYWNDZ1lFQTZWNGIKU2FublN4V0ozZFY1ekZBbXhnenc0eXVxUk1penZ6aE1tQWM2QmJPazViQTU0S2tkM2tValZvRXptRmZCK1U4Swozdk1yVWx1dEJCU1I0SWlqMVUvWEliQzBLTytNaEhzYlRxLzBLWEJndjFmVFNYenViaVpEMWFvTFNyUWN0NHFDCm9hcEtPdEdTa1JoTkRWOVk1Qmpqc3ZZWmFUajVoaS9IVnV0a3NMVUNnWUVBcVgvVzlkT08vdFkrUTZhL0VIV2YKOHVDT0hLL1plSWZHMXAxdytRZnF1UHBsaElPWU5WWjJyWnZxM2MwOVptcDY5clF3QVJRUDRpSFR2RTJKZmEvaApQTThhUWFNNDBpZzV3bnprRE9zMkhGK0FuYkVNOS9INkIzLy9LSlN3RkxOREp6c2xTRGRDZ3h0MVBaZklOeTN3CkxNdldxbWFkVDNzSkpaMG1OMlEvNzY4Q2dZQUJLRU5RWVRSUmJnRHFCYlg5Nm1QVzFaZVlPTTQyV3h4eEZWRmoKNjUxQkMvd0VXNVJkNWRqTkVtQ3pmQjZLWWQwSFpIbjBVeFppNlN0NWVyU2lmV3I2a3RQSlNmd0t1KzFoZHM3UwozQktFNWhiRXZDWERGb2lFS1ZKcXk5WVVmOElvc3Rvay9SZ3pKSGpxbVVsQWlMbURJQkI1QWJsc2lTakxubzhKCmdrOVVoUUtCZ1FDdU5ERERlTVdvSkZQUHdZbmhMSEI5NWl4Kzdnak96VDVuQ2s1NXlXeTBUR2p0REhqYUs4LzgKWDJtRmpmZG1HVWc5SEVpekNCZER5U0NZeDRyVlFucGFDWTlreTQweDl4bzQvRDIvTU5kWnlSWXM2VitETnJmYgpWVkMvdEVsbmtGRk15U0hhMjh6YWRvSkxmOFJJOHlYbXgrdHIvWDArQ1BrVjRNckxyMklIR0E9PQotLS0tLUVORCBSU0EgUFJJVkFURSBLRVktLS0tLQo=
type: kubernetes.io/tls

```

- Проверено создание секрета:

```powershell
kubectl describe secret ui-extra-ingress -n dev

```

- Создан сценарий ingress с новым значением secret:

kubernetes/extra-k8s-3/ui-extra-ingress.yml

```yml
---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ui
  annotations:
    kubernetes.io/ingress.allow-http: "false"
spec:
  tls:
  - secretName: ui-extra-ingress
  backend:
    serviceName: ui
    servicePort: 9292

```

- Удален старый и поднят новый ingress, проверена работа приложения:

```powershell
cd kubernetes/extra-k8s-3/
kubectl delete ingress ui -n dev
kubectl apply -f ui-extra-ingress.yml -n dev
curl -I -k https://my-balancer-ip/

```

>outputs

```outputs
HTTP/2 200
content-type: text/html;charset=utf-8
x-xss-protection: 1; mode=block
x-content-type-options: nosniff
x-frame-options: SAMEORIGIN
set-cookie: rack.session=BAh7CEkiD3Nlc3Npb25faWQGOgZFVEkiRTg0MDUwYWI0ZWE1MDk5MDZhYzE1%0AMjBhMjc5ZTFkYTA3NWZkYTQ0MDJmZGJjMjIyZWJlMGIxNzQ4ZGY5NGYyNDQG%0AOwBGSSIJY3NyZgY7AEZJIjFQYVlnT1R3YjQxdjVoVlM1dnFZRVdOcDVNZVEx%0AMVR5WElVazMyU2F5RHZrPQY7AEZJIg10cmFja2luZwY7AEZ7B0kiFEhUVFBf%0AVVNFUl9BR0VOVAY7AFRJIi0yZmMzODhiMmQzNjVkOTZlMDA1MjQ4OWQ0Mjg0%0AMjUzNDBkMjNmNmE0BjsARkkiGUhUVFBfQUNDRVBUX0xBTkdVQUdFBjsAVEki%0ALWRhMzlhM2VlNWU2YjRiMGQzMjU1YmZlZjk1NjAxODkwYWZkODA3MDkGOwBG%0A--d7d6100f3a7728731ede4a1f63112b76f3ae6244; path=/; HttpOnly
content-length: 2765
date: Sun, 17 May 2020 17:46:54 GMT
via: 1.1 google
alt-svc: clear

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Основное задание. NetworkPolicy.

<details>
  <summary>ДЗ №21. Основное задание. NetworkPolicy.</summary>

- Включена network-policy для GKE:

```powershell
gcloud container clusters update immon4ik-k8s-gke --zone=europe-west3 --update-addons=NetworkPolicy=ENABLED
gcloud container clusters update immon4ik-k8s-gke --zone=europe-west3  --enable-network-policy

```

- Доработан манифест networkpolicy, согласно заданию:

kubernetes/reddit/mongo-network-policy.yml

```yml
---
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: deny-db-traffic
  labels:
    app: reddit
spec:
  podSelector:
    matchLabels:
      app: reddit
      component: mongo
  policyTypes:
  - Ingress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          component: comment
    - podSelector:
        matchLabels:
          component: post

```

-

```powershell
cd kubernetes/reddit/
kubectl apply -f mongo-network-policy.yml -n dev

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

### Основное задание. Хранилище для базы.

<details>
  <summary>ДЗ №21. Основное задание. Хранилище для базы.</summary>

- Создан диск в Google Cloud:

```powershell
gcloud compute disks create --size=25GB --zone=europe-west3-b reddit-mongo-disk

```

- Доработан манифест деплоймента базы с использованием gcePersistentDisk:

kubernetes/reddit/mongo-deployment.yml

```yml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo
  labels:
    app: reddit
    component: mongo
    post-db: "true"
    comment-db: "true"
spec:
  replicas: 1
  selector:
    matchLabels:
      app: reddit
      component: mongo
  template:
    metadata:
      name: mongo
      labels:
        app: reddit
        component: mongo
        post-db: "true"
        comment-db: "true"
    spec:
      containers:
      - image: mongo:3.2
        name: mongo
        volumeMounts:
        - name: mongo-gce-pd-storage
          mountPath: /data/db
      volumes:
      - name: mongo-persistent-storage
        emptyDir: {}
        volumes:
      - name: mongo-gce-pd-storage
        gcePersistentDisk:
          pdName: reddit-mongo-disk
          fsType: ext4

```

- Выполнены все задания, чтобы использовать Volume gcePersistentDisk. Полезные команды:

```powershell
cd kubernetes/reddit/
kubectl delete -f mongo-deployment.yml -n dev
kubectl apply -f mongo-deployment.yml -n dev

```

- Создан манифест PersistentVolume:

kubernetes/reddit/mongo-volume.yml

```yml
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: reddit-mongo-disk
spec:
  capacity:
    storage: 25Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  gcePersistentDisk:
    fsType: "ext4"
    pdName: "reddit-mongo-disk"

```

- Создан манифест PersistentVolumeClaim:

kubernetes/reddit/mongo-claim.yml

```yml
---
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: mongo-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 15Gi

```

- Доработан манифест деплоймента базы используя статический persistentVolumeClaim:

kubernetes/reddit/mongo-deployment.yml

```yml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo
  labels:
    app: reddit
    component: mongo
    post-db: "true"
    comment-db: "true"
spec:
  replicas: 1
  selector:
    matchLabels:
      app: reddit
      component: mongo
  template:
    metadata:
      name: mongo
      labels:
        app: reddit
        component: mongo
        post-db: "true"
        comment-db: "true"
    spec:
      containers:
      - image: mongo:3.2
        name: mongo
        volumeMounts:
        - name: mongo-gce-pd-storage
          mountPath: /data/db
      volumes:
      - name: mongo-gce-pd-storage
        persistentVolumeClaim:
          claimName: mongo-pvc

```

- Создан манифест StorageClass с использованием ssd-диска:

kubernetes/reddit/storage-fast.yml

```yml
---
kind: StorageClass
apiVersion: storage.k8s.io/v1beta1
metadata:
  name: fast
provisioner: kubernetes.io/gce-pd
parameters:
  type: pd-ssd

```

- Создан манифест PersistentVolumeClaim с использованием StorageClass:

kubernetes/reddit/mongo-claim-dynamic.yml

```yml
---
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: mongo-pvc-dynamic
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: fast
  resources:
    requests:
      storage: 10Gi

```

- Доработан манифест деплоймента базы используя динамический persistentVolumeClaim:

kubernetes/reddit/mongo-deployment.yml

```yml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo
  labels:
    app: reddit
    component: mongo
    post-db: "true"
    comment-db: "true"
spec:
  replicas: 1
  selector:
    matchLabels:
      app: reddit
      component: mongo
  template:
    metadata:
      name: mongo
      labels:
        app: reddit
        component: mongo
        post-db: "true"
        comment-db: "true"
    spec:
      containers:
      - image: mongo:3.2
        name: mongo
        volumeMounts:
        - name: mongo-gce-pd-storage
          mountPath: /data/db
      volumes:
      - name: mongo-gce-pd-storage
        persistentVolumeClaim:
          claimName: mongo-pvc-dynamic

```

- Выполнены все задания, чтобы использовать PersistentVolume. Полезные команды:

```powershell
cd kubernetes/reddit/
kubectl apply -f mongo-volume.yml -n dev
kubectl apply -f mongo-claim.yml -n dev
kubectl apply -f storage-fast.yml -n dev
kubectl apply -f mongo-claim-dynamic.yml -n dev
kubectl apply -f mongo-deployment.yml -n dev
kubectl get persistentvolume -n dev

```

- Погашен кластер:

```powershell
cd kubernetes/extra-k8s-2/terraform-gke-cluster/
terraform destroy --auto-approve

```

[Карта домашних заданий](#карта-домашних-заданий)

</details>

for sale:)

----------
[![Build Status](https://img.shields.io/travis/com/Otus-DevOps-2019-11/immon4ik_microservices/master?color=9cf&label=immon4ik&style=plastic)](https://img.shields.io/travis/com/Otus-DevOps-2019-11/immon4ik_microservices/master?color=9cf&label=immon4ik&style=plastic)
