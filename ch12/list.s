/*

// 定义链表节点结构体
typedef struct ListNode {
  int data;              // 数据域
  struct ListNode *next; // 指向下一个节点的指针
} ListNode;

// 定义链表结构体，这里我们的链表包含一个头结点
typedef struct LinkedList {
  ListNode *head; // 指向头结点的指针
} LinkedList;


 */

createLinkedList:                       # @createLinkedList
        addi    sp, sp, -32
        sd      ra, 24(sp)                      # 8-byte Folded Spill
        sd      s0, 16(sp)                      # 8-byte Folded Spill
        addi    s0, sp, 32

        li      a0, 8 # 创建 list
        call    malloc

        sd      a0, -32(s0)
        ld      a0, -32(s0)
        beqz    a0, .LBB0_5
        j       .LBB0_1
.LBB0_1:
        li      a0, 16
        call    malloc # 创建 node

        ld      a1, -32(s0) # 获取 list
        sd      a0, 0(a1) # list.head = node
        ld      a0, -32(s0)
        ld      a0, 0(a0)
        beqz    a0, .LBB0_3 # if (list.head)
        j       .LBB0_2
.LBB0_2:
        ld      a0, -32(s0)
        ld      a1, 0(a0) # list.head
        li      a0, 0
        sd      a0, 8(a1) # list.head.next = NULL
        j       .LBB0_4
.LBB0_3:
        ld      a0, -32(s0)
        call    free
        li      a0, 0
        sd      a0, -24(s0)
        j       .LBB0_6
.LBB0_4:
        j       .LBB0_5
.LBB0_5:
        ld      a0, -32(s0)
        sd      a0, -24(s0)
        j       .LBB0_6
.LBB0_6:
        ld      a0, -24(s0)
        ld      ra, 24(sp)                      # 8-byte Folded Reload
        ld      s0, 16(sp)                      # 8-byte Folded Reload
        addi    sp, sp, 32
        ret

insertNode:                             # @insertNode
        addi    sp, sp, -48
        sd      ra, 40(sp)                      # 8-byte Folded Spill
        sd      s0, 32(sp)                      # 8-byte Folded Spill
        addi    s0, sp, 48
        sd      a0, -24(s0)
        sw      a1, -28(s0)

        li      a0, 16
        call    malloc

        sd      a0, -40(s0)
        lw      a0, -28(s0)
        ld      a1, -40(s0)
        sw      a0, 0(a1) # node.data = data
        ld      a1, -40(s0)
        li      a0, 0
        sd      a0, 8(a1) # node.next = NULL

        ld      a0, -24(s0)
        ld      a0, 0(a0)
        sd      a0, -48(s0) # iter
        j       .LBB1_1
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
        ld      a0, -48(s0)
        ld      a0, 8(a0)
        beqz    a0, .LBB1_3
        j       .LBB1_2
.LBB1_2:                                #   in Loop: Header=BB1_1 Depth=1
        ld      a0, -48(s0)
        ld      a0, 8(a0)
        sd      a0, -48(s0)
        j       .LBB1_1
.LBB1_3:
        ld      a0, -40(s0)
        ld      a1, -48(s0)
        sd      a0, 8(a1) # iter.next = newNode

        ld      ra, 40(sp)                      # 8-byte Folded Reload
        ld      s0, 32(sp)                      # 8-byte Folded Reload
        addi    sp, sp, 48
        ret

deleteNode:                             # @deleteNode
        addi    sp, sp, -64
        sd      ra, 56(sp)                      # 8-byte Folded Spill
        sd      s0, 48(sp)                      # 8-byte Folded Spill
        addi    s0, sp, 64
        sd      a0, -24(s0)
        sw      a1, -28(s0)

        ld      a0, -24(s0)
        ld      a0, 0(a0)
        sd      a0, -40(s0)

        li      a0, 0
        sd      a0, -48(s0)
        j       .LBB2_1
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
        ld      a0, -40(s0)
        ld      a0, 8(a0) # cur.next
        li      a1, 0
        sd      a1, -64(s0)                     # 8-byte Folded Spill
        beqz    a0, .LBB2_3
        j       .LBB2_2
.LBB2_2:                                #   in Loop: Header=BB2_1 Depth=1
        ld      a0, -40(s0)
        ld      a0, 8(a0)
        lw      a0, 0(a0) # cur.next.data
        lw      a1, -28(s0)
        xor     a0, a0, a1 # 判断是否相等
        snez    a0, a0 # snez: set(dest = 1) if not zero
        sd      a0, -64(s0)                     # 8-byte Folded Spill
        j       .LBB2_3
.LBB2_3:                                #   in Loop: Header=BB2_1 Depth=1
        ld      a0, -64(s0)                     # 8-byte Folded Reload
        andi    a0, a0, 1
        beqz    a0, .LBB2_5
        j       .LBB2_4
.LBB2_4:                                #   in Loop: Header=BB2_1 Depth=1
        ld      a0, -40(s0)
        sd      a0, -48(s0) # pre = cur
        ld      a0, -40(s0)
        ld      a0, 8(a0)
        sd      a0, -40(s0) # cur = cur.next
        j       .LBB2_1
.LBB2_5: # if
        ld      a0, -40(s0)
        ld      a0, 8(a0)
        beqz    a0, .LBB2_7
        j       .LBB2_6
.LBB2_6:
        ld      a0, -40(s0)
        ld      a0, 8(a0)
        sd      a0, -56(s0)
        ld      a1, -40(s0)
        ld      a0, 8(a1)
        ld      a0, 8(a0)
        sd      a0, 8(a1)
        ld      a0, -56(s0)
        call    free

        j       .LBB2_7
.LBB2_7:
        ld      ra, 56(sp)                      # 8-byte Folded Reload
        ld      s0, 48(sp)                      # 8-byte Folded Reload
        addi    sp, sp, 64
        ret

findNode:                               # @findNode
        addi    sp, sp, -48
        sd      ra, 40(sp)                      # 8-byte Folded Spill
        sd      s0, 32(sp)                      # 8-byte Folded Spill
        addi    s0, sp, 48
        sd      a0, -24(s0)
        sw      a1, -28(s0)

        ld      a0, -24(s0)
        ld      a0, 0(a0)
        ld      a0, 8(a0)
        sd      a0, -40(s0) # cur = list.head.next
        j       .LBB3_1
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
        ld      a0, -40(s0)
        li      a1, 0
        sd      a1, -48(s0) # bool 判断的中间结果                     # 8-byte Folded Spill
        beqz    a0, .LBB3_3
        j       .LBB3_2
.LBB3_2:                                #   in Loop: Header=BB3_1 Depth=1
        ld      a0, -40(s0)
        lw      a0, 0(a0)
        lw      a1, -28(s0)
        xor     a0, a0, a1 # 常用这种方式判断两个是否相等
        snez    a0, a0
        sd      a0, -48(s0)                     # 8-byte Folded Spill
        j       .LBB3_3
.LBB3_3:                                #   in Loop: Header=BB3_1 Depth=1
        ld      a0, -48(s0)                     # 8-byte Folded Reload
        andi    a0, a0, 1
        beqz    a0, .LBB3_5
        j       .LBB3_4
.LBB3_4:                                #   in Loop: Header=BB3_1 Depth=1
        ld      a0, -40(s0)
        ld      a0, 8(a0)
        sd      a0, -40(s0)
        j       .LBB3_1
.LBB3_5:
        ld      a0, -40(s0)
        ld      ra, 40(sp)                      # 8-byte Folded Reload
        ld      s0, 32(sp)                      # 8-byte Folded Reload
        addi    sp, sp, 48
        ret

destroyLinkedList:                      # @destroyLinkedList
        addi    sp, sp, -48
        sd      ra, 40(sp)                      # 8-byte Folded Spill
        sd      s0, 32(sp)                      # 8-byte Folded Spill
        addi    s0, sp, 48
        sd      a0, -24(s0)

        ld      a0, -24(s0)
        ld      a0, 0(a0)
        sd      a0, -32(s0)
        j       .LBB4_1
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
        ld      a0, -32(s0)
        beqz    a0, .LBB4_3
        j       .LBB4_2
.LBB4_2:                                #   in Loop: Header=BB4_1 Depth=1
        ld      a0, -32(s0)
        sd      a0, -40(s0)
        ld      a0, -32(s0)
        ld      a0, 8(a0)
        sd      a0, -32(s0)
        ld      a0, -40(s0)
        call    free

        j       .LBB4_1
.LBB4_3:
        ld      a0, -24(s0)
        call    free

        ld      ra, 40(sp)                      # 8-byte Folded Reload
        ld      s0, 32(sp)                      # 8-byte Folded Reload
        addi    sp, sp, 48
        ret
