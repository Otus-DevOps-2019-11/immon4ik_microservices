APP_IMAGES := ui post comment
APP_BUG_IMAGES := ui post comment
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
	cd logging/bugged/$(subst post,post-py,$@); bash docker_build.sh; cd - ; cd -

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
