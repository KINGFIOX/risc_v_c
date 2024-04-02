; ModuleID = 'branch.c'
source_filename = "branch.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"Line 1 - a \E7\AD\89\E4\BA\8E b\0A\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"Line 1 - a \E4\B8\8D\E7\AD\89\E4\BA\8E b\0A\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"Line 2 - a \E5\B0\8F\E4\BA\8E b\0A\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"Line 2 - a \E4\B8\8D\E5\B0\8F\E4\BA\8E b\0A\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Line 3 - a \E5\A4\A7\E4\BA\8E b\0A\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"Line 3 - a \E4\B8\8D\E5\A4\A7\E4\BA\8E b\0A\00", align 1
@.str.6 = private unnamed_addr constant [30 x i8] c"Line 4 - a \E5\B0\8F\E4\BA\8E\E6\88\96\E7\AD\89\E4\BA\8E b\0A\00", align 1
@.str.7 = private unnamed_addr constant [30 x i8] c"Line 5 - b \E5\A4\A7\E4\BA\8E\E6\88\96\E7\AD\89\E4\BA\8E a\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4 ; c
  store i32 21, ptr %2, align 4 ; a
  store i32 10, ptr %3, align 4 ; b

  %4 = alloca i32, align 4 ; retval

  %5 = load i32, ptr %2, align 4
  %6 = load i32, ptr %3, align 4
  %7 = icmp eq i32 %5, %6 ; icmp 比较指令, eq 比较的操作类型, %5 %6 两个临时变量名, %7 是 true 或者是 false
  br i1 %7, label %8, label %10 

8:                                                ; preds = %0
  %9 = call signext i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %12

10:                                               ; preds = %0
  %11 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %12

12:                                               ; preds = %10, %8
  %13 = load i32, ptr %2, align 4
  %14 = load i32, ptr %3, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %18

16:                                               ; preds = %12
  %17 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %20

18:                                               ; preds = %12
  %19 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %20

20:                                               ; preds = %18, %16
  %21 = load i32, ptr %2, align 4
  %22 = load i32, ptr %3, align 4
  %23 = icmp sgt i32 %21, %22
  br i1 %23, label %24, label %26

24:                                               ; preds = %20
  %25 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %28

26:                                               ; preds = %20
  %27 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %28

28:                                               ; preds = %26, %24
  store i32 5, ptr %2, align 4
  store i32 20, ptr %3, align 4
  %29 = load i32, ptr %2, align 4
  %30 = load i32, ptr %3, align 4
  %31 = icmp sle i32 %29, %30
  br i1 %31, label %32, label %34

32:                                               ; preds = %28
  %33 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %34

34:                                               ; preds = %32, %28
  %35 = load i32, ptr %3, align 4
  %36 = load i32, ptr %2, align 4
  %37 = icmp sge i32 %35, %36
  br i1 %37, label %38, label %40

38:                                               ; preds = %34
  %39 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %40

40:                                               ; preds = %38, %34
  %41 = load i32, ptr %1, align 4
  ret i32 %41
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
