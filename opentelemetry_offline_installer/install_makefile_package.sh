#!/bin/bash
set -e

TARBALL="deb/make_package.tar.gz"
EXTRACT_DIR="deb/temp_make_extract"

echo "📦 Extracting $TARBALL..."
mkdir -p "$EXTRACT_DIR"
tar -xzf "$TARBALL" -C "$EXTRACT_DIR"

DEB_FILE=$(find "$EXTRACT_DIR" -name "*.deb" | head -n 1)

if [ -z "$DEB_FILE" ]; then
  echo "❌ No .deb file found in $TARBALL"
  exit 1
fi

echo "📥 Installing $DEB_FILE..."
sudo dpkg -i "$DEB_FILE"

echo "✅ make package installed successfully!"
