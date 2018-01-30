############################################################
# Dockerfile to build qt_framework tool container image
# Based on debian Jessie/8
############################################################

# Set the base image to debian
FROM debian:latest

################## DEPENDENCIES INSTALLATION ######################
RUN apt-get update
RUN apt-get upgrade -y

ENV PACKAGES qt5-default python3-qtpy
RUN apt-get install -y ${PACKAGES}

#### Already defined directories   ####
#### please use and do not modify. ####
# ENV DIR /opt
# ENV DESCR_DIR /opt/descr
################## qt_framework INSTALLATION ######################

# directory containing source code
# 	should be under $DIR
#ENV SOURCE_DIR ...

#WORKDIR ${DIR}

## get code source
#--- from tar file
#ENV TAR ...
#RUN wget ${TAR} -O - | tar xvzf -

#--- /from tar file

## installation commands
#WORKDIR ${SOURCE_DIR}
#RUN ...

## test commands

################## Dockerfile usage ######################
## the command launched by default when running the container
#ENTRYPOINT ["..."]
#CMD ["-help"]

################## METADATA ######################
#MAINTAINER "sletort"

#LABEL ANNOT.Name="qt_framework" \
#		ANNOT.Version="3.0.2" \
#		ANNOT.Licence="" \
#		ANNOT.Description="" \
#		ANNOT.author="Sébastien Letort" \
#		ANNOT.author_URI="https://www.researchgate.net/profile/Sebastien_Letort" \
#		ANNOT.Homepage="" \
#		ANNOT.Reference="['']" \
#		ANNOT.Vendor="" \
#		ANNOT.Requires="['']" \
#		ANNOT.Provides="['']" \
#		ANNOT.EDAM_Operation="['']" \
#		ANNOT.EDAM_Topic="['']" \
#		ANNOT.Support_URL=""

# Comment to translate edam code in labels (for human comprehension).
#EDAM_Operation
#	operation_0484 - SNP detection
#
#EDAM_Topic
#	topic_2885 - DNA polymorphism

