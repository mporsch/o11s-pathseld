prefix = /usr/local
bindir = $(prefix)/sbin


VERSION_STR="\"0.1\""

CFLAGS += -DVERSION_STR=$(VERSION_STR) -g -I$(STAGING_DIR)/usr/include/libnl3
LIBS=-lnl-3 -lnl-genl-3

OBJECTS=main.o netlink.o

all: o11s_pathseld

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^

o11s_pathseld: $(OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

clean:
	rm -f $(OBJECTS) o11s_pathseld

distclean: clean

install: all
	install -d $(DESTDIR)$(bindir)
	install -m 755 o11s_pathseld $(DESTDIR)$(bindir)

uninstall:
	-rm -f $(DESTDIR)$(bindir)/o11s_pathseld
