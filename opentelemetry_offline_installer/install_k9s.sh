#!/bin/bash
set -e
echo "🔧 Installing K9s..."
tar -xvzf bin/k9s_Linux_amd64.tar.gz -C bin/
sudo mv bin/k9s /usr/local/bin/
sudo chmod +x /usr/local/bin/k9s
echo "✅ K9s installed!"
