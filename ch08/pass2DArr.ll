; ModuleID = 'pass2DArr.c'
source_filename = "pass2DArr.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define dso_local void @AverforStud(ptr noundef %0, ptr noundef %1, ptr noundef %2, i64 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store i64 %3, ptr %8, align 8
  store i64 0, ptr %9, align 8
  br label %11

11:                                               ; preds = %47, %4
  %12 = load i64, ptr %9, align 8
  %13 = load i64, ptr %8, align 8
  %14 = icmp ult i64 %12, %13
  br i1 %14, label %15, label %50

15:                                               ; preds = %11
  store i64 0, ptr %10, align 8
  br label %16

16:                                               ; preds = %34, %15
  %17 = load i64, ptr %9, align 8
  %18 = icmp ult i64 %17, 5
  br i1 %18, label %19, label %37

19:                                               ; preds = %16
  %20 = load ptr, ptr %6, align 8
  %21 = load i64, ptr %9, align 8
  %22 = getelementptr inbounds i32, ptr %20, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load ptr, ptr %5, align 8
  %25 = load i64, ptr %9, align 8
  %26 = getelementptr inbounds [5 x i32], ptr %24, i64 %25
  %27 = load i64, ptr %10, align 8
  %28 = getelementptr inbounds [5 x i32], ptr %26, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = add nsw i32 %23, %29
  %31 = load ptr, ptr %6, align 8
  %32 = load i64, ptr %9, align 8
  %33 = getelementptr inbounds i32, ptr %31, i64 %32
  store i32 %30, ptr %33, align 4
  br label %34

34:                                               ; preds = %19
  %35 = load i64, ptr %9, align 8
  %36 = add i64 %35, 1
  store i64 %36, ptr %9, align 8
  br label %16, !llvm.loop !7

37:                                               ; preds = %16
  %38 = load ptr, ptr %6, align 8
  %39 = load i64, ptr %9, align 8
  %40 = getelementptr inbounds i32, ptr %38, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = sitofp i32 %41 to float
  %43 = fdiv float %42, 5.000000e+00
  %44 = load ptr, ptr %7, align 8
  %45 = load i64, ptr %9, align 8
  %46 = getelementptr inbounds float, ptr %44, i64 %45
  store float %43, ptr %46, align 4
  br label %47

47:                                               ; preds = %37
  %48 = load i64, ptr %9, align 8
  %49 = add i64 %48, 1
  store i64 %49, ptr %9, align 8
  br label %11, !llvm.loop !9

50:                                               ; preds = %11
  ret void
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

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
