FROM docker.clarin.eu/base:1.0.0

#Install openjdk-jre-8
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

#RUN rm -r /var/lib/tomcat8/webapps/ROOT
#COPY webapp/component-registry-rest-2.0-beta4/war/compreg /var/lib/tomcat8/webapps/ROOT

RUN chown -R tomcat8 /etc/tomcat8

USER tomcat8

EXPOSE 8080 8009

CMD ["/usr/share/tomcat8/bin/catalina.sh", "run"]
