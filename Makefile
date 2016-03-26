NAME=babel
VERSION=$(shell changelog release version)
BUILD_DIR=build

YELLOW=\033[93m
RED=\033[1m\033[91m
CYAN=\033[1m\033[96m
CLEAR=\033[0m

help:
	@echo "$(YELLOW)Printing build help$(CLEAR)"
	@echo "$(CYAN)help$(CLEAR)     Print this help screen"
	@echo "$(CYAN)install$(CLEAR)  Install tools in /opt/bin directory"
	@echo "$(CYAN)archive$(CLEAR)  Generate distribution archive"
	@echo "$(CYAN)release$(CLEAR)  Release project"
	@echo "$(CYAN)clean$(CLEAR)    Clean generated files"

install:
	@echo "$(YELLOW)Installing scripts$(CLEAR)"
	sudo cp bin/* /opt/bin/
	sudo cp etc/* /etc/profile.d/

archive:
	@echo "$(YELLOW)Building distribution archive$(CLEAR)"
	rm -rf $(BUILD_DIR)
	mkdir -p $(BUILD_DIR)/$(NAME)-$(VERSION)/
	cp -r bin/ etc/ LICENSE.txt $(BUILD_DIR)/$(NAME)-$(VERSION)/
	md2pdf README.md && mv README.pdf $(BUILD_DIR)/$(NAME)-$(VERSION)/
	changelog to html style > $(BUILD_DIR)/$(NAME)-$(VERSION)/CHANGELOG.html
	cd $(BUILD_DIR) && tar cvzf $(NAME)-$(VERSION).tar.gz $(NAME)-$(VERSION)/	

release: clean
	@echo "$(YELLOW)Releasing project$(CLEAR)"
	release

clean:
	@echo "$(YELLOW)Cleaning generated files$(CLEAR)"
	rm -rf $(BUILD_DIR)
