; ModuleID = 'multiIf.c'
source_filename = "multiIf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"%d %d %d\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"\E7\AD\89\E8\BE\B9\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"\E7\AD\89\E8\85\B0\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"\E7\9B\B4\E8\A7\92\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"\E4\B8\80\E8\88\AC\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"\E4\B8\89\E8\A7\92\E5\BD\A2\0A\00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\E4\B8\8D\E6\98\AF\E4\B8\89\E8\A7\92\E5\BD\A2\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %6 = call signext i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %3, ptr noundef %4, ptr noundef %5)
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = add i32 %7, %8
  %10 = load i32, ptr %5, align 4
  %11 = icmp ugt i32 %9, %10
  br i1 %11, label %12, label %98

12:                                               ; preds = %0
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %5, align 4
  %15 = add i32 %13, %14
  %16 = load i32, ptr %3, align 4
  %17 = icmp ugt i32 %15, %16
  br i1 %17, label %18, label %98

18:                                               ; preds = %12
  %19 = load i32, ptr %3, align 4
  %20 = load i32, ptr %5, align 4
  %21 = add i32 %19, %20
  %22 = load i32, ptr %4, align 4
  %23 = icmp ugt i32 %21, %22
  br i1 %23, label %24, label %98

24:                                               ; preds = %18
  store i8 1, ptr %2, align 1
  %25 = load i32, ptr %3, align 4
  %26 = load i32, ptr %4, align 4
  %27 = icmp eq i32 %25, %26
  br i1 %27, label %28, label %38

28:                                               ; preds = %24
  %29 = load i32, ptr %4, align 4
  %30 = load i32, ptr %5, align 4
  %31 = icmp eq i32 %29, %30
  br i1 %31, label %32, label %38

32:                                               ; preds = %28
  %33 = load i32, ptr %5, align 4
  %34 = load i32, ptr %3, align 4
  %35 = icmp eq i32 %33, %34
  br i1 %35, label %36, label %38

36:                                               ; preds = %32
  %37 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i8 0, ptr %2, align 1
  br label %53

38:                                               ; preds = %32, %28, %24
  %39 = load i32, ptr %3, align 4
  %40 = load i32, ptr %4, align 4
  %41 = icmp eq i32 %39, %40
  br i1 %41, label %50, label %42

42:                                               ; preds = %38
  %43 = load i32, ptr %4, align 4
  %44 = load i32, ptr %5, align 4
  %45 = icmp eq i32 %43, %44
  br i1 %45, label %50, label %46

46:                                               ; preds = %42
  %47 = load i32, ptr %5, align 4
  %48 = load i32, ptr %3, align 4
  %49 = icmp eq i32 %47, %48
  br i1 %49, label %50, label %52

50:                                               ; preds = %46, %42, %38
  %51 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i8 0, ptr %2, align 1
  br label %52

52:                                               ; preds = %50, %46
  br label %53

53:                                               ; preds = %52, %36
  %54 = load i32, ptr %3, align 4
  %55 = load i32, ptr %3, align 4
  %56 = mul i32 %54, %55
  %57 = load i32, ptr %4, align 4
  %58 = load i32, ptr %4, align 4
  %59 = mul i32 %57, %58
  %60 = add i32 %56, %59
  %61 = load i32, ptr %5, align 4
  %62 = load i32, ptr %5, align 4
  %63 = mul i32 %61, %62
  %64 = icmp eq i32 %60, %63
  br i1 %64, label %89, label %65

65:                                               ; preds = %53
  %66 = load i32, ptr %3, align 4
  %67 = load i32, ptr %3, align 4
  %68 = mul i32 %66, %67
  %69 = load i32, ptr %5, align 4
  %70 = load i32, ptr %5, align 4
  %71 = mul i32 %69, %70
  %72 = add i32 %68, %71
  %73 = load i32, ptr %4, align 4
  %74 = load i32, ptr %4, align 4
  %75 = mul i32 %73, %74
  %76 = icmp eq i32 %72, %75
  br i1 %76, label %89, label %77

77:                                               ; preds = %65
  %78 = load i32, ptr %4, align 4
  %79 = load i32, ptr %4, align 4
  %80 = mul i32 %78, %79
  %81 = load i32, ptr %5, align 4
  %82 = load i32, ptr %5, align 4
  %83 = mul i32 %81, %82
  %84 = add i32 %80, %83
  %85 = load i32, ptr %3, align 4
  %86 = load i32, ptr %3, align 4
  %87 = mul i32 %85, %86
  %88 = icmp eq i32 %84, %87
  br i1 %88, label %89, label %91

89:                                               ; preds = %77, %65, %53
  %90 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i8 0, ptr %2, align 1
  br label %91

91:                                               ; preds = %89, %77
  %92 = load i8, ptr %2, align 1
  %93 = trunc i8 %92 to i1
  br i1 %93, label %94, label %96

94:                                               ; preds = %91
  %95 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %96

96:                                               ; preds = %94, %91
  %97 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %100

98:                                               ; preds = %18, %12, %0
  %99 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %100

100:                                              ; preds = %98, %96
  %101 = load i32, ptr %1, align 4
  ret i32 %101
}

declare signext i32 @__isoc99_scanf(ptr noundef, ...) #1

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
