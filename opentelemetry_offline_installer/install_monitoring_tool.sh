#!/bin/bash
set -e

TARBALL="bin/monitoring_toolkit.tar.gz"
EXTRACT_DIR="monitoring_toolkit"

echo "📦 Extracting $TARBALL..."
mkdir -p "$EXTRACT_DIR"
tar -xzf "$TARBALL" -C "$EXTRACT_DIR" --strip-components=0

cd "$EXTRACT_DIR"

echo "🛠 Running make install..."
make install

echo "✅ Helm chart installed successfully."
