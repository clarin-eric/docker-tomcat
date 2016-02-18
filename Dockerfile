FROM docker.clarin.eu/base:1.0.0

#Install openjdk-jre-8 and tomcat8
RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -y openjdk-8-jre-headless tomcat8

COPY tomcat/server.xml /etc/tomcat8/server.xml
COPY tomcat/tomcat-users.xml /etc/tomcat8/tomcat-users.xml
COPY tomcat/context.xml /etc/tomcat8/context.xml

ENV JAVA_HOME /usr
ENV CATALINA_HOME /usr/share/tomcat8
ENV CATALINA_BASE /var/lib/tomcat8
ENV CATALINA_PID /var/run/tomcat8.pid
#Specify JVM options
ENV JAVA_OPTS "-Djava.security.egd=file:/dev/./urandom"

COPY tomcat/logging.properties /etc/tomcat8/logging.properties
COPY tomcat/catalina.properties /etc/tomcat8/catalina.properties
RUN chown -R tomcat8:tomcat8 /etc/tomcat8 \
 && chown -R tomcat8:tomcat8 /var/lib/tomcat8/

ADD start_tomcat.sh /usr/bin/start_tomcat.sh
RUN chmod u+x /usr/bin/start_tomcat.sh

WORKDIR /var/lib/tomcat8/webapps

VOLUME ["/var/log/tomcat8"]

EXPOSE 8080/tcp 8009/tcp 8443/tcp

CMD ["/usr/bin/start_tomcat.sh"]
