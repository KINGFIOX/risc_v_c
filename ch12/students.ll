; ModuleID = 'students.c'
source_filename = "students.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

%struct.student = type { i64, [10 x i8], i8, %struct.date, [4 x i32] }
%struct.date = type { i32, i32, i32 } ; 声明结构体

; Function Attrs: noinline nounwind optnone
; ptr noalias sret(%struct.student)
; %0 表示返回的 ptr ，这里很有趣：llvm 将返回结构体改成了: 返回 ptr
define dso_local void @changeSex(ptr noalias sret(%struct.student) align 8 %0, ptr noundef %1, i32 noundef signext %2, i32 noundef signext %3) #0 {
  %5 = alloca ptr, align 8 ; retval
  %6 = alloca i32, align 4 ; n
  %7 = alloca i32, align 4 ; m
  store ptr %0, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  ; llvm.memcpy(dest, src, 64, false)
  ; 最后一个参数是: 是否 volatile
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %0, ptr align 8 %1, i64 48, i1 false)
  %8 = getelementptr inbounds %struct.student, ptr %0, i32 0, i32 2
  store i8 10, ptr %8, align 2
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-e,-experimental-zawrs,-experimental-zca,-experimental-zcd,-experimental-zcf,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xtheadvdot,-xventanacondops,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{i32 1, !"SmallDataLimit", i32 8}
!6 = !{!"Debian clang version 16.0.6 (21)"}
