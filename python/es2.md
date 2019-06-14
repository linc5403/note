elastic 中文搜索

## es安装
The vm.max_map_count setting should be set permanently in /etc/sysctl.conf:

$ grep vm.max_map_count 
* /etc/sysctl.conf
```
vm.max_map_count=262144
```
To apply the setting on a live system type: 
``````
sysctl -w vm.max_map_count=262144
``````

## 全文检索
```
index_client.create(index='mono',
    body={
  "mappings": {
    "docs": {
      "properties": {
        "body": {
          "type": "text"
        }
      }
    }
  }
}

```
```json
GET /_search
{
  "query": { 
    "bool": { 
      "must": [
        { "match": { "title":   "Search"        }}, 
        { "match": { "content": "Elasticsearch" }}  
      ],
      "filter": [ 
        { "term":  { "status": "published" }}, 
        { "range": { "publish_date": { "gte": "2015-01-01" }}} 
      ]
    }
  }
}
```


max_result_window

```
curl -H 'Content-Type: application/json' -XPUT http://127.0.0.1:9200/_all/_settings -d '{ "index.max_result_window" :"100000000"}'
```



curl http://127.0.0.1:9200/_cat/health


## nginx

- 添加密码  
sudo htpasswd /etc/nginx/passwords aivideo  
- 删除密码  
sudo htpasswd -D /etc/nginx/passwords aivideo  

requests.get(url1, auth=('aivideo', 'xxxxx')).content

## 重新封装查询接口


import requests
query1 = '_nodes/stats/http'
user = 'aivideo'
passwd = 'xxxxxx'
base_url = 'http://online_es:8088/'
auth=(user, passwd)
r = requests.get(base_url+query1, auth=auth)
