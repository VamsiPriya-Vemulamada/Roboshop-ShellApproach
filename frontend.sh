#yum install nginx -y
#systemctl enable nginx
#systemctl start nginx
#
#curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
#
# cd /usr/share/nginx/html
# rm -rf *
# unzip /tmp/frontend.zip
# mv frontend-main/static/* .
# mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf

# How to comment the whole code: CTRL+/

COMPONENT=frontend
CONTENT="*"
Source common.sh

PRINT "Install Nginx"
yum install ngnix -y &>>$LOG
STAT $?

APP_LOC=/usr/share/nginx/html

DOWNLOAD_APP_CODE

mv frontend-main/static/* .

PRINT "Copy RoboShop Configuration File"
sed -i -e '/catalogue/ s/localhost/dev-catalogue.devopsb69.online/'  -e '/user/ s/localhost/dev-user.devopsb69.online/' -e '/cart/ s/localhost/dev-cart.devopsb69.online/' -e '/shipping/ s/localhost/dev-shipping.devopsb69.online/' -e '/payment/ s/localhost/dev-payment.devopsb69.online/' /etc/nginx/default.d/roboshop.conf
STAT $?

PRINT "Enable Nginx Service"
Systemctl enable nginx &>>$LOG
STAT $?

PRINT "Start Nginx Service"
Systemctl restart nginx &>>$LOG
STAT $?
