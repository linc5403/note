# -*- coding: utf-8 -*-
import logging
import json, oss2
import os, tempfile

logger = logging.getLogger()

def handler(event, context):
    evt = json.loads(event)
    creds = context.credentials
    # Required by OSS sdk
    auth=oss2.StsAuth(
        creds.access_key_id,
        creds.access_key_secret,
        creds.security_token)
    evt = evt['events'][0]
    objectName = evt['oss']['object']['key']
    if 'bak' not in objectName:
        bucket_name = evt['oss']['bucket']['name']
        endpoint = 'oss-' +  evt['region'] + '.aliyuncs.com'
        bucket = oss2.Bucket(auth, endpoint, bucket_name)
        # Processed images will be saved to processed/
        newKey = objectName.replace("test/", "test/test/") + '.bak'
        with tempfile.TemporaryDirectory(dir='/mnt/nas') as base_path:
            local_file = os.path.join(base_path, '123')
            bucket.get_object_to_file(objectName, local_file)
            bucket.put_object_from_file(newKey, local_file)
