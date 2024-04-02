; ModuleID = 'SelectSort.c'
source_filename = "SelectSort.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%d]\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local void @genRandArr(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  store i64 0, ptr %5, align 8
  br label %6

6:                                                ; preds = %17, %2
  %7 = load i64, ptr %5, align 8
  %8 = load i64, ptr %4, align 8
  %9 = icmp ult i64 %7, %8
  br i1 %9, label %10, label %20

10:                                               ; preds = %6
  %11 = call i64 @random() #3
  %12 = srem i64 %11, 100
  %13 = trunc i64 %12 to i32 ; random() % 100
  %14 = load ptr, ptr %3, align 8
  %15 = load i64, ptr %5, align 8
  %16 = getelementptr inbounds i32, ptr %14, i64 %15 ; &arr[i]
  store i32 %13, ptr %16, align 4
  br label %17

17:                                               ; preds = %10
  %18 = load i64, ptr %5, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr %5, align 8
  br label %6, !llvm.loop !7

20:                                               ; preds = %6
  ret void
}

; Function Attrs: nounwind
declare i64 @random() #1

; Function Attrs: noinline nounwind optnone
define dso_local void @printArr(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8 ; arr
  %4 = alloca i64, align 8 ; n
  %5 = alloca i64, align 8 ; i
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = call signext i32 @putchar(i32 noundef signext 91)
  store i64 0, ptr %5, align 8
  br label %7

7:                                                ; preds = %18, %2
  %8 = load i64, ptr %5, align 8 ; i
  %9 = load i64, ptr %4, align 8 ; n
  %10 = sub i64 %9, 1 ; n - 1
  %11 = icmp ult i64 %8, %10
  br i1 %11, label %12, label %21

12:                                               ; preds = %7
  %13 = load ptr, ptr %3, align 8
  %14 = load i64, ptr %5, align 8
  %15 = getelementptr inbounds i32, ptr %13, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = call signext i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef signext %16)
  br label %18

18:                                               ; preds = %12
  %19 = load i64, ptr %5, align 8
  %20 = add i64 %19, 1
  store i64 %20, ptr %5, align 8
  br label %7, !llvm.loop !9

21:                                               ; preds = %7
  %22 = load ptr, ptr %3, align 8
  %23 = load i64, ptr %4, align 8
  %24 = sub i64 %23, 1
  %25 = getelementptr inbounds i32, ptr %22, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef signext %26)
  ret void
}

declare signext i32 @putchar(i32 noundef signext) #2

declare signext i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind optnone
define dso_local void @swap(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca ptr, align 8 ; arr
  %5 = alloca i64, align 8 ; i
  %6 = alloca i64, align 8 ; j
  %7 = alloca i32, align 4 ; tmp
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load i64, ptr %5, align 8
  %10 = getelementptr inbounds i32, ptr %8, i64 %9
  %11 = load i32, ptr %10, align 4
  store i32 %11, ptr %7, align 4 ; tmp = arr[i]
  %12 = load ptr, ptr %4, align 8
  %13 = load i64, ptr %6, align 8
  %14 = getelementptr inbounds i32, ptr %12, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load ptr, ptr %4, align 8
  %17 = load i64, ptr %5, align 8
  %18 = getelementptr inbounds i32, ptr %16, i64 %17
  store i32 %15, ptr %18, align 4
  %19 = load i32, ptr %7, align 4
  %20 = load ptr, ptr %4, align 8
  %21 = load i64, ptr %6, align 8
  %22 = getelementptr inbounds i32, ptr %20, i64 %21
  store i32 %19, ptr %22, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @sort(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8 ; arr
  %4 = alloca i64, align 8 ; n
  %5 = alloca i64, align 8 ; i
  %6 = alloca i32, align 4 ; min
  %7 = alloca i64, align 8 ; min_index
  %8 = alloca i64, align 8 ; j
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  store i64 0, ptr %5, align 8
  br label %9

9:                                                ; preds = %43, %2
  %10 = load i64, ptr %5, align 8
  %11 = load i64, ptr %4, align 8
  %12 = icmp ult i64 %10, %11
  br i1 %12, label %13, label %46

13:                                               ; preds = %9
  store i32 2147483647, ptr %6, align 4 ; min = INT_MAX
  %14 = load i64, ptr %5, align 8
  store i64 %14, ptr %7, align 8 ; min_index = i
  %15 = load i64, ptr %5, align 8
  store i64 %15, ptr %8, align 8 ; j = i
  br label %16

16:                                               ; preds = %34, %13
  %17 = load i64, ptr %8, align 8
  %18 = load i64, ptr %4, align 8
  %19 = icmp ult i64 %17, %18
  br i1 %19, label %20, label %37

20:                                               ; preds = %16
  %21 = load i32, ptr %6, align 4
  %22 = load ptr, ptr %3, align 8
  %23 = load i64, ptr %8, align 8
  %24 = getelementptr inbounds i32, ptr %22, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = icmp sgt i32 %21, %25
  br i1 %26, label %27, label %33

27:                                               ; preds = %20
  %28 = load ptr, ptr %3, align 8
  %29 = load i64, ptr %8, align 8
  %30 = getelementptr inbounds i32, ptr %28, i64 %29
  %31 = load i32, ptr %30, align 4
  store i32 %31, ptr %6, align 4
  %32 = load i64, ptr %8, align 8
  store i64 %32, ptr %7, align 8
  br label %33

33:                                               ; preds = %27, %20
  br label %34

34:                                               ; preds = %33
  %35 = load i64, ptr %8, align 8
  %36 = add i64 %35, 1
  store i64 %36, ptr %8, align 8
  br label %16, !llvm.loop !10

37:                                               ; preds = %16
  %38 = load ptr, ptr %3, align 8
  %39 = load i64, ptr %5, align 8
  %40 = load i64, ptr %7, align 8
  call void @swap(ptr noundef %38, i64 noundef %39, i64 noundef %40)

  %41 = load ptr, ptr %3, align 8
  %42 = load i64, ptr %4, align 8
  call void @printArr(ptr noundef %41, i64 noundef %42)
  br label %43

43:                                               ; preds = %37
  %44 = load i64, ptr %5, align 8
  %45 = add i64 %44, 1
  store i64 %45, ptr %5, align 8
  br label %9, !llvm.loop !11

46:                                               ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main() #0 {
  %1 = alloca i64, align 8
  %2 = alloca [10 x i32], align 4
  store i64 10, ptr %1, align 8
  %3 = getelementptr inbounds [10 x i32], ptr %2, i64 0, i64 0
  %4 = load i64, ptr %1, align 8
  call void @genRandArr(ptr noundef %3, i64 noundef %4)
  %5 = getelementptr inbounds [10 x i32], ptr %2, i64 0, i64 0
  %6 = load i64, ptr %1, align 8
  call void @printArr(ptr noundef %5, i64 noundef %6)
  %7 = getelementptr inbounds [10 x i32], ptr %2, i64 0, i64 0
  %8 = load i64, ptr %1, align 8
  call void @sort(ptr noundef %7, i64 noundef %8)
  %9 = getelementptr inbounds [10 x i32], ptr %2, i64 0, i64 0
  %10 = load i64, ptr %1, align 8
  call void @printArr(ptr noundef %9, i64 noundef %10)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { nounwind }

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
!11 = distinct !{!11, !8}
