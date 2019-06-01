# pip install requests-toolbelt

```
from requests_toolbelt import MultipartEncoder

m = MultipartEncoder(
    fields={'field0': 'value', 'field1': 'value',
            'field2': ('filename', open('file.py', 'rb'), 'text/plain')}
    )

r = requests.post('http://httpbin.org/post', data=m,
                  headers={'Content-Type': m.content_type})
```
                  
```
new_multipart_params = {
     'key' : key + '${filename}',
     'policy': policyBase64,
     'OSSAccessKeyId': accessid,
     'success_action_status' : '200', //让服务端返回200,不然，默认会返回204
     'callback': 　callbackbody,
     'signature': signature,
};
```

