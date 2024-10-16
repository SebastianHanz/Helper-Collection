# Docker-Compose-Installation von ioBroker Standard & mit Redis inMemory-DB
___
## Standard ioBroker-Installation via Docker-Compose

### Variante 1: Repo via git clone auf das System kopieren, z.B.:

    cd /home
	
	# Repo in aktuelles Verzeichnis clonen
	git clone https://github.com/SebastianHanz/Server-Scripts
	
	# Wechsle zum richtigen Installations-Verzeichnis
	cd Server-Scripts/Docker-Compose/ioBroker/0_ioBroker_Standardinstallation

	# Benenne die Beispiel-Env-Datei um, damit durch Repo-Updates deine .env-Datei nicht überschrieben wird
	mv ./.env-example ./.env

	# Passe deine Environment-Datei an dein System an oder belasse es bei den Standard-Einstellungen
	nano .env

	# Starte ioBroker
	docker-compose up -d

Live log-view im Container wenn notwendig möglich mit:

    docker logs -f iobroker

Der ioBroker ist jetzt nach einigen Minuten unter http://SERVER-IP:8080 erreichbar.
### Variante 2:

    Manuelles Erstellen der .env & docker-compose.yml durch copy&paste aus diser Repo

___
# ioBroker für Redis vorbereiten

## Inhalt folgt

# ioBroker final mit Redis betreiben

## Inhalt folgt