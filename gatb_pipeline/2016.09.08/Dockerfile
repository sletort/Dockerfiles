############################################################
# Dockerfile to build gatb_pipeline tool container image
# Based on debian Jessie/8
############################################################

# Set the base image to debian
FROM debian:8

RUN apt-get clean -y
RUN apt-get update -y
RUN apt-get upgrade -y

################## DEPENDENCIES INSTALLATION ######################
ENV PACKAGES git bwa make nano \
	python-pip python-dev zlib1g-dev python-scipy python-networkx \
	curl

RUN apt-get install -y ${PACKAGES}
RUN pip install mathstats pyfasta pysam==0.8.3

#### program_description INSTALLATION => for Prov-O trace #########
ENV DIR /opt
WORKDIR ${DIR}

## get code source
#--- from git repo
ENV GIT https://gitlab.irisa.fr/0000CCAG/programdescriptions.git
RUN git clone --recursive ${GIT}

#--- /from git repo

ENV DESCR_DIR /opt/descr
RUN mkdir $DESCR_DIR

################## gatb_pipeline INSTALLATION ######################
# directory containing source code
# 	should be under $DIR
ENV SOURCE_DIR $DIR/gatb-minia-pipeline

ENV DIR /opt
WORKDIR ${DIR}

## get code source
#--- from git repo
ENV GIT https://github.com/GATB/gatb-minia-pipeline.git
RUN git clone --recursive ${GIT}

#--- /from git repo

## installation commands
WORKDIR ${SOURCE_DIR}
RUN git submodule sync
RUN git submodule update --init --recursive --remote

RUN ln -s $SOURCE_DIR/gatb /usr/local/bin/

## test commands
RUN make test

## add program description
WORKDIR $DESCR_DIR
ENV DESCR_URL https://gitlab.irisa.fr/semantic_programs/program_descriptions_data/raw/04d5abc112dbfa15e6966b591d022d01bbbfd3f3/descr/gatb_pipeline.json
RUN curl $DESCR_URL > gatb_pipeline.json

################## Dockerfile usage ######################
WORKDIR $SOURCE_DIR

## the command launched by default when running the container
ENTRYPOINT ["gatb"]
CMD ["-help"]

################## METADATA ######################
MAINTAINER "sletort"

LABEL ANNOT.Name="gatb_pipeline" \
		ANNOT.Version="2016.08.25" \
		ANNOT.Licence="" \
		ANNOT.Description="" \
		ANNOT.author="Sébastien Letort" \
		ANNOT.author_URI="https://www.researchgate.net/profile/Sebastien_Letort" \
		ANNOT.Homepage="" \
		ANNOT.Reference="['']" \
		ANNOT.Vendor="" \
		ANNOT.Requires="['']" \
		ANNOT.Provides="['']" \
		ANNOT.EDAM_Operation="['']" \
		ANNOT.EDAM_Topic="['']" \
		ANNOT.Support_URL=""

# Comment to translate edam code in labels (for human comprehension).
#EDAM_Operation
#	operation_0484 - SNP detection
#
#EDAM_Topic
#	topic_2885 - DNA polymorphism

