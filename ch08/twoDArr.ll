; ModuleID = 'twoDArr.c'
source_filename = "twoDArr.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [4 x [3 x i32]], align 4 ; 创建二维数组
  store i32 0, ptr %1, align 4
  call void @llvm.memset.p0.i64(ptr align 4 %2, i8 0, i64 48, i1 false)
  %3 = getelementptr inbounds [4 x [3 x i32]], ptr %2, i32 0, i32 0 ; 二位数组
  %4 = getelementptr inbounds [3 x i32], ptr %3, i32 0, i32 0
  store i32 1, ptr %4, align 4
  %5 = getelementptr inbounds [3 x i32], ptr %3, i32 0, i32 1
  store i32 2, ptr %5, align 4
  %6 = getelementptr inbounds [3 x i32], ptr %3, i32 0, i32 2
  store i32 3, ptr %6, align 4
  %7 = getelementptr inbounds [4 x [3 x i32]], ptr %2, i32 0, i32 1
  %8 = getelementptr inbounds [3 x i32], ptr %7, i32 0, i32 0
  store i32 4, ptr %8, align 4
  %9 = getelementptr inbounds [3 x i32], ptr %7, i32 0, i32 1
  store i32 5, ptr %9, align 4
  %10 = getelementptr inbounds [4 x [3 x i32]], ptr %2, i32 0, i32 2
  %11 = getelementptr inbounds [3 x i32], ptr %10, i32 0, i32 0
  store i32 6, ptr %11, align 4
  %12 = getelementptr inbounds [4 x [3 x i32]], ptr %2, i64 0, i64 1
  %13 = getelementptr inbounds [3 x i32], ptr %12, i64 0, i64 1
  %14 = load i32, ptr %13, align 4
  %15 = call signext i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef signext %14)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

declare signext i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
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
