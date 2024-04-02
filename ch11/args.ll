; ModuleID = 'args.c'
source_filename = "args.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

@.str = private unnamed_addr constant [44 x i8] c"the number of command line arguments is:%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"the program name is: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"the other arguments are following:\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main(i32 noundef signext %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store i32 0, ptr %3, align 4 ; retval
  store i32 %0, ptr %4, align 4 ; int argc
  store ptr %1, ptr %5, align 8 ; char* argv[]
  %7 = load i32, ptr %4, align 4
  %8 = call signext i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef signext %7)
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds ptr, ptr %9, i64 0
  %11 = load ptr, ptr %10, align 8
  %12 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %11)
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %13, 1
  br i1 %14, label %15, label %32

15:                                               ; preds = %2
  %16 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i64 1, ptr %6, align 8
  br label %17

17:                                               ; preds = %28, %15
  %18 = load i64, ptr %6, align 8
  %19 = load i32, ptr %4, align 4
  %20 = sext i32 %19 to i64
  %21 = icmp ult i64 %18, %20
  br i1 %21, label %22, label %31

22:                                               ; preds = %17
  %23 = load ptr, ptr %5, align 8
  %24 = load i64, ptr %6, align 8
  %25 = getelementptr inbounds ptr, ptr %23, i64 %24
  %26 = load ptr, ptr %25, align 8
  %27 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %26)
  br label %28

28:                                               ; preds = %22
  %29 = load i64, ptr %6, align 8
  %30 = add i64 %29, 1
  store i64 %30, ptr %6, align 8
  br label %17, !llvm.loop !7

31:                                               ; preds = %17
  br label %32

32:                                               ; preds = %31, %2
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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
