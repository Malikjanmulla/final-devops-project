FROM docker.io/library/ubuntu:20.04
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-11-jdk wget
RUN mkdir /usr/local/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.12/bin/apache-tomcat-10.1.12.tar.gz /tmp/apache-tomcat-10.1.12.tar.gz
RUN cd /tmp && tar xvfz apache-tomcat-10.1.12.tar.gz
RUN cp -Rv /tmp/apache-tomcat-10.1.12/* /usr/local/tomcat/
COPY target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
