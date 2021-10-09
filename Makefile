# Parent Makefiles https://github.com/c4s4/make

include ~/.make/basics.mk

SCRIPTS = "version go-build python-build python-venv vscodium-build"
CONFIGS = "app-dir.sh golang.sh java.sh python.sh vscodium.sh"

release: github-release # Perform a release

install: # Install scripts and configuration
	$(title)
	@echo "Installing scripts"
	@for file in $(SCRIPTS); do \
		cp bin/$$file /opt/bin/; \
	done
	@echo "Installing configurations"
	@for file in $(CONFIGS); do \
		cp etc/$$file /etc.profile.d/; \
	done
