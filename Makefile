
BUILDS_DIR=`pwd`/builds

help:
	@echo
	@echo "Kardan - D SDK Builder"
	@echo "======================"
	@echo
	@echo "    build  -- Build the SDK container."
	@echo "    export -- Export the SDK archive to the builds directory."
	@echo

setup-builder:
	cp builder/scripts/post-receive .git/hooks/

build:
	@echo "Building the kardan image..."
	docker build -t "kardan" ./builder
	@echo "Finished building the SDK."

export:
	@echo "Exporting the builds..."
	@mkdir -p $(BUILDS_DIR)
	docker run -it -v $(BUILDS_DIR):/builds kardan
	@echo "Exported SDK to: $(BUILDS_DIR)"
