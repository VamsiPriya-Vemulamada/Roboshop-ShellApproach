yum install ngnix -y
systemctl enable nginx
systemctl start ngnix
#downloading the code
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
#downloading the content
cd /usr/share/ngnix/html
rm -rf *
unzip /tmp/fronntend.zip
mv frontend-main/static/* .
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf

systemctl restart nginx
