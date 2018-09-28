#!/bin/bash
date >> README.md
echo '' >> README.md
echo '```' >> README.md
mongoexport -d danmaku -c dans -o /data/wwwroot/api.prprpr.me/data/dans.json >> README.md 2>&1
cd /data/wwwroot/api.prprpr.me/data/
git diff --stat dans.json >> README.md
echo '```' >> README.md
echo '' >> README.md
git add .
git commit -m "Sync on `date`"
git push origin master
