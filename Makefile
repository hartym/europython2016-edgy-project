.PHONY: build run

run: build
	docker run -it --rm -v ~/.cache/pip:/root/.cache/pip europython/demo

build:
	docker build -t europython/demo .
