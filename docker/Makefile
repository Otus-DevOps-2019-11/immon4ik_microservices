APP_IMAGES := ui post comment
MON_IMAGES := prometheus mongodb_exporter cloudprober_exporter alertmanager telegraf grafana
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
	cd ../src/$(subst post,post-py,$@); bash docker_build.sh; cd -

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
