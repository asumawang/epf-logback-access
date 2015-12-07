#
# Logback access module
#
# add --module=logback-access to start.ini

[name]
logback-access

[depend]
logging

[xml]
etc/jetty-logback-access.xml

[lib]
lib/logback-access/*.jar
resources/

[files]
logs/
http://central.maven.org/maven2/ch/qos/logback/logback-access/1.0.7/logback-access-1.0.7.jar|lib/logback-access/logback-access-1.0.7.jar
http://s3.amazonaws.com/epf-logback-access/epf-logback-access-191b7a2.jar|lib/logback-access/epf-logback-access-191b7a2.jar
