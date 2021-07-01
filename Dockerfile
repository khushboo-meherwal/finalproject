FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.66/bin/apache-tomcat-8.5.68.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.68/* /usr/local/tomcat/
EXPOSE 8080
COPY target/springmvc-user-reg-login.war /usr/local/tomcat/webapps/springmvc-user-reg-login.war
CMD /usr/local/tomcat/bin/catalina.sh run
