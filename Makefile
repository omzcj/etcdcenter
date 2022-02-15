build:
	mkdir bin
	cp src/main bin/etcdcenter
	cp -r src/action/ bin/
	mkdir action
	cp -r src/action/ action/