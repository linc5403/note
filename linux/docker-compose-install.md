# docker compose install
## install
``````
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

https://github.com/docker/compose/releases

sudo chmod +x /usr/local/bin/docker-compose
``````

## auto completion  

```
mkdir -p ~/.zsh/completion
curl -L https://raw.githubusercontent.com/docker/compose/1.23.2/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose

.zshrc add follow
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
```

