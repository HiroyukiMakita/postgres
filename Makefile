#########################################################
# imports
#########################################################

include .env
POSTGRES_USER := ${POSTGRES_USER}
POSTGRES_PORT := ${POSTGRES_PORT}
POSTGRES_DB := ${POSTGRES_DB}

#########################################################
# variables
#########################################################

COMPOSE := docker-compose
BUILD := $(COMPOSE) build --no-cache
UP := $(COMPOSE) up -d
DOWN := $(COMPOSE) down
EXEC = $(COMPOSE) exec $(CONTAINER) bash $(ARG)
CONTAINER =
ARG =

# docker services (container name)
DB := postgres

#########################################################
# make commands
#########################################################

init:
	@make build up

build:
	@$(BUILD)

up:
	@$(UP)

exec-db:
	$(eval CONTAINER := $(DB))
	$(eval ARG := -c "\
	psql -h 0.0.0.0 -p $(POSTGRES_PORT) -d $(POSTGRES_DB) -U $(POSTGRES_USER)\
	")
	@$(EXEC)

down:
	@$(DOWN)

remove:
	@$(DOWN) --rmi all --volumes --remove-orphans
