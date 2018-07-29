# Ubuntu LTS (bionic) 18.04 + Java 8 (1.8.0_181) JDK + Maven 3.5 + Python 2.7.12/3.5.2 + PIP3 8.1.1

[![](https://images.microbadger.com/badges/image/openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3.svg)](https://microbadger.com/images/openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3.svg)](https://microbadger.com/images/openkbs/ubuntu-bionic-ubuntu-bionic-jdk-mvn-py3 "Get your own version badge on microbadger.com")

# Components:
* Ubuntu LTS 18.04, bionic-20180724.1, bionic, latest
* java version "1.8.0_181"
  Java(TM) SE Runtime Environment (build 1.8.0_181-b13)
  Java HotSpot(TM) 64-Bit Server VM (build 25.181-b13, mixed mode)
* Apache Maven 3.5.3
* Python 3.5.2
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
Linux f1c21daeac32 4.15.0-29-generic #31~16.04.1-Ubuntu SMP Wed Jul 18 08:54:04 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 18.04.1 LTS
Release:	18.04
Codename:	bionic

JAVA_HOME=/usr/jdk1.8.0_181
java version "1.8.0_181"
Java(TM) SE Runtime Environment (build 1.8.0_181-b13)
Java HotSpot(TM) 64-Bit Server VM (build 25.181-b13, mixed mode)

Apache Maven 3.5.3 (3383c37e1f9e9b3bc3df5050c29c8aff9f295297; 2018-02-24T19:49:05Z)
Maven home: /usr/apache-maven-3.5.3
Java version: 1.8.0_181, vendor: Oracle Corporation
Java home: /usr/jdk1.8.0_181/jre
Default locale: en_US, platform encoding: ANSI_X3.4-1968
OS name: "linux", version: "4.15.0-29-generic", arch: "amd64", family: "unix"

Python 2.7.15rc1

Python 3.6.5

pip 9.0.1 from /usr/lib/python3/dist-packages (python 3.6)
```
