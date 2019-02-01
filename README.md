# Ubuntu 18.04.1 LTS (Bionic Beaver) + Java 8 (1.8.0_201) + Maven 3.6 + Python 2.7/3.6 + PIP3 19 + Node 11 + NPM 6

[![](https://images.microbadger.com/badges/image/openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3.svg)](https://microbadger.com/images/openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3.svg)](https://microbadger.com/images/openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 "Get your own version badge on microbadger.com")

# Components:
* Ubuntu LTS 18.04, bionic-20180724.1, bionic, latest
* java version "1.8.0_201"
  Java(TM) SE Runtime Environment (build 1.8.0_201-b09)
  Java HotSpot(TM) 64-Bit Server VM (build 25.201-b09, mixed mode)
* Apache Maven 3.6
* Python 3.6
* Node 11 + NPM 6
* Other tools: git wget unzip vim python python-setuptools python-dev python-numpy 

## Pull the image from Docker Repository

```bash
docker pull openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3
```

## Default Build
```
./build.sh
```

# Default Run (test) - No app
```
./run.sh
```

# Base the image to build add-on components

```Dockerfile
FROM openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3
```

# Run the image

Then, you're ready to run:
- make sure you create your work directory, e.g., ./data

```bash
mkdir ./data
docker run -d --name my-ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 -v $PWD/data:/data -i -t openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3
```

# Build and Run your own image
Say, you will build the image "my/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3".

```bash
docker build -t my/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 .
```

To run your own image, say, with some-ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3:

```bash
mkdir ./data
docker run -d --name some-ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 -v $PWD/data:/data -i -t my/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3
```

# Shell into the Docker instance

```bash
docker exec -it some-ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 /bin/bash
```

# Run Python code

To run Python code 

```bash
docker run -it --rm openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 python3 -c 'print("Hello World")'
```

or,

```bash
docker run -i --rm openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 python3 < myPyScript.py 
```

or,

```bash
mkdir ./data
echo "print('Hello World')" > ./data/myPyScript.py
docker run -it --rm --name some-ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 -v "$PWD"/data:/data openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 python3 myPyScript.py
```

or,

```bash
alias dpy3='docker run --rm openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 python3'
dpy3 -c 'print("Hello World")'
```

# Compile or Run java while no local installation needed
Remember, the default working directory, /data, inside the docker container -- treat is as "/".
So, if you create subdirectory, "./data/workspace", in the host machine and 
the docker container will have it as "/data/workspace".

```java
#!/bin/bash -x
mkdir ./data
cat >./data/HelloWorld.java <<-EOF
public class HelloWorld {
   public static void main(String[] args) {
      System.out.println("Hello, World");
   }
}
EOF
cat ./data/HelloWorld.java
alias djavac='docker run -it --rm --name some-ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 -v '$PWD'/data:/data openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 javac'
alias djava='docker run -it --rm --name some-ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 -v '$PWD'/data:/data openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 java'

djavac HelloWorld.java
djava HelloWorld
```
And, the output:
```
Hello, World
```
Hence, the alias above, "djavac" and "djava" is your docker-based "javac" and "java" commands and 
it will work the same way as your local installed Java's "javac" and "java" commands. 

# To run specialty Java/Scala IDE alternatives
However, for larger complex projects, you might want to consider to use Docker-based IDE. 
For example, try the following Docker-based IDEs:
* [openkbs/eclipse-oxygen-docker](https://hub.docker.com/r/openkbs/eclipse-oxygen-docker/)
* [openkbs/netbeans](https://hub.docker.com/r/openkbs/netbeans/)
* [openkbs/scala-ide-docker](https://hub.docker.com/r/openkbs/scala-ide-docker/)
* [openkbs/pycharm-docker](https://hub.docker.com/r/openkbs/pycharm-docker/)
* [openkbs/webstorm-docker](https://hub.docker.com/r/openkbs/webstorm-docker/)
* [openkbs/intellj-docker](https://hub.docker.com/r/openkbs/intellij-docker/)

# See also
* [Java Development in Docker] (https://blog.giantswarm.io/getting-started-with-java-development-on-docker/)

# Versions
```
root@2279085c3b8d:/data# /usr/printVersions.sh 
+ echo JAVA_HOME=/usr/java
JAVA_HOME=/usr/java
+ java -version
java version "1.8.0_201"
Java(TM) SE Runtime Environment (build 1.8.0_201-b09)
Java HotSpot(TM) 64-Bit Server VM (build 25.201-b09, mixed mode)
+ mvn --version
Apache Maven 3.6.0 (97c98ec64a1fdfee7767ce5ffb20918da4f719f3; 2018-10-24T18:41:47Z)
Maven home: /usr/apache-maven-3.6.0
Java version: 1.8.0_201, vendor: Oracle Corporation, runtime: /usr/jdk1.8.0_201/jre
Default locale: en_US, platform encoding: ANSI_X3.4-1968
OS name: "linux", version: "4.15.0-43-generic", arch: "amd64", family: "unix"
+ python -V
Python 2.7.15rc1
+ python3 -V
Python 3.6.7
+ pip --version
pip 19.0.1 from /usr/local/lib/python3.6/dist-packages/pip (python 3.6)
+ pip3 --version
pip 19.0.1 from /usr/local/lib/python3.6/dist-packages/pip (python 3.6)
+ gradle --version

------------------------------------------------------------
Gradle 5.1.1
------------------------------------------------------------

Build time:   2019-01-10 23:05:02 UTC
Revision:     3c9abb645fb83932c44e8610642393ad62116807

Kotlin DSL:   1.1.1
Kotlin:       1.3.11
Groovy:       2.5.4
Ant:          Apache Ant(TM) version 1.9.13 compiled on July 10 2018
JVM:          1.8.0_201 (Oracle Corporation 25.201-b09)
OS:           Linux 4.15.0-43-generic amd64

+ npm -v
6.5.0
+ node -v
v11.9.0
+ cat /etc/lsb-release /etc/os-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04.1 LTS"
NAME="Ubuntu"
VERSION="18.04.1 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.1 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
```
