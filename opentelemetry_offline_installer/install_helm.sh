#!/bin/bash
set -e
echo "🔧 Installing Helm..."
tar -xvzf bin/helm-v3.14.3-linux-amd64.tar.gz -C bin/
sudo mv bin/linux-amd64/helm /usr/local/bin/
sudo chmod +x /usr/local/bin/helm
rm -rf bin/linux-amd64
echo "✅ Helm installed!"
