; ModuleID = 'size.c'
source_filename = "size.c"
; target datalayout 
; 	e 小端存储
;	m:o mach-o 目标文件格式，常用于 macOS 或者 iOS
; 	i64:64 表示 i64 自然对齐是 64bit
;	i128:128 表示 i128 自然对齐是 128bit
;	n32:64 表示 n32(32位整数) 是本地整数类型; :64 表示: 32位整数应该按 64bit 对齐
;	S128 规定了 最大对齐(可能就是内存模数)
;		结构体的对齐，在我的这台电脑上就是: min{16, sizeof(结构体中最大的元素的 对齐要求)}
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 5, ptr %1, align 4
  ; size = sizeof(int) ，这里 sizeof 是直接计算出来了
  store i32 4, ptr %2, align 4
  ret i32 0
}

; attributes #0 定义了一组 属性， #0 表示了这一组属性的引用
;	no_inline 
;	no_unwind 函数不会抛出异常
;	opt_none 禁止对函数的优化
;	s_sp 栈保护
;	uw_table(sync) 生成一个 unwind table ，用于 异常处理 和 栈回溯
;	"frame-pointer"="non-leaf" 在 非叶函数中，保留 栈指针，以便于 回溯和调试
;		non-leaf 非叶函数。leaf 不会调用其他函数的函数
;	no-trapping-math=true 假设不会发生 数学运算的 trap (陷入xx态)
;	stack-protector-buffer-size=8 启用栈保护，当局部变量超过 8  字节的时候
;	target-cpu=apple-m1 影响了 生成的指令集和优化
;	"target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,
;		+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,
;		+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz"
;		列出了针对 cpu 的优化特性
attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

; 下面这一段代码，定义了 模块级的 meta 数据
; !0 是一个 meta 数据节点，里面有 3 个元素： i32 1, !"wchar_size", i32 4 
;	!"wchar_size" 表明，该 meta-data 节点与 wchar_size 相关 ， 也就是这里的大小是 i32 4
;	i32 1 可能是 一个枚举量 或者是 一个标志位
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}

; 这里引用了 
!llvm.module.flags = !{!0, !1, !2, !3}

!llvm.ident = !{!4}
!4 = !{!"Homebrew clang version 17.0.6"}
