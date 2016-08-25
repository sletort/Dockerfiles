############################################################
# Dockerfile to build DiscoSnp++ tool container image
# Based on debian Jessie/8
############################################################

# Set the base image to debian
FROM debian:8

RUN apt-get update -y
RUN apt-get upgrade -y

################## DEPENDENCIES INSTALLATION ######################
ENV PACKAGES wget bwa python

RUN apt-get install -y ${PACKAGES}

################## DiscoSnp++ INSTALLATION ######################
ENV DIR /opt
ENV DESCR_DIR /opt/descr
RUN mkdir $DESCR_DIR

# directory containing source code
# 	should be under $DIR
ENV SOURCE_DIR DiscoSNP++-v2.2.9-bin-Linux

WORKDIR ${DIR}

## get code source
#--- from tar file
ENV TAR https://github.com/GATB/DiscoSnp/releases/download/v2.2.9/DiscoSNP.-v2.2.9-bin-Linux.tar.gz
RUN wget ${TAR} -O - | tar xvzf -

#--- /from tar file

## installation commands
WORKDIR ${SOURCE_DIR}
RUN chmod a+x run_discoSnp++.sh test/*.sh scripts/*.sh

RUN ln -s $DIR/$SOURCE_DIR/run_discoSnp++.sh /usr/local/bin/
RUN ln -s $DIR/$SOURCE_DIR/bin/* /usr/local/bin/

## test commands
WORKDIR test
RUN ./simple_test.sh
WORKDIR ..

################## Dockerfile usage ######################
## the command launched by default when running the container
ENTRYPOINT ["./run_discoSnp++.sh"]
CMD ["-help"]

################## METADATA ######################
MAINTAINER "sletort"

LABEL ANNOT.Name="DiscoSnp++" \
		ANNOT.Version="2.2.9" \
		ANNOT.Licence="AGPL" \
		ANNOT.Description="Software discoSnp++ is designed for discovering Single Nucleotide Polymorphism (SNP) and insertions/deletions (indels) from raw set(s) of reads obtained with Next Generation Sequencers (NGS).\nNote that number of input read sets is not constrained, it can be one, two, or more. Note also that no other data as reference genome or annotations are needed.\nThe software is composed by two modules. First module, kissnp2, detects SNPs from read sets. A second module, kissreads2, enhance the kissnp2 results by computing per read set  and for each variant found  i/ its mean read coverage and ii/ the (phred) quality of reads generating the polymorphism." \
		ANNOT.author="Pierre Peterlongo" \
		ANNOT.author_URI="http://orcid.org/0000-0003-0776-6407" \
		ANNOT.Homepage="https://colibread.inria.fr/software/discosnp/" \
		ANNOT.Reference="['doi:10.1093/nar/gku1187']" \
		ANNOT.Vendor="Inria" \
		ANNOT.Requires="['bwa','python']" \
		ANNOT.Provides="['run_discoSnp++.sh','dbginfo','h5dump','kissnp2','kissreads2', 'dbgh5']" \
		ANNOT.EDAM_Operation="['operation_0484','operation_3201','operation_3472']" \
		ANNOT.EDAM_Topic="['topic_2885']" \
#		ANNOT.Support_URL=""

# Comment to translate edam code in labels (for human comprehension).
#EDAM_Operation
#	operation_0484 - SNP detection
#	operation_3201 - SNP calling
#	operation_3472 - k-mer counting
#
#EDAM_Topic
#	topic_2885 - DNA polymorphism

