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
for sale:)
----------
[![Build Status](https://img.shields.io/travis/com/Otus-DevOps-2019-11/immon4ik_microservices/master?color=9cf&label=immon4ik&style=plastic)](https://img.shields.io/travis/com/Otus-DevOps-2019-11/immon4ik_microservices/master?color=9cf&label=immon4ik&style=plastic)
