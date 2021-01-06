use std::future::Future;
use std::fs::File;
use std::path::Path;
use std::io::prelude::*;

use std::task::{Context,Poll,Waker,RawWaker,RawWakerVTable}; 
use std::pin::Pin;

use std::sync::{Arc,Mutex};


pub async fn async_read_file() {
    let mut file = async_open().await;
    println!("在我之前已经开始执行open");
    async_read(&mut file).await;
    println!("读取结束！");
}

pub async fn async_print_num() {
    println!("66");
}

async fn async_open() -> File{
    let path = Path::new("async");
    let display = path.display();

    // 只读打开
    let file = match File::open(&path) {
        Err(why) => panic!("couldn't open {}: {}", display,why),
        Ok(file) => file,
    };
    println!("file 已async打开");
    file
}
async fn async_read(file:&mut File) {
    let mut s = String::new();
    match file.read_to_string(&mut s) {
        Err(why) => panic!("couldn't read : {}",why),
        Ok(_) => print!("File contains:\n{}", s),
    }
}


pub fn read_file() {

    let path = Path::new("hello");
    let display = path.display();

    // 只读打开
    let mut file = match File::open(&path) {
        Err(why) => panic!("couldn't open {}: {}", display,why),
        Ok(file) => file,
    };

    // 读 一个字符串
    let mut s = String::new();
    match file.read_to_string(&mut s) {
        Err(why) => panic!("couldn't read {}: {}", display,why),
        Ok(_) => print!("File {} contains:\n{}", display, s),
    }
}

pub struct Executor {

}

impl Executor {

}

pub fn run (future: impl Future<Output = ()> + 'static) {

    // 构造一个waker
    let waker = waker();
    let mut cx = Context::from_waker(&waker);

    let mut future = Box::pin(future);

    loop {
        match future.as_mut().poll(&mut cx) {
            Poll::Ready(val) => break val,
            Poll::Pending => println!("pending"),
        };
    }
}

struct Data {
    // waker 应 持有的资源
    // switch:Arc<Mutex<Switch>>,
}

fn wake(d:&Data) {
    // 注册在vtable 中 当调用 wake 时、应该有的 处理 方法
    
}

fn raw_waker() -> RawWaker {

    fn no_op(_: *const ()) {}
    fn clone(_: *const ()) -> RawWaker {
        raw_waker()
    }
    let vtable = &RawWakerVTable::new(
        clone, no_op, no_op, no_op
    );
    RawWaker::new(0 as *const (), vtable)
}

fn waker() -> Waker {
    unsafe{Waker::from_raw(raw_waker())}
}