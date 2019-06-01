# shell


1. cpoy 目录


```sh
!/bin/bash
BASE_DIRS=(/mnt/aishiping/aivideo /data/aishiping/aivideo /data2/aishiping/aivideo data3/aishiping/aivideo)
TARGET_DIR=/mnt/vcg_lib
for base in $BASE_DIR; do
    for sub in audio video image do
	cp $base/$sub/* $TARGET_DIR/$sub/
	echo "cp $base/$sub/* $TARGET_DIR/$sub/"
    done
done
```

