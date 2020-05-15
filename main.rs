use fdemo::*;

fn main() {

    read_file();

    println!("--------------------");
    run(async_print_num());
    run(async_read_file());
    
}










// use std::future::Future;
// use std::sync::Arc;
// use std::thread::{self,JoinHandle};
// use std::sync::Mutex;
// use std::task::{Context,Poll,Waker,RawWaker,RawWakerVTable};     
// use std::pin::Pin;      // 固定内存
// use std::time::{Duration,Instant};
// use std::sync::mpsc::{channel,Sender};
// use std::collections::HashMap;

// use fdemo;

// fn main() {
//     let start = Instant::now();
//     let reactor = Reactor::new();
//     let reactor = Arc::new(Mutex::new(reactor));

//     let fut1 = async {
//         let val = Task::new(reactor.clone(),1,1).await;

//         println!("Got {} at time: {:.2}",val,start.elapsed().as_secs_f32());
//     }

//     let fut2 = async {
//         let val = Task::new(reactor.clone(), 2, 2).await;
//         println!("Got {} at time: {:.2}.", val, start.elapsed().as_secs_f32());
//     };


//     let mainfut = async {
//         fut1.await;
//         fut2.await;
//     }

//     block_on(mainfut);

//     reactor.lock().map(|mut r| r.close()).unwrap();
// }

// async fn get_num() {
//     // let mut file = File::create("foo.txt").await;
//     println!("1");
// }



// // 执行器 接收future 、负责放future运行完、返回结果
// //  1、负责 poll 放入 我这里的 future 、
// //  2、poll 后  成功放走、
// //  3、不成功 、打上标签放入牢笼继续等待、这个标签叫weaker

// fn block_on<F:Future>(mut future:F) -> F::Output {
    
//     // 一上来就建一个 weaker 
//     let mywaker = Arc::new(MyWaker{ thread:thread::current()});

//     let waker = waker_into_waker(Arc::into_raw(mywaker));

//     // 把waker 封装成 context

//     let mut cx = Context::from_waker(&waker);

//     let mut future = unsafe {
//         Pin::new_unchecked(&mut future)
//     };

//     let val = loop {
//         match Future::poll(pinned,&mut cx) {
//             Poll::Ready(val) => break val,
//             Poll::Pending => thread::park(),
//         };
//     };
//     val
// }


// #[derive(Clone)]
// struct MyWaker {
//     thread:thread::Thread,
// }

// // 当前任务

// #[derive(Clone)]
// pub struct Task {
//     id:usize,
//     reactor:Arc<Mutex<Box<Reactor>>>,
//     data:u64,
// }

// impl Task {
//     fn new(reactor: Arc<Mutex<Box<Reactor>>>, data: u64, id: usize) -> Self {
//         Task { id, reactor, data }
//     }
// }

// impl Future for Task {
//     type Output = usize;

//     fn poll(self:Pin<&mut Self>,cx:&mut Context<'_>) -> Poll<Self::Output> {
//         let mut r = self.reactor.lock().unwrap();

//         if r.is_ready(self.id) {
//             *r.tasks.get_mut(&self.id).unwrap() = TaskState::Finished;
//             Poll::Ready(self.id)
//         }else if r.tasks.contains_key(&self.id) {
//             r.tasks.insert(self.id, TaskState::NotReady(cx.waker().clone()));
//             Poll::Pending
//         }else {
//             r.register(self.data, cx.waker().clone(), self.id);
//             Poll::Pending
//         }
//     }
// }

// enum TaskState {
//     Ready,
//     NotReady(Waker),
//     Finished,
// }

// struct Reactor {
//     dispatcher: Sender<Event>,
//     handle: Option<JoinHandle<()>>,
//     tasks: HashMap<usize, TaskState>,
// }

// #[derive(Debug)]
// enum Event {
//     Close,
//     Timeout(u64, usize),
// }

// impl Reactor {
//     fn new() -> Arc<Mutex<Box<Self>>> {
//         let (tx, rx) = channel::<Event>();
//         let reactor = Arc::new(Mutex::new(Box::new(Reactor {
//             dispatcher: tx,
//             handle: None,
//             tasks: HashMap::new(),
//         })));

//         let reactor_clone = Arc::downgrade(&reactor);


//         let handle = thread::spawn(move || {
//             let mut handles = vec![];

//             // This simulates some I/O resource
//             for event in rx {
//                 println!("REACTOR: {:?}", event);
//                 let reactor = reactor_clone.clone();
//                 match event {
//                     Event::Close => break,
//                     Event::Timeout(duration, id) => {

//                         // We spawn a new thread that will serve as a timer
//                         // and will call `wake` on the correct `Waker` once
//                         // it's done.
//                         let event_handle = thread::spawn(move || {
//                             thread::sleep(Duration::from_secs(duration));
//                             let reactor = reactor.upgrade().unwrap();
//                             reactor.lock().map(|mut r| r.wake(id)).unwrap();
//                         });
//                         handles.push(event_handle);
//                     }
//                 }
//             }
//             handles.into_iter().for_each(|handle| handle.join().unwrap());
//         });
//         reactor.lock().map(|mut r| r.handle = Some(handle)).unwrap();
//         reactor
//     }


//     fn wake(&mut self, id: usize) {
//         self.tasks.get_mut(&id).map(|state| {
//             match mem::replace(state, TaskState::Ready) {
//                 TaskState::NotReady(waker) => waker.wake(),
//                 TaskState::Finished => panic!("Called 'wake' twice on task: {}", id),
//                 _ => unreachable!()
//             }
//         }).unwrap();
//     }

//     fn register(&mut self, duration: u64, waker: Waker, id: usize) {
//         if self.tasks.insert(id, TaskState::NotReady(waker)).is_some() {
//             panic!("Tried to insert a task with id: '{}', twice!", id);
//         }
//         self.dispatcher.send(Event::Timeout(duration, id)).unwrap();
//     }

//     fn close(&mut self) {
//         self.dispatcher.send(Event::Close).unwrap();
//     }

//     fn is_ready(&self, id: usize) -> bool {
//         self.tasks.get(&id).map(|state| match state {
//             TaskState::Ready => true,
//             _ => false,
//         }).unwrap_or(false)
//     }
// }


// impl Drop for Reactor {
//     fn drop(&mut self) {
//         self.handle.take().map(|h| h.join().unwrap()).unwrap();
//     }
// }