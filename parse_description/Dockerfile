############################################################
# Dockerfile to build parse_description container image
# Based on debian Jessie/8
############################################################

# Set the base image to debian
FROM debian:8

ENV PACKAGES git nano python2.7

################## DEPENDENCIES INSTALLATION ######################

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y ${PACKAGES}

WORKDIR /usr/bin
RUN ln -s python2.7 python

################## parse_description INSTALLATION ######################
ENV GIT http://gitlab.irisa.fr/0000CCAG/programdescriptions.git
ENV DIR /opt
ENV DESCR_DIR /opt/descr
ENV PROG programdescriptions


WORKDIR ${DIR}
RUN git clone ${GIT}
RUN ln -s $DIR/$PROG/generate_trace.py /usr/local/bin/

# This to have access to the description in a common dir.
RUN mkdir $DESCR_DIR
RUN cp $DIR/$PROG/data/parse_description.json $DESCR_DIR

WORKDIR $DIR/${PROG}
RUN VERSION=$( git log -n 1 | grep commit | cut -d" " -f 2 )


ENTRYPOINT [ "./parse_description.py" ]
CMD [ "--help" ]

#### END CONF ####
LABEL	ANNOT.Name="parse_description" \
	ANNOT.Version="0.1" \
	ANNOT.Description="parse a description file (json) and generate a description in rdf or docker/biotools." \
	ANNOT.author="Sébastien Letort" \
	ANNOT.Licence="GPL3" \
	ANNOT.Support_URL="https://gitlab.irisa.fr/0000CCAG/programdescriptions/wikis/home" \
	ANNOT.EDAM_Operation="['operation_3435', 'operation_3501']" \
	ANNOT.EDAM_Topic="['topic_0089', 'topic_3372']" \
	ANNOT.Requires="['python2.7']" \
	ANNOT.Provides="['parse_description.py', 'AppliDescriptor.py']"
