 # nginx
 
 
 OK, everything went just fine!

 To start and stop the Amplify Agent type:

     sudo service amplify-agent { start | stop }

 Amplify Agent log can be found here:
     /var/log/amplify-agent/agent.log

 After the agent is launched, it takes a couple of minutes for this system to appear
 in the Amplify user interface.

 PLEASE CHECK THE DOCUMENTATION HERE:
     https://amplify.nginx.com/docs/

 Launching amplify-agent ...
 All done.


## nginx 前台运行
nginx -g 'daemon off;'


## timezone(时区)
* /etc/init.d/nginx
`export TZ="Asia/Shanghai"`
