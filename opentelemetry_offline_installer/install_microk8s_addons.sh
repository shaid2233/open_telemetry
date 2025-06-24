#!/bin/bash
set -e

echo "📦 Extracting MicroK8s add-on image archive..."

# Full path to the archive inside /bin
ARCHIVE="./bin/microk8s-addon-images.tar.gz"

# Step 1: Verify the archive exists
if [ ! -f "$ARCHIVE" ]; then
  echo "❌ Archive not found: $ARCHIVE"
  exit 1
fi

# Step 2: Extract the archive inside /bin
tar -xzf "$ARCHIVE" -C ./bin

# Step 3: Import all images
cd ./bin/microk8s-addon-images
echo "🔄 Importing add-on images into MicroK8s..."
for image in *.tar; do
  echo "📦 Importing $image..."
  sudo microk8s ctr image import "$image"
done
cd ../..

# Step 4: Enable MicroK8s add-ons
echo "⚙️ Enabling MicroK8s add-ons..."
sudo microk8s enable dns
sudo microk8s enable storage
sudo microk8s enable metallb

echo "✅ MicroK8s add-ons installed and ready!"
