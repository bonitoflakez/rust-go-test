package main

/*
#cgo LDFLAGS: -L./lib -lhewwo
#include "./lib/hewwo.h"
*/
import "C"
import "fmt"

func main() {
	C.greet(C.CString("NEKO ヾ(•ω•`)o"))

	a := C.int(10)
	b := C.int(20)
	result := C.add_two_numbers(a, b)
	fmt.Printf("Result of adding %d and %d: %d\n", a, b, result)
}
