YUE?=yue
BUSTED?=busted
LUAROCKS?=luarocks
ESCALATE?=sudo
LUA?=lua
LUA_VERSION?=5.2

PREFIX?=/usr/local
BINDIR?=$(PREFIX)/bin

.PHONY: all install clean watch

all: bin/yuecheck

# NOTE: The shebang here is mostly for quick testing; luarocks installation
# will replace it with the appropriate one
bin/yuecheck: bin/yuecheck.yue
	echo "#!/usr/bin/env $(LUA)" > $@
	$(YUE) $< -p >> $@
	chmod +x $@

local:
	$(LUAROCKS) make --force --local yuecheck-vim-scm-1.rockspec

global:
	$(ESCALATE) $(LUAROCKS) make yuecheck-vim-scm-1.rockspec

watch:
	inotifywait -r bin/*.yue -m --event close_write 2>/dev/null | while read ev; do make; done

install: bin/yuecheck
	@test -d $(BINDIR) || mkdir -pm 755 $(BINDIR)
	cp $< "$(BINDIR)"/

clean:
	rm -f bin/yuecheck
