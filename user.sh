
##installing
#curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
#yum install nodejs -y
#
##Adding user
#useradd roboshop
#curl -s -L -o /tmp/user.zip "https://github.com/roboshop-devops-project/user/archive/main.zip"
#cd /home/roboshop
#unzip /tmp/user.zip
#mv user-main user
#cd /home/roboshop/user
#npm install
#
##Updating the servers IP address
#sed -i -e 's/REDIS_ENDPOINT/redis.devops69.online/' -e '/MONGO_ENDPOINT/mongo.devopsb69.online/' systemd.service
#mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service
#systemctl daemon-reload
#systemctl restart user
#systemctl enable user

COMPONENT=user
source common.sh
NODEJS
