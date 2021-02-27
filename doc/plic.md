# RISC-V Platform-Level Interrupt Controller Specification

https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc

## Introduction

This document contains the RISC-V platform-level interrupt controller (PLIC) specification, which defines an interrupt controller specifically designed to work in the context of RISC-V systems. The PLIC multiplexes various device interrupts onto the external interrupt lines of Hart contexts, with hardware support for interrupt priorities.
This specification defines the general PLIC architecture and operation parameters. The PLIC which claimed as PLIC-Compliant standard PLIC should follow the implementations mentioned in sections below.


RISC-V平台级中断控制器

目的 ： 该规范定义了专门设计用于RISC-V系统环境的中断控制器

功能 ： PLIC在硬件支持中断优先级的情况下，将各种设备中断复用到Hart上下文的外部中断线上。


## RISC-V PLIC操作参数

中断优先级寄存器： Interrupt Priorities registers:
每个中断源的中断优先级。

中断待处理位寄存器：Interrupt Pending Bits registers:
每个中断源的中断待处理状态。

中断使能寄存器：Interrupt Enables registers:
每个上下文的中断源的使能。

优先级阈值寄存器：Priority Thresholds registers:
每个上下文的中断优先级阈值。

中断声明寄存器：Interrupt Claim registers:
用于获取每个上下文的中断源ID的寄存器。

中断完成寄存器：Interrupt Completion registers:
用于将中断完成消息发送到相关网关的寄存器。