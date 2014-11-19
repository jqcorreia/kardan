
help:
	@echo
	@echo "Kardan - D SDK Builder"
	@echo "======================"
	@echo
	@echo "    build  -- Build the SDK container."
	@echo "    export -- Export the SDK."
	@echo

build:
	docker build -t "kardan" .

export:
	docker run -it -v `pwd`:/export kardan

