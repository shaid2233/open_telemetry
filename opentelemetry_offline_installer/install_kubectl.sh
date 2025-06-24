#!/bin/bash
set -e

echo "🔧 Installing kubectl..."

ARCHIVE="bin/kubectl-v1.30.0-linux-amd64.tar.gz"
EXTRACT_DIR="bin"

# Check that the archive exists
if [ ! -f "$ARCHIVE" ]; then
  echo "❌ Archive not found: $ARCHIVE"
  exit 1
fi

# Extract it
tar -xvzf "$ARCHIVE" -C "$EXTRACT_DIR"

# Move the binary to a system-wide location
sudo mv "$EXTRACT_DIR/kubectl" /usr/local/bin/kubectl
sudo chmod +x /usr/local/bin/kubectl

# Clean up
rm -f "$EXTRACT_DIR/kubectl"

echo "✅ kubectl installed!"
