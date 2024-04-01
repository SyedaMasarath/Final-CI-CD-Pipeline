This Repo Hosts Artifacts Craeted for a CI/CD Pipeline Project.
Steps to Get The Pipeline Going :
1. Launch an EC2 instance for Docker host and launch an instance for Jenkins server

2. Install docker on EC2 instance and start services 
  ```sh 
  yum install docker
  service docker start
  ```

3. create a new user for Docker management and add him to Docker (default) group
```sh
useradd dockeradmin
passwd dockeradmin
usermod -aG docker dockeradmin
```

4. Write a Docker file under /opt/docker

```sh
mkdir /opt/docker

### vi Dockerfile
# Pull base image 
From tomcat:8-jre8 

# Maintainer
MAINTAINER "zmasarath" 

# copy war file on to container 
COPY ./webapp.war /usr/local/tomcat/webapps
```

5. Login to Jenkins console and add Docker server to execute commands from Jenkins  
Manage Jenkins --> Configure system -->  Publish over SSH --> add Docker server and credentials

6. Create Jenkins job 

A) Source Code Management  
 Repository : https://github.com/SyedaMasarath/hello-world.git  
 Branches to build : */master  

B) Build
 Root POM: pom.xml  
 Goals and options : clean install package  
 
C) send files or execute commands over SSH
 Name: docker_host  
 Source files	: `webapp/target/*.war`
 Remove prefix	: `webapp/target`
 Remote directory	: `//opt//docker`  
 Exec command[s]	: 
  ```sh
  docker stop demo;
  docker rm -f demo;
  docker image rm -f demo;
  cd /opt/docker;
  docker build -t demo .
  ```

D) send files or execute commands over SSH  
  Name: `docker_host`  
  Exec command	: `docker run -d --name demo -p 8090:8080 demo`  

7. log in to Docker host and check images and containers. (no images and containers)

8. Execute Jenkins job

9. check images and containers again on the Docker host. This time an image and container get creates through Jenkins job

10. Access web application from the browser which is running on the container
```
<docker_host_Public_IP>:8090
```
