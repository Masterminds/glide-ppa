build:
	bin/build

test: build
	bin/test

clean:
	git checkout .version

dist: build
	bin/dist