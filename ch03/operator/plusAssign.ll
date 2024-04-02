; ModuleID = 'plusAssign.c'
source_filename = "plusAssign.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

@.str = private unnamed_addr constant [45 x i8] c"Line 1 - =  \E8\BF\90\E7\AE\97\E7\AC\A6\E5\AE\9E\E4\BE\8B\EF\BC\8Cc \E7\9A\84\E5\80\BC = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c"Line 2 - += \E8\BF\90\E7\AE\97\E7\AC\A6\E5\AE\9E\E4\BE\8B\EF\BC\8Cc \E7\9A\84\E5\80\BC = %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main() #0 {
  %1 = alloca i32, align 4 ; a
  %2 = alloca i32, align 4 ; b
  store i32 21, ptr %1, align 4 ; int a = 21

  %3 = load i32, ptr %1, align 4
  store i32 %3, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = call signext i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef signext %4)

  %6 = load i32, ptr %1, align 4
  %7 = load i32, ptr %2, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, ptr %2, align 4
  %9 = load i32, ptr %2, align 4
  %10 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef signext %9)

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
