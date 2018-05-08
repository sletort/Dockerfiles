############################################################
# Dockerfile to build gitlab_runner tool container image
# Based on debian Jessie/8
############################################################

# Set the base image to debian
# FROM alpine:latest
# miniconda on alpine
FROM frolvlad/alpine-miniconda3

################## DEPENDENCIES INSTALLATION ######################
ENV PACKAGES \
		python2 \
		python3

ENV PIP_PACKAGES \
		pip \
		setuptools \
		pylint \
		pytest pytest-sphinx pytest-pylint pytest-cov

RUN apk add --no-cache \
	${PACKAGES}

RUN pip3 install --upgrade \
	${PIP_PACKAGES}

#### Already defined directories   ####
#### please use and do not modify. ####
# ENV DIR /opt
# ENV DESCR_DIR /opt/descr

## test commands
RUN conda   --version
RUN python2 --version
RUN python3 --version
RUN pylint  --version
RUN pytest  --version

################## Dockerfile usage ######################
## the command launched by default when running the container
ENTRYPOINT ["sh"]
# CMD ["-help"]

################## METADATA ######################
MAINTAINER "sletort"
LABEL ANNOT.Version="0.1"
