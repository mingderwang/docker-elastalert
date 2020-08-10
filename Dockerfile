FROM ecoron/python36-jessie-slim

MAINTAINER Guillaume Simonneau <simonneaug@gmail.com>
LABEL Description="elasticsearch elastalert"

ENV ELASTIC_PWD="changeme" \
    ELASTICSEARCH_HOST="elasticsearch" \
    ELASTICSEARCH_PORT="9200"

RUN apt-get update -y && apt-get install curl -y
RUN apt-get install apt-utils -y
ADD ./src/ /run/
RUN chmod +x -R /run/

RUN mkdir /.backup

RUN /run/setup/elastalert.sh

ENTRYPOINT ["/run/entrypoint.sh"]
RUN apt-get install apt-utils -y
RUN apt-get autoremove -y
WORKDIR /elastalert
CMD ["python", "-m", "elastalert.elastalert", "--config /etc/elastalert/elastalert.yml", "--verbose"]
