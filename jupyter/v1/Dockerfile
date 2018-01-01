############################################################
# Dockerfile to build Jupyter notebook for MoBiDiCC
# Based on debian jupyter-notebook
############################################################

# Set the base image to jupyter notebook
FROM jupyter/minimal-notebook

################## DEPENDENCIES INSTALLATION ######################
# ENV PACKAGES python3-pip
# RUN apt install -y ${PACKAGES}

ENV PIP_MODULES networkx
RUN pip3 install ${PIP_MODULES}

#### Already defined directories   ####
#### please use and do not modify. ####
# ENV DIR /opt
# ENV DESCR_DIR /opt/descr

################## XXXXX INSTALLATION ######################
################## METADATA ######################
MAINTAINER "sletort"
LABEL ANNOT.Version="v1"

