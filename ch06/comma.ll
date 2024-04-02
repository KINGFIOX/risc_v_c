; ModuleID = 'comma.c'
source_filename = "comma.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"sum = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"b = %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main() #0 {
  %1 = alloca i32, align 4 ; retval
  store i32 0, ptr %1, align 4 
  %2 = alloca i32, align 4 ; sum=0
  %3 = alloca i32, align 4 ; n=100
  store i32 0, ptr %2, align 4 
  store i32 100, ptr %3, align 4

; 初始状态
  %4 = alloca i32, align 4
  store i32 1, ptr %4, align 4 ; i=1
  %8 = load i32, ptr %3, align 4
  %5 = alloca i32, align 4
  store i32 %8, ptr %5, align 4; j=n
  br label %9

9:                                                ; preds = %19, %0
  ; 判定
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %5, align 4
  %12 = icmp sle i32 %10, %11 ; sign less than
  br i1 %12, label %13, label %24

13:                                               ; preds = %9
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr %4, align 4
  %16 = add nsw i32 %14, %15
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %2, align 4
  br label %19

19:                                               ; preds = %13
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %4, align 4 ; i++
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %22, -1
  store i32 %23, ptr %5, align 4 ; j--
  
  ; br 无条件跳转到 label %9
  ; !llvm.loop 用于指示这个分支构成了 循环的一部分
  ; !7 = distinct !{!7, !8} ; distinct 指示这个节点是独一无二的
  ; 	这里 !7 是自引用。
  ; !8 = !{!"llvm.loop.mustprogress"} 表示 must progress ，也就是不是 死循环
  br label %9, !llvm.loop !7

24:                                               ; preds = %9
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4

  %25 = load i32, ptr %2, align 4
  %26 = call signext i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef signext %25)
  store i32 10, ptr %6, align 4
  store volatile i32 15, ptr %7, align 4
  %27 = load i32, ptr %6, align 4
  %28 = mul nsw i32 %27, 4
  %29 = load volatile i32, ptr %7, align 4
  %30 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef signext %29)
  %31 = load i32, ptr %6, align 4
  %32 = mul nsw i32 %31, 4
  store volatile i32 %32, ptr %7, align 4
  %33 = load volatile i32, ptr %7, align 4
  %34 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef signext %33)
  %35 = load i32, ptr %1, align 4
  ret i32 %35
}

declare signext i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{i32 1, !"SmallDataLimit", i32 8}
!6 = !{!"Debian clang version 16.0.6 (21)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
