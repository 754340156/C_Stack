//
//  main.m
//  Stack
//
//  Created by 赵哲 on 2017/5/2.
//  Copyright © 2017年 赵哲. All rights reserved.
//

#import <Foundation/Foundation.h>

//链表
typedef struct NODE
{
    int data;//数据域
    struct NODE * next;//指针域
}* Node;
//栈
typedef struct STACK
{
    Node top;//栈顶
    Node bottom;//栈底
    
} * Stack;
//初始化
Stack init_stack();
//入栈
void push_stack(Stack stack,int data);
//出栈
void pop_stack(Stack stack,int * pData);
//遍历
void traverse_stack(Stack stack);
//清空
void clear_stack(Stack stack);

int main(int argc, const char * argv[]) {
    
    Stack stack = init_stack();
    
    push_stack(stack, 1);
    push_stack(stack, 2);
    push_stack(stack, 3);
    push_stack(stack, 4);
    
//    traverse_stack(stack);
//    pop_stack(stack, NULL);
//    traverse_stack(stack);
    
    clear_stack(stack);
    
    return 0;
}

//初始化
Stack init_stack()
{
    Stack stack = (Stack)malloc(sizeof(Stack));
    stack->top = (Node)malloc(sizeof(Node));
    if (stack->top == NULL) {
        printf("分配内存失败");
        exit(-1);
    }else
    {
        stack->bottom = stack->top;
        stack->top->next = NULL;
    }
    
    return  stack;
}
//入栈
void push_stack(Stack stack,int data)
{
    Node new = (Node)malloc(sizeof(Node));
    new->data = data;
    //每次新建节点指向栈顶
    new->next = stack->top;
    //栈顶指向新节点
    stack->top = new;
}
//出栈
void pop_stack(Stack stack,int * pData)
{
    if (stack->top == stack->bottom) {
        printf("已经是空栈，不能出栈");
        exit(-1);
    }
    pData = &stack->top->data;
    Node p = stack->top;
    stack->top = p->next;
    free(p);
    p = NULL;
}
//遍历
void traverse_stack(Stack stack)
{
    Node p = stack->top;
    
    while (p != stack->bottom) {
        printf("%d   ",p->data);
        p = p->next;
    }
    printf("\n");
}
//清空
void clear_stack(Stack stack)
{
    if (stack->top == stack->bottom) {
        return;
    }else
    {
        Node p = stack->top;
        Node q;
        
        while (p != stack->bottom) {
            q = p->next;
            free(p);
            p = q;
        }
        stack->top = stack->bottom;
    }
}
