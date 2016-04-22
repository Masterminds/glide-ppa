build:
	bin/build

test: build
	bin/test

dist: build
	bin/dist