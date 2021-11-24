default:
	docker build -t prerender-docker-middleware:SNAPSHOT .

run: default
	docker run -p 8080:80 prerender-docker-middleware:SNAPSHOT
