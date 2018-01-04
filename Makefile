SHELL=/bin/bash
ELASTIC_REGISTRY ?= hub.docker.com

# Determine the version to build. Override by setting ELASTIC_VERSION env var.
HUGO_VERSION := $(shell ./bin/hugo-version)
