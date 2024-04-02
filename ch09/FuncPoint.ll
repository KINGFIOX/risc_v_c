; ModuleID = 'FuncPoint.c'
source_filename = "FuncPoint.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
; 常量的数组 [5, 2, 9, 1, 5, 6]
@__const.main.array = private unnamed_addr constant [6 x i32] [i32 5, i32 2, i32 9, i32 1, i32 5, i32 6], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Original array: \0A\00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"Sorted array in ascending order: \0A\00", align 1
@.str.3 = private unnamed_addr constant [36 x i8] c"Sorted array in descending order: \0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local zeroext i1 @ascending(i32 noundef signext %0, i32 noundef signext %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp sgt i32 %5, %6
  ret i1 %7
}

; Function Attrs: noinline nounwind optnone
define dso_local zeroext i1 @descending(i32 noundef signext %0, i32 noundef signext %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp slt i32 %5, %6
  ret i1 %7
}

; 其实可以看到一个问题: llvm ir 中的 ptr 实际上只有一种 ptr ， 在操作的时候再说明
; Function Attrs: noinline nounwind optnone
define dso_local void @sort(ptr noundef %0, i32 noundef signext %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8  ; 函数指针
  store i32 0, ptr %7, align 4
  br label %10

10:                                               ; preds = %64, %3
  %11 = load i32, ptr %7, align 4
  %12 = load i32, ptr %5, align 4
  %13 = sub nsw i32 %12, 1
  %14 = icmp slt i32 %11, %13
  br i1 %14, label %15, label %67

15:                                               ; preds = %10
  store i32 0, ptr %8, align 4
  br label %16

16:                                               ; preds = %60, %15
  %17 = load i32, ptr %8, align 4
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %7, align 4
  %20 = sub nsw i32 %18, %19
  %21 = sub nsw i32 %20, 1
  %22 = icmp slt i32 %17, %21
  br i1 %22, label %23, label %63

23:                                               ; preds = %16
  %24 = load ptr, ptr %6, align 8 ; 获取 函数指针
  %25 = load ptr, ptr %4, align 8
  %26 = load i32, ptr %8, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, ptr %25, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = load ptr, ptr %4, align 8
  %31 = load i32, ptr %8, align 4
  %32 = add nsw i32 %31, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, ptr %30, i64 %33
  %35 = load i32, ptr %34, align 4
  ; FIXME 函数指针
  %36 = call zeroext i1 %24(i32 noundef signext %29, i32 noundef signext %35)
  br i1 %36, label %37, label %59

37:                                               ; preds = %23
  %38 = load ptr, ptr %4, align 8
  %39 = load i32, ptr %8, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, ptr %38, i64 %40
  %42 = load i32, ptr %41, align 4
  store i32 %42, ptr %9, align 4
  %43 = load ptr, ptr %4, align 8
  %44 = load i32, ptr %8, align 4
  %45 = add nsw i32 %44, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, ptr %43, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = load ptr, ptr %4, align 8
  %50 = load i32, ptr %8, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, ptr %49, i64 %51
  store i32 %48, ptr %52, align 4
  %53 = load i32, ptr %9, align 4
  %54 = load ptr, ptr %4, align 8
  %55 = load i32, ptr %8, align 4
  %56 = add nsw i32 %55, 1
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, ptr %54, i64 %57
  store i32 %53, ptr %58, align 4
  br label %59

59:                                               ; preds = %37, %23
  br label %60

60:                                               ; preds = %59
  %61 = load i32, ptr %8, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %8, align 4
  br label %16, !llvm.loop !7

63:                                               ; preds = %16
  br label %64

64:                                               ; preds = %63
  %65 = load i32, ptr %7, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, ptr %7, align 4
  br label %10, !llvm.loop !9

67:                                               ; preds = %10
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @printArray(ptr noundef %0, i32 noundef signext %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %17, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %20

10:                                               ; preds = %6
  %11 = load ptr, ptr %3, align 8
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr %11, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = call signext i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef signext %15)
  br label %17

17:                                               ; preds = %10
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %5, align 4
  br label %6, !llvm.loop !10

20:                                               ; preds = %6
  %21 = call signext i32 @putchar(i32 noundef signext 10)
  ret void
}

declare signext i32 @printf(ptr noundef, ...) #1

declare signext i32 @putchar(i32 noundef signext) #1

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main() #0 {
  %1 = alloca i32, align 4 ; retval
  %2 = alloca [6 x i32], align 4 ; array
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4 ; size=4

  ; array = [5, 2, 9, 1, 5, 6]
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 @__const.main.array, i64 24, i1 false)
  store i32 6, ptr %3, align 4
  %4 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.1)

  ; printArr(array, n)
  %5 = getelementptr inbounds [6 x i32], ptr %2, i64 0, i64 0
  %6 = load i32, ptr %3, align 4
  call void @printArray(ptr noundef %5, i32 noundef signext %6)

  %7 = getelementptr inbounds [6 x i32], ptr %2, i64 0, i64 0
  %8 = load i32, ptr %3, align 4
  call void @sort(ptr noundef %7, i32 noundef signext %8, ptr noundef @ascending)

  %9 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.2)

  %10 = getelementptr inbounds [6 x i32], ptr %2, i64 0, i64 0
  %11 = load i32, ptr %3, align 4
  call void @printArray(ptr noundef %10, i32 noundef signext %11)

  %12 = getelementptr inbounds [6 x i32], ptr %2, i64 0, i64 0
  %13 = load i32, ptr %3, align 4
  call void @sort(ptr noundef %12, i32 noundef signext %13, ptr noundef @descending)

  %14 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.3)

  %15 = getelementptr inbounds [6 x i32], ptr %2, i64 0, i64 0
  %16 = load i32, ptr %3, align 4
  call void @printArray(ptr noundef %15, i32 noundef signext %16)

  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

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
!10 = distinct !{!10, !8}
