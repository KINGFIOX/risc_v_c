; ModuleID = 'square.c'
source_filename = "square.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"input a, b, c: \00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"%f, %f, %f\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"area = %f\0A\00", align 1

; Function Attrs: noinline nounwind optnone
attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
define dso_local signext i32 @main() #0 {
  %1 = alloca float, align 4 ; a
  %2 = alloca float, align 4 ; b
  %3 = alloca float, align 4 ; c
  %4 = alloca float, align 4 ; s
  %5 = alloca float, align 4 ; area

  %6 = call signext i32 (ptr, ...) @printf(ptr noundef @.str)
  ; 可以看到，这里是直接传递的指针
  %7 = call signext i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %1, ptr noundef %2, ptr noundef %3)

  ; s = (a + b + c) / 2
  %8 = load float, ptr %1, align 4
  %9 = load float, ptr %2, align 4
  %10 = fadd float %8, %9
  %11 = load float, ptr %3, align 4
  %12 = fadd float %10, %11
  %13 = fdiv float %12, 2.000000e+00
  store float %13, ptr %4, align 4

  ; area = sqrt(s * (s - a) * (s - b) * (s - c))
  %14 = load float, ptr %4, align 4
  %15 = load float, ptr %4, align 4
  %16 = load float, ptr %1, align 4
  %17 = fsub float %15, %16
  %18 = fmul float %14, %17
  %19 = load float, ptr %4, align 4
  %20 = load float, ptr %2, align 4
  %21 = fsub float %19, %20
  %22 = fmul float %18, %21
  %23 = load float, ptr %4, align 4
  %24 = load float, ptr %3, align 4
  %25 = fsub float %23, %24
  %26 = fmul float %22, %25
  %27 = fpext float %26 to double ; n_ext ， n 就是整数的意思，ext 就是拓展；fp_ext
  %28 = call double @sqrt(double noundef %27) #3
  %29 = fptrunc double %28 to float ; fp_truncation 
  store float %29, ptr %5, align 4

  %30 = load float, ptr %5, align 4
  %31 = fpext float %30 to double
  %32 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %31)
  ret i32 0
}

attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
declare signext i32 @printf(ptr noundef, ...) #1
declare signext i32 @__isoc99_scanf(ptr noundef, ...) #1

declare double @sqrt(double noundef) #2
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

; Function Attrs: nounwind
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
