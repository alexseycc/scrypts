apt-get update -y
apt-get upgrade -y -f
apt-get install default-jdk -y -f
wget http://download.oracle.com/glassfish/4.1/release/glassfish-4.1.zip
unzip glassfish-4.1.zip -d /opt
echo "
<!DOCTYPE html>
<html lang='en'>
<head>
  <meta charset='UTF-8'>
  <title>Document</title>
</head>
<body>
  <%=
  'Script por alcsy mostovik' 
  %>
  out.println
</body>
</html>
" > index.jsp
cd /opt/glassfish4/bin && sh asadmin start-domain