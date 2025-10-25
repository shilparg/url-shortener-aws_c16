# Makefile for URL Shortener Capstone Project

ZIP_CREATE = zip -r create_url.zip lambda/create_url/
ZIP_RETRIEVE = zip -r retrieve_url.zip lambda/retrieve_url/

.PHONY: all init plan apply destroy zip validate fmt lint

all: zip validate plan

init:
	terraform init

validate:
	terraform validate

plan:
	terraform plan

apply:
	terraform apply -auto-approve

destroy:
	terraform destroy -auto-approve

zip:
	$(ZIP_CREATE)
	$(ZIP_RETRIEVE)

fmt:
	terraform fmt -recursive

lint:
	tflint --recursive