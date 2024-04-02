; ModuleID = 'sw.c'
source_filename = "sw.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

@.str = private unnamed_addr constant [30 x i8] c"please enter the expression: \00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"%d%c%d\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"%d + %d = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"%d - %d = %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"%d * %d = %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [19 x i8] c"division by zero!\0A\00", align 1
@.str.6 = private unnamed_addr constant [14 x i8] c"%d / %d = %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main() #0 {
  %1 = alloca i32, align 4

  %2 = alloca i32, align 4
  %3 = alloca i32, align 4

  %4 = alloca i8, align 1 ; char op
  store i32 0, ptr %1, align 4
  %5 = call signext i32 (ptr, ...) @printf(ptr noundef @.str)
  %6 = call signext i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %2, ptr noundef %4, ptr noundef %3)
  %7 = load i8, ptr %4, align 1
  %8 = zext i8 %7 to i32 ; zero ext 无符号拓展
  
  ; label %42 表示 default
  ; switch i32 %conv, label %sw.default [
  switch i32 %8, label %42 [
    i32 43, label %9 ; '+' == 43
    i32 45, label %16
    i32 42, label %23
    i32 47, label %30
  ]

9:                                                ; preds = %0
  %10 = load i32, ptr %2, align 4
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %2, align 4
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %12, %13
  %15 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef signext %10, i32 noundef signext %11, i32 noundef signext %14)
  br label %43

16:                                               ; preds = %0
  %17 = load i32, ptr %2, align 4
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %2, align 4
  %20 = load i32, ptr %3, align 4
  %21 = sub nsw i32 %19, %20
  %22 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef signext %17, i32 noundef signext %18, i32 noundef signext %21)
  br label %43

23:                                               ; preds = %0
  %24 = load i32, ptr %2, align 4
  %25 = load i32, ptr %3, align 4
  %26 = load i32, ptr %2, align 4
  %27 = load i32, ptr %3, align 4
  %28 = sub nsw i32 %26, %27
  %29 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef signext %24, i32 noundef signext %25, i32 noundef signext %28)
  br label %43

30:                                               ; preds = %0
  %31 = load i32, ptr %3, align 4
  %32 = icmp eq i32 0, %31
  br i1 %32, label %33, label %34

33:                                               ; preds = %30
  call void @perror(ptr noundef @.str.5)
  br label %41

34:                                               ; preds = %30
  %35 = load i32, ptr %2, align 4
  %36 = load i32, ptr %3, align 4
  %37 = load i32, ptr %2, align 4
  %38 = load i32, ptr %3, align 4
  %39 = sdiv i32 %37, %38
  %40 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef signext %35, i32 noundef signext %36, i32 noundef signext %39)
  br label %41

41:                                               ; preds = %34, %33
  br label %43

; sw.default:
42:                                               ; preds = %0
  call void @perror(ptr noundef @.str.5)
  br label %43

; epilog:
; 收场白
43:                                               ; preds = %42, %41, %23, %16, %9
  ret i32 0 ; 返回值
}

declare signext i32 @printf(ptr noundef, ...) #1

declare signext i32 @__isoc99_scanf(ptr noundef, ...) #1

declare void @perror(ptr noundef) #1

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
