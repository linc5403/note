
# python proxy


`$ pip install 'requests[socks]'`

```python
proxies = {'http': 'socks5h://127.0.0.1:1086', 'https': 'socks5h://127.0.0.1:1086'}

r = s.get(urljoin('https://www.youtube.com/', ajax), proxies=proxies)

youtube-dl --proxy socks5://127.0.0.1:1086 https://youtu.be/8o6aTU94BW8

def download_url(url):
    cmd = ['youtube-dl', '--proxy', 'socks5://127.0.0.1:1086', url]
    pipe = subprocess.Popen(cmd)
    out, err = pipe.communicate()
```
