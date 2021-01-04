FROM python:3.8

RUN apt-get update && apt-get install -y default-jdk rpm gdc gfortran docbook-xml docbook-xsl xsltproc libxml2-dev libxslt-dev fop docbook-xsl-doc-pdf python-pip python-dev build-essential libpcre3-dev autoconf automake libtool bison subversion git
RUN apt-get -y --no-install-recommends install texlive texlive-latex3 biber texmaker ghostscript texlive-bibtex-extra texlive-latex-extra texlive-font-utils