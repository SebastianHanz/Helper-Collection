#!/bin/bash

# Pfad zur Datei
FILE="/etc/systemd/journald.conf"

# Überprüfen, ob die Datei existiert
if [[ ! -f $FILE ]]; then
    echo "Datei $FILE existiert nicht."
    exit 1
fi

# Ersetzen der betroffenen Zeilen in der Datei
sed -i \
    -e 's/^#SystemMaxUse=.*$/SystemMaxUse=50M/' \
    -e 's/^SystemMaxUse=.*$/SystemMaxUse=50M/' \
    "$FILE"

# Datei neu laden
systemctl restart systemd-journald
echo "Die Änderungen wurden vorgenommen und systemd-journald wurde neu gestartet."