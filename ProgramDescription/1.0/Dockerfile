############################################################
# Dockerfile to build ProgramDescription tool container image
# Based on debian Jessie/8
############################################################

# Set the base image to debian
FROM debian:8

RUN apt-get update -y
RUN apt-get upgrade -y

################## DEPENDENCIES INSTALLATION ######################
ENV PACKAGES git python2.7

RUN apt-get install -y ${PACKAGES}

WORKDIR /usr/bin
RUN ln -s python2.7 python

################## ProgramDescription INSTALLATION ######################
ENV DIR /opt
ENV DESCR_DIR /opt/descr
RUN mkdir $DESCR_DIR

# directory containing source code
# 	should be under $DIR
ENV SOURCE_DIR programdescriptions

WORKDIR ${DIR}

## get code source
#--- from git repo
ENV GIT http://gitlab.irisa.fr/0000CCAG/programdescriptions.git
RUN git clone ${GIT}

#--- /from git repo

## installation commands
RUN ln -s $DIR/$SOURCE_DIR/*.py /usr/local/bin/
RUN ln $DIR/$SOURCE_DIR/data/parse_description.json $DESCR_DIR/parse_description.json
WORKDIR ${SOURCE_DIR}

################## Dockerfile usage ######################
## the command launched by default when running the container
ENTRYPOINT ["parse_description.py"]
CMD ["--help"]

################## METADATA ######################
MAINTAINER "sletort"

LABEL ANNOT.Name="ProgramDescription" \
		ANNOT.Version="1.0"   \
		ANNOT.Licence="GPL3"  \
		ANNOT.Description="parse a description file (json) and generate a description in rdf or docker/biotools." \
		ANNOT.author="Sébastien Letort" \
		ANNOT.author_URI="https://www.researchgate.net/profile/Sebastien_Letort" \
		ANNOT.Vendor="irisa" \
		ANNOT.Requires="['python2.7']" \
		ANNOT.Provides="['generate_trace.py','parse_description.py','parse_goDocker_cmdFile.py', 'AppliDescriptor.py']" \
		ANNOT.EDAM_Operation="['operation_3435']" \
		ANNOT.EDAM_Topic="['topic_3372']"         \
		ANNOT.Support_URL="https://gitlab.irisa.fr/0000CCAG/programdescriptions/wikis/home"

# Comment to translate edam code in labels (for human comprehension).
#EDAM_Operation
#	operation_3435 - Standardize or normalize data.
#
#EDAM_Topic
#	topic_3372 - Software engineering
