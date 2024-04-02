; ModuleID = 'fib_iter.c'
source_filename = "fib_iter.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"f(20) = %ld\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local i64 @fib(i32 noundef signext %0) #0 {
  %2 = alloca i32, align 4 ; 
  %3 = alloca ptr, align 8 ; 给 %3 分配指针变量
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4 ; 保存参数

  %6 = load i32, ptr %2, align 4 ; 获取参数 n
  %7 = add nsw i32 %6, 1 ; no signed wrap 表示 相加不会溢出
  %8 = zext i32 %7 to i64
  %9 = call ptr @llvm.stacksave() ; %9 = llvm.stacksave 保存当前栈帧的状态，因为我们这里是 arr[n+1]
  ; 这需要调整 当前栈的大小
  store ptr %9, ptr %3, align 8

  ; i64 是 元素的大小; i64 x %8(n+1) ; 对齐是 8B
  %10 = alloca i64, i64 %8, align 8
  store i64 %8, ptr %4, align 8
  ; get_element_ptr(gep) 指令的全名是: getelementptr inbounds
  ; inbounds 关键字指示：如果下标越界，将会无定义。如果没有 inbounds 的话，编译器需要假设指针会越界，这限制了 优化的可能
  ; getelementptr inbounds <元素类型>, <访问内存>, <访问下标> -> &arr[n]
  %11 = getelementptr inbounds i64, ptr %10, i64 0

  store i64 0, ptr %11, align 8
  %12 = getelementptr inbounds i64, ptr %10, i64 1

  store i64 1, ptr %12, align 8 ; arr[1] = 1
  store i32 2, ptr %5, align 4 ; int i = 2
  br label %13

; for.cond
13:                                               ; preds = %32, %1
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %2, align 4
  %16 = icmp sle i32 %14, %15
  br i1 %16, label %17, label %35

; for.body
17:                                               ; preds = %13
  %18 = load i32, ptr %5, align 4
  %19 = sub nsw i32 %18, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i64, ptr %10, i64 %20
  %22 = load i64, ptr %21, align 8 ; arr[i-1]

  %23 = load i32, ptr %5, align 4
  %24 = sub nsw i32 %23, 2
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i64, ptr %10, i64 %25
  %27 = load i64, ptr %26, align 8 ; arr[i-2]

  %28 = add nsw i64 %22, %27
  %29 = load i32, ptr %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i64, ptr %10, i64 %30
  store i64 %28, ptr %31, align 8 ; arr[i] = arr[i-1] + arr[i-2]
  br label %32

32:                                               ; preds = %17
  %33 = load i32, ptr %5, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %5, align 4
  br label %13, !llvm.loop !7

35:                                               ; preds = %13
  %36 = load i32, ptr %2, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i64, ptr %10, i64 %37
  %39 = load i64, ptr %38, align 8
  %40 = load ptr, ptr %3, align 8
  call void @llvm.stackrestore(ptr %40)
  ret i64 %39
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #1

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  %3 = call i64 @fib(i32 noundef signext 20)
  store i64 %3, ptr %2, align 8
  %4 = load i64, ptr %2, align 8
  %5 = call signext i32 (ptr, ...) @printf(ptr noundef @.str, i64 noundef %4)
  ret i32 0
}

declare signext i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

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
