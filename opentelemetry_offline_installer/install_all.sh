#!/bin/bash
set -e
echo "🚀 Installing Kubernetes Offline Toolkit (kubectl + Helm + K9s)..."
./install_microk8s.sh
./install_microk8s_addons.sh
./install_kubectl.sh
./install_k9s.sh
./install_helm.sh
./install_makefile_package.sh
./install_monitoring_tool.sh
echo "🎉 All tools installed successfully!"

