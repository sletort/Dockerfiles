############################################################
# Dockerfile to build gitlab_runner tool container image
# Based on debian Jessie/8
############################################################

# Set the base image to debian
# FROM alpine:latest
# miniconda on alpine
FROM frolvlad/alpine-miniconda3

################## DEPENDENCIES INSTALLATION ######################
ENV PACKAGES    \
        bash

RUN apk add --no-cache \
	${PACKAGES}


ENV PIP_PACKAGES   \
        pip        \
        setuptools \
        pylint     \
        pytest pytest-sphinx pytest-pylint pytest-cov

RUN pip install --upgrade \
	${PIP_PACKAGES}

## test commands
RUN conda  --version
RUN python --version
RUN pylint --version
RUN pytest --version

################## Dockerfile usage ######################
## the command launched by default when running the container
ENTRYPOINT ["bash"]
# CMD ["-help"]

################## METADATA ######################
MAINTAINER "sletort"
LABEL ANNOT.Version="0.1"
