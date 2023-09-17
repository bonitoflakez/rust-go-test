package main

/*
#cgo LDFLAGS: ./lib/libhewwo.a -ldl
#include "./lib/hewwo.h"
*/
import "C"
import "fmt"

func main() {
	C.greet(C.CString("😻"))

	a := C.int(58)
	b := C.int(11)
	result := C.add_two_numbers(a, b)
	fmt.Printf("Result of adding %d and %d: %d\n", a, b, result)
}
