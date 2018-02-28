#escrito por alexsy mostovik
case $1 in
1)
apt-get update -y
apt-get upgrade -y
apt-get install nano -y

#download tomcat7
wget http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-7/v7.0.85/bin/apache-tomcat-7.0.85.zip

mv apache-tomcat-7.0.85.zip /opt
cd /opt/unzip && unzip /opt/apache-tomcat-7.0.85.zip
chmod 777 -R /opt/apache-tomcat-7.0.85

#pagina teste jsp
echo "<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
</head>
<body>
<%="script por alexsy mostovik";%>  
</body>
</html>" > index.jsp

#configurando senha no tomcat
cd /opt/apache/conf/
sed s/"<\/tomcat-users>"/"<role rolename='manager-gui'\/><user username='admin' password='admin' roles='manager-gui'\/><\/tomcat-users>"/g -i tomcat-users.xml

#desligando e ligando tomcat
sh /opt/apache-tomcat-7.0.85/bin/shutdown.sh
sh /opt/apache-tomcat-7.0.85/bin/startup.sh



#instalar java
#sudo apt-get install default-jdk
#sudo apt-get install default-jre
#sudo apt-get install openjdk-7-jre 

sudo apt-get install openjdk-7-jdk -y




echo "

#variaável tomcat catalina e java
export CATALINA_HOME=/opt/apache-tomcat-7.0.85
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
" >> ~/.bashrc

service tomcat7 restart
;;
2) ##alternativa tomcat7 terminal
sudo apt-get update -y
sudo apt-get install tomcat7 tomcat7-admin -y
sed s/"JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC""/"JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"/g
sudo apt-get install default-jdk -y
#sudo apt-get install default-jre
sed s/"<\/tomcat-users>"/"<role rolename='manager-gui'\/><user username='admin' password='admin' roles='manager-gui'\/><\/tomcat-users>"/g -i /etc/tomcat7/tomcat-users.xml
sudo service tomcat7 restart
#
#
#
;;
3)
sudo apt-get install python-software-properties -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update -y
sudo apt-get install oracle-java7-installer -y
sudo apt-get install tomcat7 tomcat7-admin -y
sed s/"JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC""/"JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"/g
sed s/"<\/tomcat-users>"/"<role rolename='manager-gui'\/><user username='admin' password='admin' roles='manager-gui'\/><\/tomcat-users>"/g -i /etc/tomcat7/tomcat-users.xml
sudo service tomcat7 restart

;;
*)
echo "nada a fazer";
;;
esac
