nginx:
add_header X-Frame-Options 'Allow-From: scrm.qiaoqiaowan.net';
add_header X-Frame-Options 'Allow-From: 39.108.78.208';
settings.py
X_FRAME_OPTIONS = 'ALLOW-FROM scrm.qiaoqiaowan.net'
X_FRAME_OPTIONS = 'ALLOW-FROM 39.108.78.208'

