TAG_NAME := env_var_or_default('TAG_NAME', '4.0.3')

default:
  @just --list

build-img:
	docker build --build-arg TAG_NAME={{ TAG_NAME }} -t r-ver-ci:{{ TAG_NAME }} . 

push-img:
	docker tag r-ver-ci:{{ TAG_NAME }} durandmprose/r-ver-ci:{{ TAG_NAME }}
	docker push durandmprose/r-ver-ci:{{ TAG_NAME }}
