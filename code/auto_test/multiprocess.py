import multiprocessing
import time

def func(i,j,k):
    
    print("msg:", i,j,k)
    # time.sleep(3)
    # print("end")

if __name__ == "__main__":
    pool = multiprocessing.Pool(processes = 3)
    start = time.time() 
    for i in range(3):
        msg = "hello %d" %(i)
        pool.apply_async(func, (i,i,i, ))   #维持执行的进程总数为processes，当一个进程执行完毕后会添加新的进程进去
    
    pool.close()
    pool.join()   #调用join之前，先调用close函数，否则会出错。执行完close后不会有新的进程加入到pool,join函数等待所有子进程结束
    end = time.time()

    print('使用多进程程--timestamp:{:.3f}'.format(end-start))
    start = time.time() 
    for i in range(3):
        
        # msg = "hello %d" %(i)
        # print("msg:", msg)
        time.sleep(3)
        # print("end")
    end = time.time()
    print('不使用多进程程--timestamp:{:.3f}'.format(end-start))
    print("Mark~ Mark~ Mark~~~~~~~~~~~~~~~~~~~~~~")
    
    print("Sub-process(es) done.")