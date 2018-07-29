#!/bin/bash

echo ## -- Ubuntu version ---
uname -a
lsb_release -a

echo ## -- Oracle Java version ---
echo "JAVA_HOME=$JAVA_HOME"
java -version

echo ## -- Maven version ---
mvn --version

echo ## -- Python 2 version ---
python -V

echo ## -- Python 3 version ---
python3 -V

#pip --version
echo ## -- Pip 3 version ---
pip3 --version

