PREFIX	:= /usr
SRCDIR	:= $(PREFIX)/share/pearl
BINDIR	:= $(PREFIX)/bin

define setup

endef

define remove

endef

compile:
	@echo "hola? kohkoh."

clean:
	@echo "Cleaned.."

install:
	@$(setup)
	@echo "Installed.."

uninstall:
	@$(remove)
	@echo "Uninstalled.."

reinstall:
	@$(remove)
	@$(setup)
	@echo "Reinstalled.."
