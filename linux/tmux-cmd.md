# tmux 常用命令  


cmd | 作用  
 - | -  
tmux ls | 查看所有session  
tmux a -t <session-name> | attatch  
tmux new -s <session-name> | 创建新的session
ctrl + b + d | 退出当前session  
tmux kill-session -t <session-name> | 杀掉对应session  
tmux rename-session "new-name" | 重命名session
