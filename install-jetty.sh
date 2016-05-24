#!/bin/sh

if [ "$1" = "" ]; then
   echo "parameter installation directory needed"
   exit
fi

if [ "$2" = "" ]; then
  echo "parameter project path needed"
  exit
fi

if [ "$3" = "" ]; then
  JAVA_PATH="java"
else
  JAVA_PATH=$3
fi

useradd jetty

cd $1
curl -O http://download.eclipse.org/jetty/stable-9/dist/jetty-distribution-9.3.8.v20160314.tar.gz
tar -xzvf jetty-distribution-9.3.8.v20160314.tar.gz
ln -s jetty-distribution-9.3.8.v20160314 jetty
rm -f jetty-distribution-9.3.8.v20160314.tar.gz
ln -s "$1/jetty/bin/jetty.sh" "/etc/init.d/jetty"
chmod a+x "$1/jetty/bin/jetty.sh"
chkconfig --add jetty
chkconfig jetty on

mkdir $2
cd $2

 "$JAVA_PATH" -jar "$1/jetty/start.jar" --add-to-start=http,deploy,jsp,resources
mkdir modules
cd modules

curl -O https://raw.githubusercontent.com/noelvillador/logging-modules/master/capture-all/logging.mod 
curl -O https://raw.githubusercontent.com/noelvillador/logging-modules/master/centralized/webapp-logging.mod
curl -O https://raw.githubusercontent.com/noelvillador/epf-logback-access/master/src/main/resources/logback-access.mod

cd ..
"$JAVA_PATH" -jar "$1/jetty/start.jar" --add-to-start=logging,webapp-logging,logback-access

mkdir bin
cd bin
curl -O https://raw.githubusercontent.com/noelvillador/epf-logback-access/master/src/main/resources/jetty
ln -s "$1/$2/bin/jetty" "/etc/default/jetty"
cd ..

#Hack since the logging plugin does not download this
cd etc
curl -O https://raw.githubusercontent.com/noelvillador/logging-modules/master/capture-all/jetty-logging.xml
cd ..

cd resources
curl -O https://raw.githubusercontent.com/noelvillador/epf-logback-access/master/src/main/resources/logback.xml
cd ..

cd ..
chown -R jetty:jetty .
