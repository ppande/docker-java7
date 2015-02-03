FROM    ubuntu:14.04

# Add Java 7 repository
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:webupd8team/java
RUN apt-get update

# Oracle Java 7
RUN echo oracle-java-7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer
RUN apt-get install -y oracle-java7-set-default

# Maven
RUN wget -q -O - http://www.us.apache.org/dist/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz | tar -xzf - -C /usr/local
RUN ln -s /usr/local/apache-maven-3.2.5 /usr/local/apache-maven
RUN ln -s /usr/local/apache-maven/bin/mvn /usr/local/bin/mvn

# git
RUN apt-get install -y git

# Clean up
RUN apt-get clean && rm -rf /tmp/* /var/tmp/*
