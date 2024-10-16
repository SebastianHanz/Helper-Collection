# Firmware Upgrade Script

Dieses Script ermöglicht es, eine Firmware für das DeCONZ ConBee II oder ähnliche Geräte herunterzuladen und auf einem angegebenen Gerät zu installieren. Es verwendet einen Docker-Container, um die Aktualisierung sicher und isoliert durchzuführen.

## Voraussetzungen

- Installierter Docker-Client auf dem System.
- Das Zielgerät muss per USB an das System angeschlossen und unter `/dev/` verfügbar sein.
- Die URL der Firmware, die heruntergeladen und installiert werden soll.

## Verwendung

**Hinweis:
Stelle sicher, dass das angegebene Gerät korrekt angeschlossen ist, bevor du das Skript ausführst!**

Das Skript erwartet zwei Parameter:
   
   - **URL der Firmware**: Diese findest du auf der [DeCONZ-Firmware-Seite](https://deconz.dresden-elektronik.de/deconz-firmware/).
   - **Device**: Der Pfad zum Gerät (z.B. `/dev/ttyACM0`).

**Beispiel:**


   ```bash
   ./firmware-upgrade.sh https://deconz.dresden-elektronik.de/deconz-firmware/deCONZ_ConBeeII_0x26780700.bin.GCF /dev/ttyACM0
   ```

# Was tut das Script?

### Firmware-Download:

Das Skript wechselt in das temporäre Verzeichnis /tmp und lädt die Firmware über die angegebene URL herunter.Falls der Download fehlschlägt, gibt das Skript eine entsprechende Fehlermeldung aus.

### Docker-Container starten:

Ein temporärer Docker-Container wird gestartet, um die Firmware-Installation sicher durchzuführen. Der Container erhält Zugriff auf notwendige Systemverzeichnisse wie /dev, /lib/modules, /sys und /tmp.

### Firmware-Flashen:

Der Flasher GCFFlasher_internal wird innerhalb des Containers aufgerufen und führt das Update auf dem angegebenen Gerät durch.

### Cleanup:

Nach erfolgreichem Flashen wird der Docker-Container gestoppt und entfernt. Außerdem wird die heruntergeladene Firmware-Datei gelöscht, um Speicherplatz freizugeben.



### Fehlerbehandlung
**Fehlende Parameter:** Wenn keine URL oder kein Gerät angegeben wird, erinnert das Skript daran, wie es korrekt verwendet wird.


**Gerät nicht gefunden:** Falls das angegebene Gerät nicht existiert, wird das Skript mit einem entsprechenden Hinweis abgebrochen.


**Fehler beim Download:** Wenn der Download fehlschlägt (z.B. durch eine falsche URL), bricht das Skript ebenfalls ab.
