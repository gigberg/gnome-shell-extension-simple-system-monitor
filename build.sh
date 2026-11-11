#!/bin/bash

set -euo pipefail

if [ -x node_modules/.bin/prettier ]; then
    echo "Start formatting code..."
    npm run format
    echo "End formatting code."
else
    echo "Prettier not installed, skip code format"
fi

echo "Start packing..."
gnome-extensions pack src \
    --extra-source="settings.js" \
    --extra-source="prefs.ui" \
    --schema="schemas/org.gnome.shell.extensions.simple-system-monitor.gschema.xml" \
    --force
echo "Done."
