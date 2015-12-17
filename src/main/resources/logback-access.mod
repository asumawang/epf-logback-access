#
# Logback access module
#
# add --module=logback-access to start.ini

[name]
logback-access

[depend]
logging
resources

[xml]
etc/jetty-logback-access.xml

[lib]
lib/logback-access/*.jar

[files]
logs/
http://central.maven.org/maven2/ch/qos/logback/logback-access/1.0.7/logback-access-1.0.7.jar|lib/logback-access/logback-access-1.0.7.jar
# JAR file created using this project
https://s3.amazonaws.com/epf-ivy/ePatientFinder/epf-logback-access/128724e/epf-logback-access-128724e.jar|lib/logback-access/epf-logback-access-128724e.jar
https://raw.githubusercontent.com/robmoore/epf-logback-access/master/src/main/resources/jetty-logback-access.xml|etc/jetty-logback-access.xml
https://raw.githubusercontent.com/robmoore/epf-logback-access/master/src/main/resources/logback-access.xml|resources/logback-access.xml
