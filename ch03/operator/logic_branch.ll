; ModuleID = 'logic_branch.c'
source_filename = "logic_branch.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Line 1 - \E6\9D\A1\E4\BB\B6\E4\B8\BA\E7\9C\9F\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"Line 2 - \E6\9D\A1\E4\BB\B6\E4\B8\BA\E7\9C\9F\0A\00", align 1
@.str.2 = private unnamed_addr constant [23 x i8] c"Line 3 - \E6\9D\A1\E4\BB\B6\E4\B8\BA\E7\9C\9F\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"Line 3 - \E6\9D\A1\E4\BB\B6\E4\B8\BA\E5\81\87\0A\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"Line 4 - \E6\9D\A1\E4\BB\B6\E4\B8\BA\E7\9C\9F\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 5, ptr %2, align 4
  store i32 20, ptr %3, align 4
  %5 = load i32, ptr %2, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %12

7:                                                ; preds = %0
  %8 = load i32, ptr %3, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  %11 = call signext i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %12

12:                                               ; preds = %10, %7, %0
  %13 = load i32, ptr %2, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %18, label %15

15:                                               ; preds = %12
  %16 = load i32, ptr %3, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %20

18:                                               ; preds = %15, %12
  %19 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %20

20:                                               ; preds = %18, %15
  store i32 0, ptr %2, align 4
  store i32 10, ptr %3, align 4
  %21 = load i32, ptr %2, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %28

23:                                               ; preds = %20
  %24 = load i32, ptr %3, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %28

26:                                               ; preds = %23
  %27 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %30

28:                                               ; preds = %23, %20
  %29 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %30

30:                                               ; preds = %28, %26
  %31 = load i32, ptr %2, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %36

33:                                               ; preds = %30
  %34 = load i32, ptr %3, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %38, label %36

36:                                               ; preds = %33, %30
  %37 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %38

38:                                               ; preds = %36, %33
  %39 = load i32, ptr %1, align 4
  ret i32 %39
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
