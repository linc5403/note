### SSH port forwarding: bind: Cannot assign requested address

While trying to do a simple port forwarding to access a remote mysql server via a secured channel I was getting an annoying**bind: Cannot assign requested address**.  
  
$ ssh -v user@host.biz -L5555:localhost:3306  
debug1: Local forwarding listening on ::1 port 5555.  
bind: Cannot assign requested address  
  
So it must be the buggy IPv6, after adding -4, all worked like a charm.  
  
$**ssh -4 -v user@host.biz -L5555:localhost:3306**  
debug1: Local forwarding listening on 127.0.0.1 port 5555.  
debug1: channel 0: new \\[port listener\\]
