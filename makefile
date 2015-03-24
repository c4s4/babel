NAME=babel
VERSION=0.2.0
BUILD_DIR=build
ARTICLE_MD=readme.md
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

install: install
	@echo "$(YELLOW)Installing scripts$(CLEAR)"
	sudo cp *-build version /opt/bin/

release: clean article install
	@echo "$(YELLOW)Releasing project$(CLEAR)"
	git diff --quiet --exit-code HEAD || (echo "$(RED)There are uncommitted changes$(CLEAR)"; exit 1)
	@if [ `git rev-parse --abbrev-ref HEAD` != "master" ]; then \
		echo "$(RED)You must release on branch master$(CLEAR)"; \
		exit 1; \
	fi
	git tag "$(VERSION)"
	git push --tag

clean:
	@echo "$(YELLOW)Cleaning generated files$(CLEAR)"
	rm -rf $(BUILD_DIR)
