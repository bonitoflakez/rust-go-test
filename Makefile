ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: build-all run-all build-dynamic build-static run-dynamic run-static test-rust-lib clean

build-all: build-dynamic build-static

run-all: run-dynamic run-static

build-dynamic:
	@echo "Building dynamic binary..."
	@cd lib/hewwo && cargo build --release
	@cp lib/hewwo/target/release/libhewwo.so lib/
	@go build -ldflags="-r $(ROOT_DIR)lib" dynamics.go

build-static:
	@echo "Building static binary..."
	@cd lib/hewwo && cargo build --release
	@cp lib/hewwo/target/release/libhewwo.a lib/
	@go build statics.go

run-dynamic: build-dynamic
	@echo "Running dynamic binary..."
	@./dynamics

run-static: build-static
	@echo "Running static binary..."
	@./statics

test-rust-lib:
	@echo "Running Rust tests..."
	@cd lib/hewwo && cargo test -- --nocapture

clean:
	@echo "Cleaning up..."
	@rm -rf dynamics statics lib/libhewwo.so lib/libhewwo.a lib/hewwo/target
