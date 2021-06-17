TAG_NAME := "4.0.3"

default:
  @just --list

build-img:
	docker build --build-arg TAG={{ TAG_NAME }} -t r-ver-ci:{{ TAG_NAME }} . 
