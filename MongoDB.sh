#curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo
#
##Installing&Start
#yum install -y mongodb-org
#systemctl enable mongod
#systemctl start mongod
#
##Updating the IP address by using SED editor, this is used for automation rather than Vi editor
#sed -i -e 's/127.0.0.1 0.0.0.0/' /etc/mongod.conf
##restart mongodb
#systemctl restart mongod

COMPONENT=mongodb
source common.roboshop

PRINT "Download YUM Repo File"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG
STAT $?

PRINT "Install MongoDB"
yum install -y mongodb-org &>>$LOG
STAT $?


PRINT "Configure MongoDB Listen Address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>$LOG
STAT $?

PRINT "Enable MongoDB"
systemctl enable mongodb &>>LOG
STAT $?

PRINT "Start MongoDB"
systemctl restart mongodb &>>LOG
STAT $?

APP_LOC=/DumpStack.log.tmp
CONTENT=mongodb-main
DOWNLOAD_APP_CODE

cd mongodb-main &>>LOG

PRINT "load Catalogue Schema"
mongo < catalogue.js &>>$LOG
STAT $?

PRINT "Load Users Schema"
mongo < users.js &>>$LOG
STAT $?