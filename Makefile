
BUILDS_DIR=`pwd`/builds
BUILDS_LOG=`pwd`/builds.log

help:
	@echo
	@echo "Kardan - D SDK Builder"
	@echo "======================"
	@echo
	@echo "    build  -- Build the SDK container."
	@echo "    export -- Export the SDK archive to the builds directory."
	@echo

build:
	@echo "Building the kardan image..." >> $(BUILDS_LOG) 2>&1
	docker build -t "kardan" ./builder >> $(BUILDS_LOG) 2>&1
	@echo "Finished building the SDK." >> $(BUILDS_LOG) 2>&1

export: build
	@echo "Exporting the builds..." >> $(BUILDS_LOG) 2>&1
	@mkdir -p $(BUILDS_DIR) >> $(BUILDS_LOG) 2>&1
	docker run -it -v $(BUILDS_DIR):/builds kardan >> $(BUILDS_LOG) 2>&1
	@echo "Finished exporting the SDK." >> $(BUILDS_LOG) 2>&1
	ls $(BUILDS_DIR) >> $(BUILDS_LOG) 2>&1
	echo >> $(BUILDS_LOG) 2>&1

