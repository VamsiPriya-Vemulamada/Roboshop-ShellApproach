if [ -z "$1" ]; then
  echo Input password is needed
  exit 1
 # -z is one of the file operators to check whether user gave the password or not
fi

COMPONENT=mysql
source common.sh
ROBOSHOP_MYSQL_PASSWORD=$1

# this is to save the password from user for login credentials

PRINT "Downloading MySQL Repo File"
curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo
&>>LOG
STAT $?
# curl is used to transfer the files from one server to another. -S When used with -s, --silent, it makes curl show an error message if it fails.
# -L If the server reports that the requested page has moved to a different location (indicated with a Location: header and a 3XX response code), this option will make curl redo the request on the new place.
# -o O will save the file in the current working directory with the same file name as remote.
PRINT "Disable MySQL 8 Version Repo"
dnf module disable mysql -y &>>LOG
STAT $?
# $? means exit status and STAT is a function here
PRINT "Install MysQL"
yum install mysql-community-server -y
STAT $?
#  for installing SQL
PRINT "Enable MySQL Service"
Systemctl enable mysqld &>>LOG
STAT $?
# Enabling the service
PRINT "Start MySQL Service"
Systemctl restart mysqld &>>LOG
STAT $?
