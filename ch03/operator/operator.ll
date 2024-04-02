; ModuleID = 'operator.c'
source_filename = "operator.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"Line 1 - c \E7\9A\84\E5\80\BC\E6\98\AF %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"Line 2 - c \E7\9A\84\E5\80\BC\E6\98\AF %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [25 x i8] c"Line 3 - c \E7\9A\84\E5\80\BC\E6\98\AF %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [25 x i8] c"Line 4 - c \E7\9A\84\E5\80\BC\E6\98\AF %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"Line 5 - c \E7\9A\84\E5\80\BC\E6\98\AF %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"Line 6 - c \E7\9A\84\E5\80\BC\E6\98\AF %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [25 x i8] c"Line 7 - c \E7\9A\84\E5\80\BC\E6\98\AF %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 21, ptr %1, align 4
  store i32 10, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  %5 = load i32, ptr %2, align 4
  %6 = add nsw i32 %4, %5
  store i32 %6, ptr %3, align 4
  %7 = load i32, ptr %3, align 4
  %8 = call signext i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef signext %7)
  %9 = load i32, ptr %1, align 4
  %10 = load i32, ptr %2, align 4
  %11 = sub nsw i32 %9, %10
  store i32 %11, ptr %3, align 4
  %12 = load i32, ptr %3, align 4
  %13 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef signext %12)
  %14 = load i32, ptr %1, align 4
  %15 = load i32, ptr %2, align 4
  %16 = mul nsw i32 %14, %15
  store i32 %16, ptr %3, align 4
  %17 = load i32, ptr %3, align 4
  %18 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef signext %17)
  %19 = load i32, ptr %1, align 4
  %20 = load i32, ptr %2, align 4
  %21 = sdiv i32 %19, %20
  store i32 %21, ptr %3, align 4
  %22 = load i32, ptr %3, align 4
  %23 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef signext %22)
  %24 = load i32, ptr %1, align 4
  %25 = load i32, ptr %2, align 4
  %26 = srem i32 %24, %25
  store i32 %26, ptr %3, align 4
  %27 = load i32, ptr %3, align 4
  %28 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef signext %27)
  %29 = load i32, ptr %1, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %1, align 4
  store i32 %29, ptr %3, align 4
  %31 = load i32, ptr %3, align 4
  %32 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef signext %31)
  %33 = load i32, ptr %1, align 4
  %34 = add nsw i32 %33, -1
  store i32 %34, ptr %1, align 4
  store i32 %33, ptr %3, align 4
  %35 = load i32, ptr %3, align 4
  %36 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef signext %35)
  ret i32 0
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
