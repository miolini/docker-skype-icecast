PWD=$(shell pwd)
build:
	docker build -t miolini/skype-icecast .

run: build
	docker run --privileged -v /dev:/dev -v /lib/modules:/lib/modules -d -p 5900:5900 -p 80:80 -p 8000:8000 \
	-v $(PWD)/data:/root -t --name skype-icecast \
	miolini/skype-icecast 
	@echo Done.
clean:
	docker rm -f skype-icecast
shell: build
	docker run -p 5900:5900 -v $(pwd)/data:/root -v /dev:/dev -v /lib/modules:/lib/modules -t miolini/skype-icecast bash
