From tomcat:8-jre8 

# Maintainer
MAINTAINER "zmasarath" 

# copy war file on to container 
COPY ./webapp.war /usr/local/tomcat/webapps
