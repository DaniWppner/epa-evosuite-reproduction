FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

# Update system and install required tools
RUN apt-get update && apt-get install -y \
    software-properties-common \
    wget curl git unzip sudo \
    python3-pip \
    r-base \
    maven \
    openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/*

# Environment variables for Java and Maven
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:/usr/share/maven/bin:$PATH


# Install epa-evosuite
WORKDIR /replication-package
RUN git clone https://github.com/j-godoy/epa-evosuite.git
WORKDIR /replication-package/epa-evosuite
RUN mvn clean install -DskipTests=true

# Install 
WORKDIR /replication-package
RUN git clone https://github.com/j-godoy/epa-benchmark.git

# Download JUnit 4.12 and Hamcrest-core 1.3 jars
WORKDIR /replication-package
RUN wget -q https://repo1.maven.org/maven2/junit/junit/4.12/junit-4.12.jar \
 && wget -q https://repo1.maven.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar

