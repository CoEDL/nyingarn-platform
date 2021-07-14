FROM debian:bullseye
ARG VERSION
LABEL net.nyingarn.authors="m@lr.id.au"

WORKDIR /srv
ENV PANDOC=https://github.com/jgm/pandoc/releases/download/2.14.0.3/pandoc-2.14.0.3-1-amd64.deb

RUN apt-get update && apt-get install -y wget git ruby bundler \
    imagemagick graphviz nodejs texlive-latex-extra texlive-plain-generic libicu-dev zlib1g-dev libmariadb-dev \
    pkg-config libmagickcore-dev 

RUN wget -O /tmp/pandoc.deb ${PANDOC} && dpkg -i /tmp/pandoc.deb && apt-get -f install && rm -f /tmp/pandoc.deb

# get the release
RUN wget -O /srv/ftp.tgz https://github.com/benwbrum/fromthepage/archive/refs/tags/v${VERSION}.tar.gz
RUN tar -zxf ftp.tgz && ln -sf fromthepage-${VERSION} fromthepage 

WORKDIR /srv/fromthepage

# Install required gems
RUN echo 'gem "aws-sdk-s3", require: false' >> Gemfile
RUN bundle install
RUN bundle exec rake assets:precompile

COPY fromthepage/start.sh /srv/fromthepage/start.sh
RUN chmod +x /srv/fromthepage/start.sh