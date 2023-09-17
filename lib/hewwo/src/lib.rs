use std::ffi::CStr;

#[no_mangle]
pub extern "C" fn greet(name: *const libc::c_char) {
    let name_cstr = unsafe { CStr::from_ptr(name) };
    let name = name_cstr.to_str().unwrap();
    println!("Hello, {}!", name);
}

#[no_mangle]
pub extern "C" fn add_two_numbers(a: i32, b: i32) -> i32 {
    a + b
}

#[cfg(test)]
pub mod test {

    use super::*;
    use std::ffi::CString;

    #[test]
    fn simulated_main_function() {
        greet(CString::new("BONITO KYUNNN!!").unwrap().into_raw());

        let result = add_two_numbers(10, 20);
        println!("Result of adding two numbers: {}", result);
    }
}
