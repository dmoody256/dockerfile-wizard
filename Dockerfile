FROM python:3.8

ENV TEXLIVE_INSTALL_NO_CONTEXT_CACHE=1 \
    NOPERLDOC=1

RUN apt-get update && \
  apt-get install -y wget biber unzip tar \
  make fontconfig perl default-jdk libgetopt-long-descriptive-perl \
  libdigest-perl-md5-perl libncurses5 \
  python3-pygments && \
  rm -rf /var/lib/apt/lists/*

RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
  tar xzf install-tl-unx.tar.gz && rm install-tl-unx.tar.gz && \
  cd install-tl* && \
  echo "selected_scheme scheme-small" > install.profile && \
  echo "tlpdbopt_install_docfiles 0" >> install.profile && \
  echo "tlpdbopt_install_srcfiles 0" >> install.profile && \
  echo "tlpdbopt_autobackup 0" >> install.profile && \
  echo "tlpdbopt_sys_bin /usr/bin" >> install.profile && \
  ./install-tl -profile install.profile && cd .. && rm -rf install-tl*

RUN /usr/local/texlive/2018/bin/x86_64-linux/tlmgr path add
RUN apt-get update && apt-get install -y  rpm gdc gfortran docbook-xml docbook-xsl xsltproc libxml2-dev libxslt-dev fop docbook-xsl-doc-pdf python-pip python-dev build-essential libpcre3-dev autoconf automake libtool bison subversion git
RUN apt-get -y --no-install-recommends install ghostscript