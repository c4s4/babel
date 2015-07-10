NAME=babel
VERSION=0.2.1
BUILD_DIR=build
ARTICLE_MD=README.md
ARTICLE_XML=$(BUILD_DIR)/$(NAME).xml
SITE_DIR=../sweetohm/pages/

YELLOW=\033[93m
RED=\033[1m\033[91m
CLEAR=\033[0m


all: clean article install

article:
	@echo "$(YELLOW)Generating XML article$(CLEAR)"
	mkdir -p $(BUILD_DIR)
	md2xml -a -o $(ARTICLE_XML) $(ARTICLE_MD)
	cp $(ARTICLE_XML) $(SITE_DIR)

install:
	@echo "$(YELLOW)Installing scripts$(CLEAR)"
	sudo cp *-build version /opt/bin/

release: clean
	@echo "$(YELLOW)Releasing project$(CLEAR)"
	release

clean:
	@echo "$(YELLOW)Cleaning generated files$(CLEAR)"
	rm -rf $(BUILD_DIR)
