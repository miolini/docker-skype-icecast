build:
	docker build -t miolini/skype-icecast .

run: build
	docker run -d -p 5900:5900 -v $(pwd)/data:/root -t miolini/skype-icecast
	@echo Done.
shell: build
	docker run -p 5900:5900 -v $(pwd)/data:/root -t miolini/skype-icecast bash
