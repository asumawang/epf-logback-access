# epf-logback-access

## To install...
```
# From jetty home
cd modules/
curl -O https://raw.githubusercontent.com/jetty-project/logging-modules/master/capture-all/logging.mod
curl -O https://raw.githubusercontent.com/jetty-project/logging-modules/master/centralized/webapp-logging.mod
curl -O https://raw.githubusercontent.com/noelvillador/epf-logback-access/master/src/main/resources/logback-access.mod
cd ..
java -jar start.jar --add-to-start=logging,webapp-logging,logback-access
cd etc
curl -O https://raw.githubusercontent.com/robmoore/epf-logback-access/master/src/resources/jetty-logback-access.xml
cd ..
cd resources
curl -O https://raw.githubusercontent.com/robmoore/epf-logback-access/master/src/resources/logback-access.xml
```
## To customize...
```
cp ~/logback-access-include.xml resources
cp ~/logback-include.xml resources
# Add include statement to logback.xml provided by logging module
xmlstarlet ed -L -s '/configuration' -t elem -n include -i '$prev' -t attr -n optional -v true -i '$prev/..' -t attr -n resource -v logback-include.xml resources/logback.xml
```
## For reference

- older example: https://github.com/jetty-project/jetty-and-logback-example
- newer eamples: https://github.com/jetty-project/logging-modules/tree/master/logback
