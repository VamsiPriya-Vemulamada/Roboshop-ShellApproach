# Installing Redis

curl -L https://raw.githubusercontent.com/roboshop-devops-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo
yum install redis-6.2.7 -y

# using sed editor for updating the IP address in redis config file
sed -i -e 's/127.o.o.1/0.0.0.0/' /etc/redis.conf /etc/redis.conf
systemctl enable redis
systemctl restart redis
