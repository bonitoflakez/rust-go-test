# Rust and Go Integration Example

A demonstration example of integrating Rust and Go code in a single project to understand how to call Rust functions from Go and vice versa, as well as how to build both dynamic and static binaries for the combined application.

## Project Structure

```txt
.
├── dynamics.go
├── lib
│   ├── hewwo
│   │   ├── Cargo.lock
│   │   ├── Cargo.toml
│   │   └── src
│   │       └── lib.rs
│   └── hewwo.h
├── Makefile
└── statics.go
```

- `lib/hewwo`: This directory contains a Rust library named `hewwo` that exposes two functions: `greet` and `add_two_numbers`.

## Rust Code (lib.rs)

The Rust code in `lib/hewwo/src/lib.rs` defines two functions and includes test cases:

- `greet(name: *const libc::c_char)`: This function takes a C-style string as input and prints a greeting message.

- `add_two_numbers(a: i32, b: i32) -> i32`: This function performs integer addition and returns the result.

## Go Code

### dynamics.go

The `dynamics.go` file demonstrates how to call Rust functions from Go dynamically. It imports the `hewwo` library and invokes the `greet` and `add_two_numbers` functions.

### statics.go

The `statics.go` file shows how to build and run a statically linked binary that incorporates the Rust code from the `hewwo` library.

## Building and Running

The `Makefile` provides convenient targets for building and running the project components:

- `make build-all`: Builds both the dynamic and static binaries.
- `make run-all`: Runs both the dynamic and static binaries.
- `make build-dynamic`: Builds the dynamic binary.
- `make build-static`: Builds the static binary.
- `make run-dynamic`: Runs the dynamic binary.
- `make run-static`: Runs the static binary.
- `make test-rust-lib`: Runs Rust tests in the `hewwo` library.
- `make clean`: Cleans up build artifacts.

## Getting Started

To get started with this project:

1. Clone the repository.

2. Navigate to the project directory.

3. Use the provided `Makefile` targets to build, run, and test the project components.

Feel free to modify the Rust and Go code to suit your needs and explore further integrations between the two languages.
