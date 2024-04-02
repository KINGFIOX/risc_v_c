; ModuleID = 'list.c'
source_filename = "list.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

%struct.LinkedList = type { ptr }
%struct.ListNode = type { i32, ptr }

; Function Attrs: noinline nounwind optnone
define dso_local ptr @createLinkedList() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call noalias ptr @malloc(i64 noundef 8) #3
  store ptr %3, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %6, label %22

6:                                                ; preds = %0
  %7 = call noalias ptr @malloc(i64 noundef 16) #3
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.LinkedList, ptr %8, i32 0, i32 0
  store ptr %7, ptr %9, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.LinkedList, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %19

14:                                               ; preds = %6
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.LinkedList, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds %struct.ListNode, ptr %17, i32 0, i32 1
  store ptr null, ptr %18, align 8
  br label %21

19:                                               ; preds = %6
  %20 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %20) #4
  store ptr null, ptr %1, align 8
  br label %24

21:                                               ; preds = %14
  br label %22

22:                                               ; preds = %21, %0
  %23 = load ptr, ptr %2, align 8
  store ptr %23, ptr %1, align 8
  br label %24

24:                                               ; preds = %22, %19
  %25 = load ptr, ptr %1, align 8
  ret ptr %25
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind optnone
; 
define dso_local void @insertNode(ptr noundef %0, i32 noundef signext %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = call noalias ptr @malloc(i64 noundef 16) #3
  store ptr %7, ptr %5, align 8
  %8 = load i32, ptr %4, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.ListNode, ptr %9, i32 0, i32 0
  store i32 %8, ptr %10, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.ListNode, ptr %11, i32 0, i32 1
  store ptr null, ptr %12, align 8 ; list->head->next = NULL
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.LinkedList, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %6, align 8
  br label %16

16:                                               ; preds = %21, %2
  %17 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds %struct.ListNode, ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %25

21:                                               ; preds = %16
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds %struct.ListNode, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  store ptr %24, ptr %6, align 8
  br label %16, !llvm.loop !7

25:                                               ; preds = %16
  %26 = load ptr, ptr %5, align 8
  %27 = load ptr, ptr %6, align 8
  %28 = getelementptr inbounds %struct.ListNode, ptr %27, i32 0, i32 1
  store ptr %26, ptr %28, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @deleteNode(ptr noundef %0, i32 noundef signext %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.LinkedList, ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %5, align 8
  store ptr null, ptr %6, align 8
  br label %11

11:                                               ; preds = %26, %2
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.ListNode, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %24

16:                                               ; preds = %11
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.ListNode, ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.ListNode, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = load i32, ptr %4, align 4
  %23 = icmp ne i32 %21, %22
  br label %24

24:                                               ; preds = %16, %11
  %25 = phi i1 [ false, %11 ], [ %23, %16 ]
  br i1 %25, label %26, label %31

26:                                               ; preds = %24
  %27 = load ptr, ptr %5, align 8
  store ptr %27, ptr %6, align 8
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds %struct.ListNode, ptr %28, i32 0, i32 1
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %5, align 8
  br label %11, !llvm.loop !9

31:                                               ; preds = %24
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr inbounds %struct.ListNode, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = icmp ne ptr %34, null
  br i1 %35, label %36, label %48

36:                                               ; preds = %31
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds %struct.ListNode, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  store ptr %39, ptr %7, align 8
  %40 = load ptr, ptr %5, align 8
  %41 = getelementptr inbounds %struct.ListNode, ptr %40, i32 0, i32 1
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds %struct.ListNode, ptr %42, i32 0, i32 1
  %44 = load ptr, ptr %43, align 8
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds %struct.ListNode, ptr %45, i32 0, i32 1
  store ptr %44, ptr %46, align 8
  %47 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %47) #4
  br label %48

48:                                               ; preds = %36, %31
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local ptr @findNode(ptr noundef %0, i32 noundef signext %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.LinkedList, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds %struct.ListNode, ptr %8, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %5, align 8
  br label %11

11:                                               ; preds = %22, %2
  %12 = load ptr, ptr %5, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %20

14:                                               ; preds = %11
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %struct.ListNode, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = load i32, ptr %4, align 4
  %19 = icmp ne i32 %17, %18
  br label %20

20:                                               ; preds = %14, %11
  %21 = phi i1 [ false, %11 ], [ %19, %14 ]
  br i1 %21, label %22, label %26

22:                                               ; preds = %20
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds %struct.ListNode, ptr %23, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr %5, align 8
  br label %11, !llvm.loop !10

26:                                               ; preds = %20
  %27 = load ptr, ptr %5, align 8
  ret ptr %27
}

; Function Attrs: noinline nounwind optnone
define dso_local void @destroyLinkedList(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.LinkedList, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  br label %8

8:                                                ; preds = %11, %1
  %9 = load ptr, ptr %3, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %8
  %12 = load ptr, ptr %3, align 8
  store ptr %12, ptr %4, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.ListNode, ptr %13, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %3, align 8
  %16 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %16) #4
  br label %8, !llvm.loop !11

17:                                               ; preds = %8
  %18 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %18) #4
  ret void
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { nounwind allocsize(0) }
attributes #4 = { nounwind }

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
