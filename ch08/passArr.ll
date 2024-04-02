; ModuleID = 'passArr.c'
source_filename = "passArr.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"input socre: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"input n:\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Average score is %f\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local float @Average(ptr noundef %0, i32 noundef signext %1) #0 {
  %3 = alloca ptr, align 8 ; score
  %4 = alloca i32, align 4 ; n
  %5 = alloca i32, align 4 ; sum
  %6 = alloca i32, align 4 ; i
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %19, %2
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %6, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr %12, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %5, align 4
  br label %19

19:                                               ; preds = %11
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %6, align 4
  br label %7, !llvm.loop !7

22:                                               ; preds = %7
  %23 = load i32, ptr %5, align 4
  %24 = sitofp i32 %23 to float
  %25 = load i32, ptr %4, align 4
  %26 = sitofp i32 %25 to float
  %27 = fdiv float %24, %26
  ret float %27
}

; Function Attrs: noinline nounwind optnone
define dso_local void @ReadScore(ptr noundef %0, i32 noundef signext %1) #0 {
  %3 = alloca ptr, align 8 ; score
  %4 = alloca i32, align 4 ; n
  %5 = alloca i32, align 4 ; i
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = call signext i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %17, %2
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %20

11:                                               ; preds = %7
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr %12, i64 %14
  %16 = call signext i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %15)
  br label %17

17:                                               ; preds = %11
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %5, align 4
  br label %7, !llvm.loop !9

20:                                               ; preds = %7
  ret void
}

declare signext i32 @printf(ptr noundef, ...) #1

declare signext i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [40 x i32], align 4
  %4 = alloca float, align 4
  store i32 0, ptr %1, align 4 ; int n = 0;
  %5 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %6 = call signext i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %2)
  %7 = getelementptr inbounds [40 x i32], ptr %3, i64 0, i64 0
  %8 = load i32, ptr %2, align 4
  call void @ReadScore(ptr noundef %7, i32 noundef signext %8)
  %9 = getelementptr inbounds [40 x i32], ptr %3, i64 0, i64 0
  %10 = load i32, ptr %2, align 4
  %11 = call float @Average(ptr noundef %9, i32 noundef signext %10)
  store float %11, ptr %4, align 4
  %12 = load float, ptr %4, align 4
  %13 = fpext float %12 to double
  %14 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.3, double noundef %13)
  ret i32 0
}

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
!9 = distinct !{!9, !8}
