cmd_list = yum

.PHONY: all clean install check install_common $(cmd_list)

pkgdatadir=$(datadir)/eepm

install: install_common $(cmd_list)

install_common:
	mkdir -p $(DESTDIR)$(bindir)/

$(cmd_list):
	sed -e "s|SHAREDIR=.*|SHAREDIR=$(pkgdatadir)|g" \
		-e "s|CONFIGDIR=.*|CONFIGDIR=$(sysconfdir)/eepm|g" \
		-e "s|@VERSION@|$(version)|g" <bin/$@ >$(DESTDIR)$(bindir)/$@

check:
	echo "test suite.."
