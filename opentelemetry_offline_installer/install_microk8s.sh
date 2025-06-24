#!/bin/bash
set -e

echo "🔧 Installing MicroK8s (offline from archive)..."

ARCHIVE="bin/microk8s-offline.tar.gz"
BIN_DIR="bin"

# Step 1: Check that the archive exists
if [ ! -f "$ARCHIVE" ]; then
  echo "❌ Archive not found: $ARCHIVE"
  exit 1
fi

# Step 2: Extract the archive
echo "📦 Extracting MicroK8s archive..."
tar -xzvf "$ARCHIVE" -C "$BIN_DIR"

# Step 3: Find the extracted files
SNAP_FILE=$(find "$BIN_DIR" -name '*.snap' | head -n 1)
ASSERT_FILE=$(find "$BIN_DIR" -name '*.assert' | head -n 1)

# Step 4: Validate both exist
if [ ! -f "$SNAP_FILE" ] || [ ! -f "$ASSERT_FILE" ]; then
  echo "❌ Required files not found after extraction."
  exit 1
fi

# Step 5: Acknowledge the assert
echo "📄 Acknowledging MicroK8s assertion..."
sudo snap ack "$ASSERT_FILE"

# Step 6: Install MicroK8s
echo "📥 Installing MicroK8s snap..."
sudo snap install "$SNAP_FILE" --classic

# Step 7: Add user to group and setup config
echo "🔐 Adding user to microk8s group..."
sudo usermod -a -G microk8s "$USER"
mkdir -p ~/.kube
sudo microk8s config > ~/.kube/config
sudo chown -f -R "$USER" ~/.kube || true

echo "✅ MicroK8s installed and configured successfully!"
