## Installing Redis
#
#curl -L https://raw.githubusercontent.com/roboshop-devops-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo
#yum install redis-6.2.7 -y
#
## using sed editor for updating the IP address in redis config file
#sed -i -e 's/127.o.o.1/0.0.0.0/' /etc/redis.conf /etc/redis.conf
#systemctl enable redis
#systemctl restart redis

COMPONENT=redis
source common.sh

PRINT "Install Redis Repo"
dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>$LOG
STAT $?

PRINT "Enable Redis Repo 6.2"
dnf module enable redis:remi-6.2 -y &>>$LOG
STAT $?

PRINT "Install Redis"
yum install redis -y &>>$LOG
STAT $?

PRINT "Update Redis Listen Address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf /etc/redis/redis.conf &>>$LOG
STAT $?

PRINT "Enable Redis Service"
systemctl enable redis &>>$LOG
STAT $?

PRINT "Start Redis Service"
systemctl restart redis &>>$LOG
STAT $?