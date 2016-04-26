build:
	bin/build

test: build
	bin/test

clean:
	git checkout .

dist: build
	bin/dist