build:
	mkdir bin
	cp src/main bin/etcdcenter
	cp -r src/action/ bin/

	mkdir lib
	cp -r src/action/ lib/