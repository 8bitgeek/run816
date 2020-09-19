
TARGET=../bin/run816
CPPFLAGS+=-O2 -I./ -I../libemu816 -I../libs19
LIBEMU816=../libemu816/libemu816.a
LIBS19=../libs19/libs19.a

$(TARGET): run816.cc vm816.cc load816.cc dbg816.cc trc816.cc vm816.h load816.h dbg816.h trc816.h
	g++ run816.cc vm816.cc load816.cc dbg816.cc trc816.cc $(CPPFLAGS) $(LIBS19) $(LIBEMU816) -o $(TARGET) -l ncurses

clean:
	$(RM) *.o
	$(RM) *.lst
	$(RM) *.map
	$(RM) $(TARGET)

install: $(TARGET)
	cp $(TARGET) /usr/local/bin/

