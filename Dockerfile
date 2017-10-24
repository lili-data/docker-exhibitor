FROM netflixoss/java:7
MAINTAINER liligo data team <datateam@liligo.com>

RUN apt-get update &&\
  apt-get -y install ca-certificates &&\
  wget -q http://archive.apache.org/dist/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz.md5 &&\
  wget -q http://archive.apache.org/dist/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz &&\
  md5sum -c zookeeper-3.4.8.tar.gz.md5 &&\
  tar xzf zookeeper-3.4.8.tar.gz &&\
  rm /zookeeper-3.4.8.tar.gz* &&\
  mv /zookeeper-3.4.8 /zookeeper &&\
  mkdir /zookeeper/data/

RUN apt-get -y install maven &&\
  mkdir /exhibitor &&\
  cd /exhibitor

ADD conf/pom.xml /exhibitor/pom.xml

RUN cd /exhibitor &&\
  mvn clean package &&\
  mv target/exhibitor-1.5.6.jar . &&\
  rm -rf /exhibitor/target &&\
  rm /exhibitor/pom.xml

ADD conf/exhibitor.properties /exhibitor/exhibitor.properties
ADD conf/run.sh /exhibitor/run.sh


EXPOSE 2181 2888 3888 8080

WORKDIR /exhibitor

RUN chmod +x /exhibitor/run.sh


ENTRYPOINT ["/exhibitor/run.sh"]
