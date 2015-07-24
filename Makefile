NAME=babel
VERSION=$(shell changelog release version)
BUILD_DIR=build

YELLOW=\033[93m
RED=\033[1m\033[91m
CLEAR=\033[0m

install:
	@echo "$(YELLOW)Installing scripts$(CLEAR)"
	sudo cp *-build version /opt/bin/

archive:
	@echo "$(YELLOW)Building distribution archive$(CLEAR)"
	rm -rf $(BUILD_DIR)
	mkdir -p $(BUILD_DIR)/$(NAME)-$(VERSION)/
	cp *-build version LICENSE.txt $(BUILD_DIR)/$(NAME)-$(VERSION)/
	md2pdf README.md && mv README.pdf $(BUILD_DIR)/$(NAME)-$(VERSION)/
	changelog to html style > $(BUILD_DIR)/$(NAME)-$(VERSION)/CHANGELOG.html
	cd $(BUILD_DIR) && tar cvzf $(NAME)-$(VERSION).tar.gz $(NAME)-$(VERSION)/	

release: clean
	@echo "$(YELLOW)Releasing project$(CLEAR)"
	release

clean:
	@echo "$(YELLOW)Cleaning generated files$(CLEAR)"
	rm -rf $(BUILD_DIR)
