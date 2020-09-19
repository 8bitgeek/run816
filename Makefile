TARGET=dummy

$(TARGET):
	(cd libemu816 && make)
	(cd libs19 && make)
	(cd src && make)
	(cd test && make)

clean:
	(cd libemu816 && make clean)
	(cd libs19 && make clean)
	(cd src && make clean)
	(cd test && make clean)

install:
	(cd libemu816 && make install)
	(cd libs19 && make install)
	(cd src && make install)

