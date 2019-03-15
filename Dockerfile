FROM centos:latest 
MAINTAINER lzhen "13760224840@163.com"
RUN yum install java-1.7.0-openjdk.x86_64 -y
#RUN rm /etc/yum.repos.d/*.repo
#COPY ./jdk-7u21-linux-x64.rpm /tmp/jdk-7u21-linux-x64.rpm
COPY ./apache-tomcat-7.0.85.tar.gz /hskj/apache-tomcat-7.0.85.tar.gz
#ADD指令可以替代COPY指令
#RUN set-ex; \
 #       cd /tmp; \
 #       tar xvf jdk-7u79-linux-x64.tar.gz -C /usr/local/; \
 #       chown -R root.root /usr/local/jdk1.7.0_79/
#官方镜像都基于此模式构建，也可以使用&&
#ENV JAVA_HOME /usr/JAVA/jdk1.7.0_21
#ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
#ENV CATALINA_HOME /hskj/tomcat
#ENV CATALINA_BASE /hskj/tomcat
#ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin
WORKDIR /hskj
RUN set-ex; \
        tar xvf apache-tomcat-7.0.85.tar.gz; \
        ln -sv apache-tomcat-7.0.85/ /hskj/tomcat; \
        rm -rf /hskj/tomcat/webapps/ROOT/*; \
        echo "this is my second docker image" >> /hskj/tomcat/webapps/ROOT/index.html
VOLUME /hskj/tomcat 
EXPOSE 8080 
CMD  /hskj/tomcat/bin/catalina.sh run 
