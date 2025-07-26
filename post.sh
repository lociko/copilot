#!/bin/bash
cd /home/runner/work/_temp/
echo "- Compress Copilot source"
zip -r copilot-developer-action-main.zip ./copilot-developer-action-main

# Upload the zip file as an artifact using GitHub CLI
echo "- Upload Copilot source ZIP"
gh run upload copilot-developer-action-main.zip --name copilot-developer-action-artifact

cd ./copilot-developer-action-main/dist
npm install --global shuji

echo Decompres
shuji index.js.map -o ../src_copilot
cd ..
zip -r src_copilot.zip ./src_copilot
gh run src_copilot.zip --name copilot-developer-src-artifact
