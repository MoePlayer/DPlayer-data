#!/bin/bash
date >> README.md
echo '' >> README.md
echo '```' >> README.md
docker exec dplayernode_mongo_1 mongoexport -d danmaku -c dans -o /data/db/backup/dans.json >> README.md 2>&1
cp ~/dplayer/db/backup/dans.json .
git diff --stat dans.json >> README.md
echo '```' >> README.md
echo '' >> README.md
git add .
git commit -m "Sync on `date`"
git push origin master
