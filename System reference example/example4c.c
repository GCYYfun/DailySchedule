#include <stdio.h> 

// 根据 man open 说要include以下文件
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

// 根据 man read 说要include以下文件
#include <unistd.h>

int main() {
    
    printf("开始表演:\n");

    // 指定一个文件 路径
    char* path = "text";

    // 准备一个读取文件内容的地方
    char* buf[100];

    // 通过已知的 文件路径 文件权限 获得 一个文件的 描述符
    int fd = open(path,O_RDWR);

    // 试着打印看看fd到底是什么东西 
    printf("这是文件描述符？？ -> %d\n",fd);

    

    // 根据 给定 的 描述符 、缓存位置及要读取的数量 来读取 文件 内容 
    int read_result = read(fd,buf,12);

    // 打印 看看 读取的结果信息、因该是数字代表读取成功的数量、
    printf("read_result : %d\n",read_result);

    // 打印 从 文件 里 读取 出来的 内容
    printf("%s\n",buf);
    
    // 修改 缓存 的 内容 
    char s[] = "thanks";

    // 查看 修改后 情况
    printf("%s\n",s);

    // 重新写回文件中 、

    /*
        ssize_t write(int fd, const void *buf, size_t count);

        write() writes up to count bytes from the buffer starting at buf to the
                file referred to by the file descriptor fd.

    */
    int write_result =  write(fd,s,6);

    printf("write_result : %d\n",write_result);

    // printf("现在可以查看文件了、顺利的话应该已经写入、是继续在read count 个位置后继续写入的那种\n");

    // 关闭 文件 描述符 
    int close_result = close(fd);

    if (close_result == 0) {
        printf("关闭文件成功！");
    }else {
        printf("关闭文件出错！！！");
    }
    


    return 0;
}