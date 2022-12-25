curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo

#Installing&Start
yum install -y mongodb-org
systemctl enable mongod
systemctl start mongod

#Updating the IP address by using SED editor, this is used for automation rather than Vi editor
sed -i -e 's/127.0.0.1 0.0.0.0/' /etc/mongod.conf
#restart mongodb
systemctl restart mongod