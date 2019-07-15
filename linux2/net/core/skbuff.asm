
skbuff.o:     file format elf32-tradbigmips


Disassembly of section .text.sock_pipe_buf_get:

00000000 <sock_pipe_buf_get>:
   0:	8ca50000 	lw	a1,0(a1)
   4:	8ca20000 	lw	v0,0(a1)
   8:	30428000 	andi	v0,v0,0x8000
   c:	10400002 	beqz	v0,18 <sock_pipe_buf_get+0x18>
  10:	00000000 	nop
  14:	8ca5000c 	lw	a1,12(a1)
  18:	8ca20004 	lw	v0,4(a1)
  1c:	c0a20004 	ll	v0,4(a1)
  20:	24420001 	addiu	v0,v0,1
  24:	e0a20004 	sc	v0,4(a1)
  28:	10400003 	beqz	v0,38 <sock_pipe_buf_get+0x38>
  2c:	00000000 	nop
  30:	03e00008 	jr	ra
  34:	00000000 	nop
  38:	1000fff8 	b	1c <sock_pipe_buf_get+0x1c>
  3c:	00000000 	nop

Disassembly of section .text.sock_pipe_buf_steal:

00000000 <sock_pipe_buf_steal>:
   0:	03e00008 	jr	ra
   4:	24020001 	li	v0,1

Disassembly of section .text.skb_add_rx_frag:

00000000 <skb_add_rx_frag>:
   0:	8c8300a4 	lw	v1,164(a0)
   4:	8fa90010 	lw	t1,16(sp)
   8:	00054080 	sll	t0,a1,0x2
   c:	00051100 	sll	v0,a1,0x4
  10:	00481023 	subu	v0,v0,t0
  14:	00621821 	addu	v1,v1,v0
  18:	ac660030 	sw	a2,48(v1)
  1c:	ac670034 	sw	a3,52(v1)
  20:	ac690038 	sw	t1,56(v1)
  24:	8c8200a4 	lw	v0,164(a0)
  28:	24a50001 	addiu	a1,a1,1
  2c:	a4450000 	sh	a1,0(v0)
  30:	8c830050 	lw	v1,80(a0)
  34:	8c850054 	lw	a1,84(a0)
  38:	8c8200b0 	lw	v0,176(a0)
  3c:	00691821 	addu	v1,v1,t1
  40:	00a92821 	addu	a1,a1,t1
  44:	00491021 	addu	v0,v0,t1
  48:	ac8200b0 	sw	v0,176(a0)
  4c:	ac830050 	sw	v1,80(a0)
  50:	03e00008 	jr	ra
  54:	ac850054 	sw	a1,84(a0)

Disassembly of section .text.skb_prepare_seq_read:

00000000 <skb_prepare_seq_read>:
   0:	ace50000 	sw	a1,0(a3)
   4:	ace60004 	sw	a2,4(a3)
   8:	ace40010 	sw	a0,16(a3)
   c:	ace00018 	sw	zero,24(a3)
  10:	ace40014 	sw	a0,20(a3)
  14:	ace0000c 	sw	zero,12(a3)
  18:	03e00008 	jr	ra
  1c:	ace00008 	sw	zero,8(a3)

Disassembly of section .text.skb_seq_read:

00000000 <skb_seq_read>:
   0:	8cc30000 	lw	v1,0(a2)
   4:	8cc20004 	lw	v0,4(a2)
   8:	0083c021 	addu	t8,a0,v1
   c:	0302102b 	sltu	v0,t8,v0
  10:	10400082 	beqz	v0,21c <skb_seq_read+0x21c>
  14:	00a0c821 	move	t9,a1
  18:	8ccc0014 	lw	t4,20(a2)
  1c:	8cc5000c 	lw	a1,12(a2)
  20:	8d820050 	lw	v0,80(t4)
  24:	8d840054 	lw	a0,84(t4)
  28:	00a21021 	addu	v0,a1,v0
  2c:	00443823 	subu	a3,v0,a0
  30:	0307182b 	sltu	v1,t8,a3
  34:	1060005b 	beqz	v1,1a4 <skb_seq_read+0x1a4>
  38:	03807821 	move	t7,gp
  3c:	8ccb0018 	lw	t3,24(a2)
  40:	11600078 	beqz	t3,224 <skb_seq_read+0x224>
  44:	01602021 	move	a0,t3
  48:	8cc50008 	lw	a1,8(a2)
  4c:	14a00003 	bnez	a1,5c <skb_seq_read+0x5c>
  50:	00a01821 	move	v1,a1
  54:	1160006d 	beqz	t3,20c <skb_seq_read+0x20c>
  58:	00000000 	nop
  5c:	8d8900a4 	lw	t1,164(t4)
  60:	95220000 	lhu	v0,0(t1)
  64:	0062102b 	sltu	v0,v1,v0
  68:	10400036 	beqz	v0,144 <skb_seq_read+0x144>
  6c:	00036900 	sll	t5,v1,0x4
  70:	00037080 	sll	t6,v1,0x2
  74:	01ae1023 	subu	v0,t5,t6
  78:	01221021 	addu	v0,t1,v0
  7c:	8c430038 	lw	v1,56(v0)
  80:	8cc8000c 	lw	t0,12(a2)
  84:	01035021 	addu	t2,t0,v1
  88:	030a102b 	sltu	v0,t8,t2
  8c:	14400021 	bnez	v0,114 <skb_seq_read+0x114>
  90:	00000000 	nop
  94:	1160000a 	beqz	t3,c0 <skb_seq_read+0xc0>
  98:	24a50001 	addiu	a1,a1,1
  9c:	8de20014 	lw	v0,20(t7)
  a0:	2442ffff 	addiu	v0,v0,-1
  a4:	ade20014 	sw	v0,20(t7)
  a8:	8cc8000c 	lw	t0,12(a2)
  ac:	8cc50008 	lw	a1,8(a2)
  b0:	8ccc0014 	lw	t4,20(a2)
  b4:	acc00018 	sw	zero,24(a2)
  b8:	00005821 	move	t3,zero
  bc:	24a50001 	addiu	a1,a1,1
  c0:	01ae1023 	subu	v0,t5,t6
  c4:	01221021 	addu	v0,t1,v0
  c8:	acc50008 	sw	a1,8(a2)
  cc:	8c430038 	lw	v1,56(v0)
  d0:	00052080 	sll	a0,a1,0x2
  d4:	00053900 	sll	a3,a1,0x4
  d8:	00684021 	addu	t0,v1,t0
  dc:	acc8000c 	sw	t0,12(a2)
  e0:	8d8900a4 	lw	t1,164(t4)
  e4:	00e41823 	subu	v1,a3,a0
  e8:	00807021 	move	t6,a0
  ec:	95220000 	lhu	v0,0(t1)
  f0:	01231821 	addu	v1,t1,v1
  f4:	00a2102b 	sltu	v0,a1,v0
  f8:	10400012 	beqz	v0,144 <skb_seq_read+0x144>
  fc:	00e06821 	move	t5,a3
 100:	8c620038 	lw	v0,56(v1)
 104:	01025021 	addu	t2,t0,v0
 108:	030a182b 	sltu	v1,t8,t2
 10c:	1060ffe1 	beqz	v1,94 <skb_seq_read+0x94>
 110:	01602021 	move	a0,t3
 114:	11600026 	beqz	t3,1b0 <skb_seq_read+0x1b0>
 118:	00000000 	nop
 11c:	01ae1823 	subu	v1,t5,t6
 120:	01231821 	addu	v1,t1,v1
 124:	8c620034 	lw	v0,52(v1)
 128:	01582823 	subu	a1,t2,t8
 12c:	00481023 	subu	v0,v0,t0
 130:	00581021 	addu	v0,v0,t8
 134:	00821021 	addu	v0,a0,v0
 138:	af220000 	sw	v0,0(t9)
 13c:	03e00008 	jr	ra
 140:	00a01021 	move	v0,a1
 144:	11600006 	beqz	t3,160 <skb_seq_read+0x160>
 148:	00000000 	nop
 14c:	8de20014 	lw	v0,20(t7)
 150:	2442ffff 	addiu	v0,v0,-1
 154:	ade20014 	sw	v0,20(t7)
 158:	8ccc0014 	lw	t4,20(a2)
 15c:	acc00018 	sw	zero,24(a2)
 160:	8cc20010 	lw	v0,16(a2)
 164:	104c0022 	beq	v0,t4,1f0 <skb_seq_read+0x1f0>
 168:	00000000 	nop
 16c:	8d820000 	lw	v0,0(t4)
 170:	1040fff2 	beqz	v0,13c <skb_seq_read+0x13c>
 174:	00002821 	move	a1,zero
 178:	acc20014 	sw	v0,20(a2)
 17c:	acc00008 	sw	zero,8(a2)
 180:	8ccc0014 	lw	t4,20(a2)
 184:	8cc5000c 	lw	a1,12(a2)
 188:	8d820050 	lw	v0,80(t4)
 18c:	8d840054 	lw	a0,84(t4)
 190:	00a21021 	addu	v0,a1,v0
 194:	00443823 	subu	a3,v0,a0
 198:	0307182b 	sltu	v1,t8,a3
 19c:	1460ffa7 	bnez	v1,3c <skb_seq_read+0x3c>
 1a0:	00000000 	nop
 1a4:	8ccb0018 	lw	t3,24(a2)
 1a8:	08000012 	j	48 <skb_seq_read+0x48>
			1a8: R_MIPS_26	.text.skb_seq_read
 1ac:	01602021 	move	a0,t3
 1b0:	8f840014 	lw	a0,20(gp)
 1b4:	01ae1023 	subu	v0,t5,t6
 1b8:	01221021 	addu	v0,t1,v0
 1bc:	24840001 	addiu	a0,a0,1
 1c0:	8c430030 	lw	v1,48(v0)
 1c4:	af840014 	sw	a0,20(gp)
 1c8:	3c020000 	lui	v0,0x0
			1c8: R_MIPS_HI16	mem_map
 1cc:	8c440000 	lw	a0,0(v0)
			1cc: R_MIPS_LO16	mem_map
 1d0:	3c028000 	lui	v0,0x8000
 1d4:	8cc8000c 	lw	t0,12(a2)
 1d8:	00641823 	subu	v1,v1,a0
 1dc:	00031943 	sra	v1,v1,0x5
 1e0:	00031b00 	sll	v1,v1,0xc
 1e4:	00622021 	addu	a0,v1,v0
 1e8:	08000047 	j	11c <skb_seq_read+0x11c>
			1e8: R_MIPS_26	.text.skb_seq_read
 1ec:	acc40018 	sw	a0,24(a2)
 1f0:	8d8200a4 	lw	v0,164(t4)
 1f4:	8c420010 	lw	v0,16(v0)
 1f8:	1040ffdc 	beqz	v0,16c <skb_seq_read+0x16c>
 1fc:	00000000 	nop
 200:	acc20014 	sw	v0,20(a2)
 204:	08000060 	j	180 <skb_seq_read+0x180>
			204: R_MIPS_26	.text.skb_seq_read
 208:	acc00008 	sw	zero,8(a2)
 20c:	acc7000c 	sw	a3,12(a2)
 210:	01601821 	move	v1,t3
 214:	08000017 	j	5c <skb_seq_read+0x5c>
			214: R_MIPS_26	.text.skb_seq_read
 218:	00002021 	move	a0,zero
 21c:	0800004f 	j	13c <skb_seq_read+0x13c>
			21c: R_MIPS_26	.text.skb_seq_read
 220:	00002821 	move	a1,zero
 224:	8d8200ac 	lw	v0,172(t4)
 228:	03051823 	subu	v1,t8,a1
 22c:	00f82823 	subu	a1,a3,t8
 230:	00431021 	addu	v0,v0,v1
 234:	0800004f 	j	13c <skb_seq_read+0x13c>
			234: R_MIPS_26	.text.skb_seq_read
 238:	af220000 	sw	v0,0(t9)

Disassembly of section .text.skb_abort_seq_read:

00000000 <skb_abort_seq_read>:
   0:	8c820018 	lw	v0,24(a0)
   4:	10400004 	beqz	v0,18 <skb_abort_seq_read+0x18>
   8:	00000000 	nop
   c:	8f820014 	lw	v0,20(gp)
  10:	2442ffff 	addiu	v0,v0,-1
  14:	af820014 	sw	v0,20(gp)
  18:	03e00008 	jr	ra
  1c:	00000000 	nop

Disassembly of section .text.skb_ts_get_next_block:

00000000 <skb_ts_get_next_block>:
   0:	08000000 	j	0 <skb_ts_get_next_block>
			0: R_MIPS_26	skb_seq_read
   4:	24e60004 	addiu	a2,a3,4

Disassembly of section .text.skb_ts_finish:

00000000 <skb_ts_finish>:
   0:	8ca2001c 	lw	v0,28(a1)
   4:	10400004 	beqz	v0,18 <skb_ts_finish+0x18>
   8:	00000000 	nop
   c:	8f820014 	lw	v0,20(gp)
  10:	2442ffff 	addiu	v0,v0,-1
  14:	af820014 	sw	v0,20(gp)
  18:	03e00008 	jr	ra
  1c:	00000000 	nop

Disassembly of section .text.skb_find_text:

00000000 <skb_find_text>:
   0:	27bdffd8 	addiu	sp,sp,-40
   4:	afb20018 	sw	s2,24(sp)
   8:	8fb20038 	lw	s2,56(sp)
   c:	3c020000 	lui	v0,0x0
			c: R_MIPS_HI16	.text.skb_ts_get_next_block
  10:	3c030000 	lui	v1,0x0
			10: R_MIPS_HI16	.text.skb_ts_finish
  14:	afb40020 	sw	s4,32(sp)
  18:	24420000 	addiu	v0,v0,0
			18: R_MIPS_LO16	.text.skb_ts_get_next_block
  1c:	00a0a021 	move	s4,a1
  20:	24630000 	addiu	v1,v1,0
			20: R_MIPS_LO16	.text.skb_ts_finish
  24:	26450004 	addiu	a1,s2,4
  28:	afb3001c 	sw	s3,28(sp)
  2c:	afb10014 	sw	s1,20(sp)
  30:	afb00010 	sw	s0,16(sp)
  34:	afbf0024 	sw	ra,36(sp)
  38:	ace20008 	sw	v0,8(a3)
  3c:	ace3000c 	sw	v1,12(a3)
  40:	aca40010 	sw	a0,16(a1)
  44:	aca40014 	sw	a0,20(a1)
  48:	aca00018 	sw	zero,24(a1)
  4c:	aca60004 	sw	a2,4(a1)
  50:	aca0000c 	sw	zero,12(a1)
  54:	aca00008 	sw	zero,8(a1)
  58:	ae540004 	sw	s4,4(s2)
  5c:	ae400000 	sw	zero,0(s2)
  60:	8ce20000 	lw	v0,0(a3)
  64:	00e02021 	move	a0,a3
  68:	02402821 	move	a1,s2
  6c:	8c430008 	lw	v1,8(v0)
  70:	00e08821 	move	s1,a3
  74:	0060f809 	jalr	v1
  78:	00c09821 	move	s3,a2
  7c:	00408021 	move	s0,v0
  80:	8e22000c 	lw	v0,12(s1)
  84:	10400003 	beqz	v0,94 <skb_find_text+0x94>
  88:	02202021 	move	a0,s1
  8c:	0040f809 	jalr	v0
  90:	02402821 	move	a1,s2
  94:	02741023 	subu	v0,s3,s4
  98:	8fbf0024 	lw	ra,36(sp)
  9c:	0050102b 	sltu	v0,v0,s0
  a0:	2403ffff 	li	v1,-1
  a4:	0062800b 	movn	s0,v1,v0
  a8:	02001021 	move	v0,s0
  ac:	8fb40020 	lw	s4,32(sp)
  b0:	8fb3001c 	lw	s3,28(sp)
  b4:	8fb20018 	lw	s2,24(sp)
  b8:	8fb10014 	lw	s1,20(sp)
  bc:	8fb00010 	lw	s0,16(sp)
  c0:	03e00008 	jr	ra
  c4:	27bd0028 	addiu	sp,sp,40

Disassembly of section .text.sock_rmem_free:

00000000 <sock_rmem_free>:
   0:	8c8300b0 	lw	v1,176(a0)
   4:	8c820010 	lw	v0,16(a0)
   8:	c0440064 	ll	a0,100(v0)
   c:	00832023 	subu	a0,a0,v1
  10:	e0440064 	sc	a0,100(v0)
  14:	10800003 	beqz	a0,24 <sock_rmem_free+0x24>
  18:	00000000 	nop
  1c:	03e00008 	jr	ra
  20:	00000000 	nop
  24:	1000fff8 	b	8 <sock_rmem_free+0x8>
  28:	00000000 	nop

Disassembly of section .text.__skb_warn_lro_forwarding:

00000000 <__skb_warn_lro_forwarding>:
   0:	27bdffe8 	addiu	sp,sp,-24
   4:	afb00010 	sw	s0,16(sp)
   8:	afbf0014 	sw	ra,20(sp)
   c:	0c000000 	jal	0 <__skb_warn_lro_forwarding>
			c: R_MIPS_26	net_ratelimit
  10:	00808021 	move	s0,a0
  14:	14400004 	bnez	v0,28 <__skb_warn_lro_forwarding+0x28>
  18:	8fbf0014 	lw	ra,20(sp)
  1c:	8fb00010 	lw	s0,16(sp)
  20:	03e00008 	jr	ra
  24:	27bd0018 	addiu	sp,sp,24
  28:	8e050014 	lw	a1,20(s0)
  2c:	3c040000 	lui	a0,0x0
			2c: R_MIPS_HI16	$LC0
  30:	8fb00010 	lw	s0,16(sp)
  34:	24840000 	addiu	a0,a0,0
			34: R_MIPS_LO16	$LC0
  38:	08000000 	j	0 <__skb_warn_lro_forwarding>
			38: R_MIPS_26	printk
  3c:	27bd0018 	addiu	sp,sp,24

Disassembly of section .text.skb_partial_csum_set:

00000000 <skb_partial_csum_set>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb20018 	sw	s2,24(sp)
   8:	afb10014 	sw	s1,20(sp)
   c:	afb00010 	sw	s0,16(sp)
  10:	afbf001c 	sw	ra,28(sp)
  14:	00808021 	move	s0,a0
  18:	8e030054 	lw	v1,84(s0)
  1c:	8c840050 	lw	a0,80(a0)
  20:	30b1ffff 	andi	s1,a1,0xffff
  24:	00831823 	subu	v1,a0,v1
  28:	0071102b 	sltu	v0,v1,s1
  2c:	14400017 	bnez	v0,8c <skb_partial_csum_set+0x8c>
  30:	30d2ffff 	andi	s2,a2,0xffff
  34:	2463fffe 	addiu	v1,v1,-2
  38:	02511021 	addu	v0,s2,s1
  3c:	0062102b 	sltu	v0,v1,v0
  40:	14400012 	bnez	v0,8c <skb_partial_csum_set+0x8c>
  44:	24020003 	li	v0,3
  48:	8e0300ac 	lw	v1,172(s0)
  4c:	8e0500a8 	lw	a1,168(s0)
  50:	8e040064 	lw	a0,100(s0)
  54:	00651823 	subu	v1,v1,a1
  58:	02231821 	addu	v1,s1,v1
  5c:	7c44ef04 	ins	a0,v0,0x1c,0x2
  60:	a603005c 	sh	v1,92(s0)
  64:	a612005e 	sh	s2,94(s0)
  68:	ae040064 	sw	a0,100(s0)
  6c:	24030001 	li	v1,1
  70:	8fbf001c 	lw	ra,28(sp)
  74:	00601021 	move	v0,v1
  78:	8fb20018 	lw	s2,24(sp)
  7c:	8fb10014 	lw	s1,20(sp)
  80:	8fb00010 	lw	s0,16(sp)
  84:	03e00008 	jr	ra
  88:	27bd0020 	addiu	sp,sp,32
  8c:	0c000000 	jal	0 <skb_partial_csum_set>
			8c: R_MIPS_26	net_ratelimit
  90:	00000000 	nop
  94:	1040fff6 	beqz	v0,70 <skb_partial_csum_set+0x70>
  98:	00001821 	move	v1,zero
  9c:	8e020054 	lw	v0,84(s0)
  a0:	8e070050 	lw	a3,80(s0)
  a4:	3c040000 	lui	a0,0x0
			a4: R_MIPS_HI16	$LC1
  a8:	24840000 	addiu	a0,a0,0
			a8: R_MIPS_LO16	$LC1
  ac:	00e23823 	subu	a3,a3,v0
  b0:	02202821 	move	a1,s1
  b4:	0c000000 	jal	0 <skb_partial_csum_set>
			b4: R_MIPS_26	printk
  b8:	02403021 	move	a2,s2
  bc:	0800001c 	j	70 <skb_partial_csum_set+0x70>
			bc: R_MIPS_26	.text.skb_partial_csum_set
  c0:	00001821 	move	v1,zero

Disassembly of section .text.skb_trim:

00000000 <skb_trim>:
   0:	8c820050 	lw	v0,80(a0)
   4:	00a2102b 	sltu	v0,a1,v0
   8:	10400008 	beqz	v0,2c <skb_trim+0x2c>
   c:	00000000 	nop
  10:	8c820054 	lw	v0,84(a0)
  14:	14400007 	bnez	v0,34 <skb_trim+0x34>
  18:	00000000 	nop
  1c:	8c8200ac 	lw	v0,172(a0)
  20:	ac850050 	sw	a1,80(a0)
  24:	00451021 	addu	v0,v0,a1
  28:	ac8200a0 	sw	v0,160(a0)
  2c:	03e00008 	jr	ra
  30:	00000000 	nop
  34:	3c040000 	lui	a0,0x0
			34: R_MIPS_HI16	$LC2
  38:	24840000 	addiu	a0,a0,0
			38: R_MIPS_LO16	$LC2
  3c:	08000000 	j	0 <skb_trim>
			3c: R_MIPS_26	warn_slowpath_null
  40:	240505ab 	li	a1,1451

Disassembly of section .text.__skb_to_sgvec:

00000000 <__skb_to_sgvec>:
   0:	27bdffc8 	addiu	sp,sp,-56
   4:	afbe0030 	sw	s8,48(sp)
   8:	afb7002c 	sw	s7,44(sp)
   c:	afb3001c 	sw	s3,28(sp)
  10:	afb20018 	sw	s2,24(sp)
  14:	afb10014 	sw	s1,20(sp)
  18:	afbf0034 	sw	ra,52(sp)
  1c:	afb60028 	sw	s6,40(sp)
  20:	afb50024 	sw	s5,36(sp)
  24:	afb40020 	sw	s4,32(sp)
  28:	afb00010 	sw	s0,16(sp)
  2c:	00809821 	move	s3,a0
  30:	00a0b821 	move	s7,a1
  34:	00c08821 	move	s1,a2
  38:	00e09021 	move	s2,a3
  3c:	0000f021 	move	s8,zero
  40:	8e630050 	lw	v1,80(s3)
  44:	8e620054 	lw	v0,84(s3)
  48:	0062a023 	subu	s4,v1,v0
  4c:	02913023 	subu	a2,s4,s1
  50:	18c00019 	blez	a2,b8 <__skb_to_sgvec+0xb8>
  54:	0000a821 	move	s5,zero
  58:	8e6400ac 	lw	a0,172(s3)
  5c:	3c020000 	lui	v0,0x0
			5c: R_MIPS_HI16	mem_map
  60:	3c038000 	lui	v1,0x8000
  64:	00912021 	addu	a0,a0,s1
  68:	8c450000 	lw	a1,0(v0)
			68: R_MIPS_LO16	mem_map
  6c:	00831021 	addu	v0,a0,v1
  70:	00021302 	srl	v0,v0,0xc
  74:	00021140 	sll	v0,v0,0x5
  78:	00a22821 	addu	a1,a1,v0
  7c:	30a30003 	andi	v1,a1,0x3
  80:	00038036 	tne	zero,v1,0x200
  84:	8ee20000 	lw	v0,0(s7)
  88:	0246182a 	slt	v1,s2,a2
  8c:	0243300b 	movn	a2,s2,v1
  90:	30420003 	andi	v0,v0,0x3
  94:	00a22825 	or	a1,a1,v0
  98:	30840fff 	andi	a0,a0,0xfff
  9c:	02469023 	subu	s2,s2,a2
  a0:	aee50000 	sw	a1,0(s7)
  a4:	aee40004 	sw	a0,4(s7)
  a8:	1240005b 	beqz	s2,218 <__skb_to_sgvec+0x218>
  ac:	aee60008 	sw	a2,8(s7)
  b0:	02268821 	addu	s1,s1,a2
  b4:	24150001 	li	s5,1
  b8:	8e6400a4 	lw	a0,164(s3)
  bc:	94820000 	lhu	v0,0(a0)
  c0:	10400028 	beqz	v0,164 <__skb_to_sgvec+0x164>
  c4:	00000000 	nop
  c8:	00008021 	move	s0,zero
  cc:	02511021 	addu	v0,s2,s1
  d0:	0054102a 	slt	v0,v0,s4
  d4:	14400052 	bnez	v0,220 <__skb_to_sgvec+0x220>
  d8:	00000000 	nop
  dc:	00101880 	sll	v1,s0,0x2
  e0:	00101100 	sll	v0,s0,0x4
  e4:	00431023 	subu	v0,v0,v1
  e8:	00823821 	addu	a3,a0,v0
  ec:	8ce20038 	lw	v0,56(a3)
  f0:	00151900 	sll	v1,s5,0x4
  f4:	02824821 	addu	t1,s4,v0
  f8:	01312823 	subu	a1,t1,s1
  fc:	18a00014 	blez	a1,150 <__skb_to_sgvec+0x150>
 100:	02e34021 	addu	t0,s7,v1
 104:	8ce60030 	lw	a2,48(a3)
 108:	8ce40034 	lw	a0,52(a3)
 10c:	30c20003 	andi	v0,a2,0x3
 110:	00028036 	tne	zero,v0,0x200
 114:	8d030000 	lw	v1,0(t0)
 118:	0245102a 	slt	v0,s2,a1
 11c:	0242280b 	movn	a1,s2,v0
 120:	02242021 	addu	a0,s1,a0
 124:	30630003 	andi	v1,v1,0x3
 128:	00942023 	subu	a0,a0,s4
 12c:	00c33025 	or	a2,a2,v1
 130:	02459023 	subu	s2,s2,a1
 134:	02258821 	addu	s1,s1,a1
 138:	ad060000 	sw	a2,0(t0)
 13c:	ad040004 	sw	a0,4(t0)
 140:	ad050008 	sw	a1,8(t0)
 144:	12400027 	beqz	s2,1e4 <__skb_to_sgvec+0x1e4>
 148:	26b50001 	addiu	s5,s5,1
 14c:	8e6400a4 	lw	a0,164(s3)
 150:	94820000 	lhu	v0,0(a0)
 154:	26100001 	addiu	s0,s0,1
 158:	0202102a 	slt	v0,s0,v0
 15c:	1440ffdb 	bnez	v0,cc <__skb_to_sgvec+0xcc>
 160:	0120a021 	move	s4,t1
 164:	8c930010 	lw	s3,16(a0)
 168:	1260001d 	beqz	s3,1e0 <__skb_to_sgvec+0x1e0>
 16c:	00000000 	nop
 170:	02511021 	addu	v0,s2,s1
 174:	0054102a 	slt	v0,v0,s4
 178:	1440002f 	bnez	v0,238 <__skb_to_sgvec+0x238>
 17c:	3c040000 	lui	a0,0x0
			17c: R_MIPS_HI16	$LC3
 180:	8e620050 	lw	v0,80(s3)
 184:	0282b021 	addu	s6,s4,v0
 188:	02d18023 	subu	s0,s6,s1
 18c:	1a000011 	blez	s0,1d4 <__skb_to_sgvec+0x1d4>
 190:	0250102a 	slt	v0,s2,s0
 194:	00152900 	sll	a1,s5,0x4
 198:	02343023 	subu	a2,s1,s4
 19c:	02e52821 	addu	a1,s7,a1
 1a0:	02602021 	move	a0,s3
 1a4:	10400006 	beqz	v0,1c0 <__skb_to_sgvec+0x1c0>
 1a8:	02003821 	move	a3,s0
 1ac:	00151100 	sll	v0,s5,0x4
 1b0:	02e2b821 	addu	s7,s7,v0
 1b4:	02348823 	subu	s1,s1,s4
 1b8:	08000010 	j	40 <__skb_to_sgvec+0x40>
			1b8: R_MIPS_26	.text.__skb_to_sgvec
 1bc:	03d5f021 	addu	s8,s8,s5
 1c0:	0c000000 	jal	0 <__skb_to_sgvec>
			1c0: R_MIPS_26	.text.__skb_to_sgvec
 1c4:	02509023 	subu	s2,s2,s0
 1c8:	02308821 	addu	s1,s1,s0
 1cc:	12400005 	beqz	s2,1e4 <__skb_to_sgvec+0x1e4>
 1d0:	02a2a821 	addu	s5,s5,v0
 1d4:	8e730000 	lw	s3,0(s3)
 1d8:	1660ffe5 	bnez	s3,170 <__skb_to_sgvec+0x170>
 1dc:	02c0a021 	move	s4,s6
 1e0:	00128036 	tne	zero,s2,0x200
 1e4:	8fbf0034 	lw	ra,52(sp)
 1e8:	02be1021 	addu	v0,s5,s8
 1ec:	8fbe0030 	lw	s8,48(sp)
 1f0:	8fb7002c 	lw	s7,44(sp)
 1f4:	8fb60028 	lw	s6,40(sp)
 1f8:	8fb50024 	lw	s5,36(sp)
 1fc:	8fb40020 	lw	s4,32(sp)
 200:	8fb3001c 	lw	s3,28(sp)
 204:	8fb20018 	lw	s2,24(sp)
 208:	8fb10014 	lw	s1,20(sp)
 20c:	8fb00010 	lw	s0,16(sp)
 210:	03e00008 	jr	ra
 214:	27bd0038 	addiu	sp,sp,56
 218:	08000079 	j	1e4 <__skb_to_sgvec+0x1e4>
			218: R_MIPS_26	.text.__skb_to_sgvec
 21c:	24150001 	li	s5,1
 220:	3c040000 	lui	a0,0x0
			220: R_MIPS_HI16	$LC3
 224:	24840000 	addiu	a0,a0,0
			224: R_MIPS_LO16	$LC3
 228:	0c000000 	jal	0 <__skb_to_sgvec>
			228: R_MIPS_26	warn_slowpath_null
 22c:	24050e3d 	li	a1,3645
 230:	08000037 	j	dc <__skb_to_sgvec+0xdc>
			230: R_MIPS_26	.text.__skb_to_sgvec
 234:	8e6400a4 	lw	a0,164(s3)
 238:	24840000 	addiu	a0,a0,0
			238: R_MIPS_LO16	$LC3
 23c:	0c000000 	jal	0 <__skb_to_sgvec>
			23c: R_MIPS_26	warn_slowpath_null
 240:	24050e52 	li	a1,3666
 244:	08000061 	j	184 <__skb_to_sgvec+0x184>
			244: R_MIPS_26	.text.__skb_to_sgvec
 248:	8e620050 	lw	v0,80(s3)

Disassembly of section .text.skb_to_sgvec:

00000000 <skb_to_sgvec>:
   0:	27bdffe8 	addiu	sp,sp,-24
   4:	afbf0014 	sw	ra,20(sp)
   8:	afb00010 	sw	s0,16(sp)
   c:	0c000000 	jal	0 <skb_to_sgvec>
			c: R_MIPS_26	.text.__skb_to_sgvec
  10:	00a08021 	move	s0,a1
  14:	2443ffff 	addiu	v1,v0,-1
  18:	00031900 	sll	v1,v1,0x4
  1c:	02038021 	addu	s0,s0,v1
  20:	8e040000 	lw	a0,0(s0)
  24:	2403fffe 	li	v1,-2
  28:	34840002 	ori	a0,a0,0x2
  2c:	00832024 	and	a0,a0,v1
  30:	ae040000 	sw	a0,0(s0)
  34:	8fbf0014 	lw	ra,20(sp)
  38:	8fb00010 	lw	s0,16(sp)
  3c:	03e00008 	jr	ra
  40:	27bd0018 	addiu	sp,sp,24

Disassembly of section .text.skb_pull:

00000000 <skb_pull>:
   0:	8c830050 	lw	v1,80(a0)
   4:	0065102b 	sltu	v0,v1,a1
   8:	14400009 	bnez	v0,30 <skb_pull+0x30>
   c:	00003021 	move	a2,zero
  10:	8c820054 	lw	v0,84(a0)
  14:	00651823 	subu	v1,v1,a1
  18:	ac830050 	sw	v1,80(a0)
  1c:	0062182b 	sltu	v1,v1,v0
  20:	00038036 	tne	zero,v1,0x200
  24:	8c8200ac 	lw	v0,172(a0)
  28:	00453021 	addu	a2,v0,a1
  2c:	ac8600ac 	sw	a2,172(a0)
  30:	03e00008 	jr	ra
  34:	00c01021 	move	v0,a2

Disassembly of section .init.text:

00000000 <skb_init>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb00018 	sw	s0,24(sp)
   8:	afbf001c 	sw	ra,28(sp)
   c:	3c020000 	lui	v0,0x0
			c: R_MIPS_HI16	init_net
  10:	3c030000 	lui	v1,0x0
			10: R_MIPS_HI16	.rodata
  14:	8c6b0000 	lw	t3,0(v1)
			14: R_MIPS_LO16	.rodata
  18:	24500000 	addiu	s0,v0,0
			18: R_MIPS_LO16	init_net
  1c:	8e06001c 	lw	a2,28(s0)
  20:	3c090000 	lui	t1,0x0
			20: R_MIPS_HI16	skbmgr_pool
  24:	3c0a0000 	lui	t2,0x0
			24: R_MIPS_HI16	skbmgr_4k_pool
  28:	25270000 	addiu	a3,t1,0
			28: R_MIPS_LO16	skbmgr_pool
  2c:	25480000 	addiu	t0,t2,0
			2c: R_MIPS_LO16	skbmgr_4k_pool
  30:	3c020000 	lui	v0,0x0
			30: R_MIPS_HI16	skbmgr_alloc_no
  34:	3c030000 	lui	v1,0x0
			34: R_MIPS_HI16	g_used_skb_num
  38:	3c040000 	lui	a0,0x0
			38: R_MIPS_HI16	$LC5
  3c:	ac400000 	sw	zero,0(v0)
			3c: R_MIPS_LO16	skbmgr_alloc_no
  40:	ac600000 	sw	zero,0(v1)
			40: R_MIPS_LO16	g_used_skb_num
  44:	24840000 	addiu	a0,a0,0
			44: R_MIPS_LO16	$LC5
  48:	ace00008 	sw	zero,8(a3)
  4c:	ad0b000c 	sw	t3,12(t0)
  50:	ace70004 	sw	a3,4(a3)
  54:	240501a4 	li	a1,420
  58:	aceb000c 	sw	t3,12(a3)
  5c:	ad270000 	sw	a3,0(t1)
			5c: R_MIPS_LO16	skbmgr_pool
  60:	ad480000 	sw	t0,0(t2)
			60: R_MIPS_LO16	skbmgr_4k_pool
  64:	ad000008 	sw	zero,8(t0)
  68:	0c000000 	jal	0 <skb_init>
			68: R_MIPS_26	create_proc_entry
  6c:	ad080004 	sw	t0,4(t0)
  70:	1040002c 	beqz	v0,124 <skb_init+0x124>
  74:	00402021 	move	a0,v0
  78:	3c020000 	lui	v0,0x0
			78: R_MIPS_HI16	.text.hot_list_len_write
  7c:	3c030000 	lui	v1,0x0
			7c: R_MIPS_HI16	.text.hot_list_len_read
  80:	24630000 	addiu	v1,v1,0
			80: R_MIPS_LO16	.text.hot_list_len_read
  84:	24420000 	addiu	v0,v0,0
			84: R_MIPS_LO16	.text.hot_list_len_write
  88:	ac830040 	sw	v1,64(a0)
  8c:	ac820044 	sw	v0,68(a0)
  90:	8e06001c 	lw	a2,28(s0)
  94:	3c040000 	lui	a0,0x0
			94: R_MIPS_HI16	$LC6
  98:	24840000 	addiu	a0,a0,0
			98: R_MIPS_LO16	$LC6
  9c:	0c000000 	jal	0 <skb_init>
			9c: R_MIPS_26	create_proc_entry
  a0:	00002821 	move	a1,zero
  a4:	1040001f 	beqz	v0,124 <skb_init+0x124>
  a8:	00401821 	move	v1,v0
  ac:	3c020000 	lui	v0,0x0
			ac: R_MIPS_HI16	.text.skbmgr_info_read
  b0:	24420000 	addiu	v0,v0,0
			b0: R_MIPS_LO16	.text.skbmgr_info_read
  b4:	ac620040 	sw	v0,64(v1)
  b8:	ac60003c 	sw	zero,60(v1)
  bc:	8e06001c 	lw	a2,28(s0)
  c0:	3c040000 	lui	a0,0x0
			c0: R_MIPS_HI16	$LC7
  c4:	24840000 	addiu	a0,a0,0
			c4: R_MIPS_LO16	$LC7
  c8:	0c000000 	jal	0 <skb_init>
			c8: R_MIPS_26	create_proc_entry
  cc:	240501a4 	li	a1,420
  d0:	10400014 	beqz	v0,124 <skb_init+0x124>
  d4:	00402021 	move	a0,v0
  d8:	3c020000 	lui	v0,0x0
			d8: R_MIPS_HI16	.text.limit_write
  dc:	3c030000 	lui	v1,0x0
			dc: R_MIPS_HI16	.text.limit_read
  e0:	24420000 	addiu	v0,v0,0
			e0: R_MIPS_LO16	.text.limit_write
  e4:	24630000 	addiu	v1,v1,0
			e4: R_MIPS_LO16	.text.limit_read
  e8:	ac820044 	sw	v0,68(a0)
  ec:	ac830040 	sw	v1,64(a0)
  f0:	8e06001c 	lw	a2,28(s0)
  f4:	3c040000 	lui	a0,0x0
			f4: R_MIPS_HI16	$LC8
  f8:	24840000 	addiu	a0,a0,0
			f8: R_MIPS_LO16	$LC8
  fc:	0c000000 	jal	0 <skb_init>
			fc: R_MIPS_26	create_proc_entry
 100:	240501a4 	li	a1,420
 104:	10400007 	beqz	v0,124 <skb_init+0x124>
 108:	00402021 	move	a0,v0
 10c:	3c020000 	lui	v0,0x0
			10c: R_MIPS_HI16	.text.driver_max_skb_write
 110:	3c030000 	lui	v1,0x0
			110: R_MIPS_HI16	.text.driver_max_skb_read
 114:	24420000 	addiu	v0,v0,0
			114: R_MIPS_LO16	.text.driver_max_skb_write
 118:	24630000 	addiu	v1,v1,0
			118: R_MIPS_LO16	.text.driver_max_skb_read
 11c:	ac820044 	sw	v0,68(a0)
 120:	ac830040 	sw	v1,64(a0)
 124:	3c100004 	lui	s0,0x4
 128:	3c040000 	lui	a0,0x0
			128: R_MIPS_HI16	$LC9
 12c:	36072000 	ori	a3,s0,0x2000
 130:	24840000 	addiu	a0,a0,0
			130: R_MIPS_LO16	$LC9
 134:	240500b8 	li	a1,184
 138:	00003021 	move	a2,zero
 13c:	0c000000 	jal	0 <skb_init>
			13c: R_MIPS_26	kmem_cache_create
 140:	afa00010 	sw	zero,16(sp)
 144:	3c040000 	lui	a0,0x0
			144: R_MIPS_HI16	$LC10
 148:	3c030000 	lui	v1,0x0
			148: R_MIPS_HI16	.bss
 14c:	36072000 	ori	a3,s0,0x2000
 150:	24840000 	addiu	a0,a0,0
			150: R_MIPS_LO16	$LC10
 154:	24050174 	li	a1,372
 158:	00003021 	move	a2,zero
 15c:	ac620070 	sw	v0,112(v1)
			15c: R_MIPS_LO16	.bss
 160:	0c000000 	jal	0 <skb_init>
			160: R_MIPS_26	kmem_cache_create
 164:	afa00010 	sw	zero,16(sp)
 168:	3c030000 	lui	v1,0x0
			168: R_MIPS_HI16	.bss
 16c:	ac620074 	sw	v0,116(v1)
			16c: R_MIPS_LO16	.bss
 170:	8fbf001c 	lw	ra,28(sp)
 174:	8fb00018 	lw	s0,24(sp)
 178:	03e00008 	jr	ra
 17c:	27bd0020 	addiu	sp,sp,32

Disassembly of section .text.driver_max_skb_write:

00000000 <driver_max_skb_write>:
   0:	27bdffa8 	addiu	sp,sp,-88
   4:	2cc20041 	sltiu	v0,a2,65
   8:	afb00050 	sw	s0,80(sp)
   c:	afbf0054 	sw	ra,84(sp)
  10:	14400006 	bnez	v0,2c <driver_max_skb_write+0x2c>
  14:	2410ffea 	li	s0,-22
  18:	8fbf0054 	lw	ra,84(sp)
  1c:	02001021 	move	v0,s0
  20:	8fb00050 	lw	s0,80(sp)
  24:	03e00008 	jr	ra
  28:	27bd0058 	addiu	sp,sp,88
  2c:	8f830018 	lw	v1,24(gp)
  30:	00a61021 	addu	v0,a1,a2
  34:	00451025 	or	v0,v0,a1
  38:	00c21025 	or	v0,a2,v0
  3c:	00431024 	and	v0,v0,v1
  40:	00c08021 	move	s0,a2
  44:	14400005 	bnez	v0,5c <driver_max_skb_write+0x5c>
  48:	00c01821 	move	v1,a2
  4c:	27a40010 	addiu	a0,sp,16
  50:	0c000000 	jal	0 <driver_max_skb_write>
			50: R_MIPS_26	__copy_user
  54:	00a60821 	addu	at,a1,a2
  58:	00c01821 	move	v1,a2
  5c:	10600003 	beqz	v1,6c <driver_max_skb_write+0x6c>
  60:	27a40010 	addiu	a0,sp,16
  64:	08000006 	j	18 <driver_max_skb_write+0x18>
			64: R_MIPS_26	.text.driver_max_skb_write
  68:	2410fff2 	li	s0,-14
  6c:	00002821 	move	a1,zero
  70:	0c000000 	jal	0 <driver_max_skb_write>
			70: R_MIPS_26	simple_strtoul
  74:	2406000a 	li	a2,10
  78:	3c030000 	lui	v1,0x0
			78: R_MIPS_HI16	g_max_skb_num
  7c:	08000006 	j	18 <driver_max_skb_write+0x18>
			7c: R_MIPS_26	.text.driver_max_skb_write
  80:	ac620000 	sw	v0,0(v1)
			80: R_MIPS_LO16	g_max_skb_num

Disassembly of section .text.driver_max_skb_read:

00000000 <driver_max_skb_read>:
   0:	27bdffd0 	addiu	sp,sp,-48
   4:	afb30028 	sw	s3,40(sp)
   8:	afb20024 	sw	s2,36(sp)
   c:	afb10020 	sw	s1,32(sp)
  10:	afb0001c 	sw	s0,28(sp)
  14:	afbf002c 	sw	ra,44(sp)
  18:	3c020000 	lui	v0,0x0
			18: R_MIPS_HI16	g_used_skb_num
  1c:	3c030000 	lui	v1,0x0
			1c: R_MIPS_HI16	g_max_skb_num
  20:	8c490000 	lw	t1,0(v0)
			20: R_MIPS_LO16	g_used_skb_num
  24:	8c680000 	lw	t0,0(v1)
			24: R_MIPS_LO16	g_max_skb_num
  28:	3c020000 	lui	v0,0x0
			28: R_MIPS_HI16	peak_skb_num
  2c:	8c430000 	lw	v1,0(v0)
			2c: R_MIPS_LO16	peak_skb_num
  30:	00a09821 	move	s3,a1
  34:	3c050000 	lui	a1,0x0
			34: R_MIPS_HI16	$LC11
  38:	00c09021 	move	s2,a2
  3c:	00e08021 	move	s0,a3
  40:	01003021 	move	a2,t0
  44:	24a50000 	addiu	a1,a1,0
			44: R_MIPS_LO16	$LC11
  48:	01203821 	move	a3,t1
  4c:	afa30010 	sw	v1,16(sp)
  50:	0c000000 	jal	0 <driver_max_skb_read>
			50: R_MIPS_26	sprintf
  54:	00808821 	move	s1,a0
  58:	00521823 	subu	v1,v0,s2
  5c:	0070102a 	slt	v0,v1,s0
  60:	1440000c 	bnez	v0,94 <driver_max_skb_read+0x94>
  64:	8fa40040 	lw	a0,64(sp)
  68:	02001821 	move	v1,s0
  6c:	02321021 	addu	v0,s1,s2
  70:	ae620000 	sw	v0,0(s3)
  74:	8fbf002c 	lw	ra,44(sp)
  78:	00601021 	move	v0,v1
  7c:	8fb30028 	lw	s3,40(sp)
  80:	8fb20024 	lw	s2,36(sp)
  84:	8fb10020 	lw	s1,32(sp)
  88:	8fb0001c 	lw	s0,28(sp)
  8c:	03e00008 	jr	ra
  90:	27bd0030 	addiu	sp,sp,48
  94:	24020001 	li	v0,1
  98:	1c60fff4 	bgtz	v1,6c <driver_max_skb_read+0x6c>
  9c:	ac820000 	sw	v0,0(a0)
  a0:	8fbf002c 	lw	ra,44(sp)
  a4:	00001821 	move	v1,zero
  a8:	00601021 	move	v0,v1
  ac:	8fb30028 	lw	s3,40(sp)
  b0:	8fb20024 	lw	s2,36(sp)
  b4:	8fb10020 	lw	s1,32(sp)
  b8:	8fb0001c 	lw	s0,28(sp)
  bc:	03e00008 	jr	ra
  c0:	27bd0030 	addiu	sp,sp,48

Disassembly of section .text.limit_read:

00000000 <limit_read>:
   0:	27bdffd8 	addiu	sp,sp,-40
   4:	afb30020 	sw	s3,32(sp)
   8:	afb2001c 	sw	s2,28(sp)
   c:	afb10018 	sw	s1,24(sp)
  10:	afb00014 	sw	s0,20(sp)
  14:	afbf0024 	sw	ra,36(sp)
  18:	3c020000 	lui	v0,0x0
			18: R_MIPS_HI16	skbmgr_limit
  1c:	00c08821 	move	s1,a2
  20:	8c460000 	lw	a2,0(v0)
			20: R_MIPS_LO16	skbmgr_limit
  24:	00a09821 	move	s3,a1
  28:	3c050000 	lui	a1,0x0
			28: R_MIPS_HI16	$LC12
  2c:	24a50000 	addiu	a1,a1,0
			2c: R_MIPS_LO16	$LC12
  30:	00e08021 	move	s0,a3
  34:	0c000000 	jal	0 <limit_read>
			34: R_MIPS_26	sprintf
  38:	00809021 	move	s2,a0
  3c:	00511823 	subu	v1,v0,s1
  40:	0070102a 	slt	v0,v1,s0
  44:	1440000c 	bnez	v0,78 <limit_read+0x78>
  48:	8fa40038 	lw	a0,56(sp)
  4c:	02001821 	move	v1,s0
  50:	02511021 	addu	v0,s2,s1
  54:	ae620000 	sw	v0,0(s3)
  58:	8fbf0024 	lw	ra,36(sp)
  5c:	00601021 	move	v0,v1
  60:	8fb30020 	lw	s3,32(sp)
  64:	8fb2001c 	lw	s2,28(sp)
  68:	8fb10018 	lw	s1,24(sp)
  6c:	8fb00014 	lw	s0,20(sp)
  70:	03e00008 	jr	ra
  74:	27bd0028 	addiu	sp,sp,40
  78:	24020001 	li	v0,1
  7c:	1c60fff4 	bgtz	v1,50 <limit_read+0x50>
  80:	ac820000 	sw	v0,0(a0)
  84:	8fbf0024 	lw	ra,36(sp)
  88:	00001821 	move	v1,zero
  8c:	00601021 	move	v0,v1
  90:	8fb30020 	lw	s3,32(sp)
  94:	8fb2001c 	lw	s2,28(sp)
  98:	8fb10018 	lw	s1,24(sp)
  9c:	8fb00014 	lw	s0,20(sp)
  a0:	03e00008 	jr	ra
  a4:	27bd0028 	addiu	sp,sp,40

Disassembly of section .text.skbmgr_info_read:

00000000 <skbmgr_info_read>:
   0:	27bdffd8 	addiu	sp,sp,-40
   4:	afbf0024 	sw	ra,36(sp)
   8:	afb40020 	sw	s4,32(sp)
   c:	afb3001c 	sw	s3,28(sp)
  10:	afb20018 	sw	s2,24(sp)
  14:	afb10014 	sw	s1,20(sp)
  18:	afb00010 	sw	s0,16(sp)
  1c:	3c020000 	lui	v0,0x0
			1c: R_MIPS_HI16	skbmgr_limit
  20:	00c09021 	move	s2,a2
  24:	8c460000 	lw	a2,0(v0)
			24: R_MIPS_LO16	skbmgr_limit
  28:	00a0a021 	move	s4,a1
  2c:	3c050000 	lui	a1,0x0
			2c: R_MIPS_HI16	$LC13
  30:	24a50000 	addiu	a1,a1,0
			30: R_MIPS_LO16	$LC13
  34:	00e09821 	move	s3,a3
  38:	0c000000 	jal	0 <skbmgr_info_read>
			38: R_MIPS_26	sprintf
  3c:	00808821 	move	s1,a0
  40:	3c030000 	lui	v1,0x0
			40: R_MIPS_HI16	skbmgr_max_alloc_no
  44:	8c660000 	lw	a2,0(v1)
			44: R_MIPS_LO16	skbmgr_max_alloc_no
  48:	02228021 	addu	s0,s1,v0
  4c:	3c050000 	lui	a1,0x0
			4c: R_MIPS_HI16	$LC14
  50:	02002021 	move	a0,s0
  54:	0c000000 	jal	0 <skbmgr_info_read>
			54: R_MIPS_26	sprintf
  58:	24a50000 	addiu	a1,a1,0
			58: R_MIPS_LO16	$LC14
  5c:	3c030000 	lui	v1,0x0
			5c: R_MIPS_HI16	skbmgr_alloc_fail
  60:	8c660000 	lw	a2,0(v1)
			60: R_MIPS_LO16	skbmgr_alloc_fail
  64:	02028021 	addu	s0,s0,v0
  68:	3c050000 	lui	a1,0x0
			68: R_MIPS_HI16	$LC15
  6c:	02002021 	move	a0,s0
  70:	0c000000 	jal	0 <skbmgr_info_read>
			70: R_MIPS_26	sprintf
  74:	24a50000 	addiu	a1,a1,0
			74: R_MIPS_LO16	$LC15
  78:	3c030000 	lui	v1,0x0
			78: R_MIPS_HI16	skbmgr_alloc_no
  7c:	8c660000 	lw	a2,0(v1)
			7c: R_MIPS_LO16	skbmgr_alloc_no
  80:	02028021 	addu	s0,s0,v0
  84:	3c050000 	lui	a1,0x0
			84: R_MIPS_HI16	$LC16
  88:	02002021 	move	a0,s0
  8c:	0c000000 	jal	0 <skbmgr_info_read>
			8c: R_MIPS_26	sprintf
  90:	24a50000 	addiu	a1,a1,0
			90: R_MIPS_LO16	$LC16
  94:	3c030000 	lui	v1,0x0
			94: R_MIPS_HI16	skbmgr_max_list_len
  98:	8c660000 	lw	a2,0(v1)
			98: R_MIPS_LO16	skbmgr_max_list_len
  9c:	02028021 	addu	s0,s0,v0
  a0:	3c050000 	lui	a1,0x0
			a0: R_MIPS_HI16	$LC17
  a4:	02002021 	move	a0,s0
  a8:	0c000000 	jal	0 <skbmgr_info_read>
			a8: R_MIPS_26	sprintf
  ac:	24a50000 	addiu	a1,a1,0
			ac: R_MIPS_LO16	$LC17
  b0:	02028021 	addu	s0,s0,v0
  b4:	3c050000 	lui	a1,0x0
			b4: R_MIPS_HI16	$LC18
  b8:	02002021 	move	a0,s0
  bc:	24a50000 	addiu	a1,a1,0
			bc: R_MIPS_LO16	$LC18
  c0:	0c000000 	jal	0 <skbmgr_info_read>
			c0: R_MIPS_26	sprintf
  c4:	24060200 	li	a2,512
  c8:	3c030000 	lui	v1,0x0
			c8: R_MIPS_HI16	skbmgr_4k_max_alloc_no
  cc:	8c660000 	lw	a2,0(v1)
			cc: R_MIPS_LO16	skbmgr_4k_max_alloc_no
  d0:	02028021 	addu	s0,s0,v0
  d4:	3c050000 	lui	a1,0x0
			d4: R_MIPS_HI16	$LC19
  d8:	02002021 	move	a0,s0
  dc:	0c000000 	jal	0 <skbmgr_info_read>
			dc: R_MIPS_26	sprintf
  e0:	24a50000 	addiu	a1,a1,0
			e0: R_MIPS_LO16	$LC19
  e4:	3c030000 	lui	v1,0x0
			e4: R_MIPS_HI16	skbmgr_4k_alloc_fail
  e8:	8c660000 	lw	a2,0(v1)
			e8: R_MIPS_LO16	skbmgr_4k_alloc_fail
  ec:	02028021 	addu	s0,s0,v0
  f0:	3c050000 	lui	a1,0x0
			f0: R_MIPS_HI16	$LC20
  f4:	02002021 	move	a0,s0
  f8:	0c000000 	jal	0 <skbmgr_info_read>
			f8: R_MIPS_26	sprintf
  fc:	24a50000 	addiu	a1,a1,0
			fc: R_MIPS_LO16	$LC20
 100:	3c030000 	lui	v1,0x0
			100: R_MIPS_HI16	skbmgr_4k_alloc_no
 104:	8c660000 	lw	a2,0(v1)
			104: R_MIPS_LO16	skbmgr_4k_alloc_no
 108:	02028021 	addu	s0,s0,v0
 10c:	3c050000 	lui	a1,0x0
			10c: R_MIPS_HI16	$LC21
 110:	02002021 	move	a0,s0
 114:	0c000000 	jal	0 <skbmgr_info_read>
			114: R_MIPS_26	sprintf
 118:	24a50000 	addiu	a1,a1,0
			118: R_MIPS_LO16	$LC21
 11c:	3c030000 	lui	v1,0x0
			11c: R_MIPS_HI16	skbmgr_4k_max_list_len
 120:	8c660000 	lw	a2,0(v1)
			120: R_MIPS_LO16	skbmgr_4k_max_list_len
 124:	02028021 	addu	s0,s0,v0
 128:	3c050000 	lui	a1,0x0
			128: R_MIPS_HI16	$LC22
 12c:	02002021 	move	a0,s0
 130:	0c000000 	jal	0 <skbmgr_info_read>
			130: R_MIPS_26	sprintf
 134:	24a50000 	addiu	a1,a1,0
			134: R_MIPS_LO16	$LC22
 138:	3c030000 	lui	v1,0x0
			138: R_MIPS_HI16	skbmgr_pool
 13c:	8c660008 	lw	a2,8(v1)
			13c: R_MIPS_LO16	skbmgr_pool
 140:	02028021 	addu	s0,s0,v0
 144:	3c050000 	lui	a1,0x0
			144: R_MIPS_HI16	$LC23
 148:	02002021 	move	a0,s0
 14c:	0c000000 	jal	0 <skbmgr_info_read>
			14c: R_MIPS_26	sprintf
 150:	24a50000 	addiu	a1,a1,0
			150: R_MIPS_LO16	$LC23
 154:	3c030000 	lui	v1,0x0
			154: R_MIPS_HI16	skbmgr_4k_pool
 158:	8c660008 	lw	a2,8(v1)
			158: R_MIPS_LO16	skbmgr_4k_pool
 15c:	02028021 	addu	s0,s0,v0
 160:	3c050000 	lui	a1,0x0
			160: R_MIPS_HI16	$LC24
 164:	02002021 	move	a0,s0
 168:	0c000000 	jal	0 <skbmgr_info_read>
			168: R_MIPS_26	sprintf
 16c:	24a50000 	addiu	a1,a1,0
			16c: R_MIPS_LO16	$LC24
 170:	02028021 	addu	s0,s0,v0
 174:	02118023 	subu	s0,s0,s1
 178:	02128023 	subu	s0,s0,s2
 17c:	0213102a 	slt	v0,s0,s3
 180:	1440000d 	bnez	v0,1b8 <skbmgr_info_read+0x1b8>
 184:	8fa30038 	lw	v1,56(sp)
 188:	02608021 	move	s0,s3
 18c:	02321021 	addu	v0,s1,s2
 190:	ae820000 	sw	v0,0(s4)
 194:	8fbf0024 	lw	ra,36(sp)
 198:	02001021 	move	v0,s0
 19c:	8fb40020 	lw	s4,32(sp)
 1a0:	8fb3001c 	lw	s3,28(sp)
 1a4:	8fb20018 	lw	s2,24(sp)
 1a8:	8fb10014 	lw	s1,20(sp)
 1ac:	8fb00010 	lw	s0,16(sp)
 1b0:	03e00008 	jr	ra
 1b4:	27bd0028 	addiu	sp,sp,40
 1b8:	24020001 	li	v0,1
 1bc:	1e00fff3 	bgtz	s0,18c <skbmgr_info_read+0x18c>
 1c0:	ac620000 	sw	v0,0(v1)
 1c4:	8fbf0024 	lw	ra,36(sp)
 1c8:	00008021 	move	s0,zero
 1cc:	02001021 	move	v0,s0
 1d0:	8fb40020 	lw	s4,32(sp)
 1d4:	8fb3001c 	lw	s3,28(sp)
 1d8:	8fb20018 	lw	s2,24(sp)
 1dc:	8fb10014 	lw	s1,20(sp)
 1e0:	8fb00010 	lw	s0,16(sp)
 1e4:	03e00008 	jr	ra
 1e8:	27bd0028 	addiu	sp,sp,40

Disassembly of section .text.hot_list_len_read:

00000000 <hot_list_len_read>:
   0:	27bdffd8 	addiu	sp,sp,-40
   4:	afb30020 	sw	s3,32(sp)
   8:	afb2001c 	sw	s2,28(sp)
   c:	afb10018 	sw	s1,24(sp)
  10:	afb00014 	sw	s0,20(sp)
  14:	afbf0024 	sw	ra,36(sp)
  18:	3c030000 	lui	v1,0x0
			18: R_MIPS_HI16	skbmgr_4k_hot_list_len
  1c:	3c020000 	lui	v0,0x0
			1c: R_MIPS_HI16	skbmgr_hot_list_len
  20:	00c09021 	move	s2,a2
  24:	00e08021 	move	s0,a3
  28:	8c460000 	lw	a2,0(v0)
			28: R_MIPS_LO16	skbmgr_hot_list_len
  2c:	8c670000 	lw	a3,0(v1)
			2c: R_MIPS_LO16	skbmgr_4k_hot_list_len
  30:	00a09821 	move	s3,a1
  34:	3c050000 	lui	a1,0x0
			34: R_MIPS_HI16	$LC25
  38:	24a50000 	addiu	a1,a1,0
			38: R_MIPS_LO16	$LC25
  3c:	0c000000 	jal	0 <hot_list_len_read>
			3c: R_MIPS_26	sprintf
  40:	00808821 	move	s1,a0
  44:	00521823 	subu	v1,v0,s2
  48:	0070102a 	slt	v0,v1,s0
  4c:	1440000c 	bnez	v0,80 <hot_list_len_read+0x80>
  50:	8fa40038 	lw	a0,56(sp)
  54:	02001821 	move	v1,s0
  58:	02321021 	addu	v0,s1,s2
  5c:	ae620000 	sw	v0,0(s3)
  60:	8fbf0024 	lw	ra,36(sp)
  64:	00601021 	move	v0,v1
  68:	8fb30020 	lw	s3,32(sp)
  6c:	8fb2001c 	lw	s2,28(sp)
  70:	8fb10018 	lw	s1,24(sp)
  74:	8fb00014 	lw	s0,20(sp)
  78:	03e00008 	jr	ra
  7c:	27bd0028 	addiu	sp,sp,40
  80:	24020001 	li	v0,1
  84:	1c60fff4 	bgtz	v1,58 <hot_list_len_read+0x58>
  88:	ac820000 	sw	v0,0(a0)
  8c:	8fbf0024 	lw	ra,36(sp)
  90:	00001821 	move	v1,zero
  94:	00601021 	move	v0,v1
  98:	8fb30020 	lw	s3,32(sp)
  9c:	8fb2001c 	lw	s2,28(sp)
  a0:	8fb10018 	lw	s1,24(sp)
  a4:	8fb00014 	lw	s0,20(sp)
  a8:	03e00008 	jr	ra
  ac:	27bd0028 	addiu	sp,sp,40

Disassembly of section .text.sock_pipe_buf_release:

00000000 <sock_pipe_buf_release>:
   0:	08000000 	j	0 <sock_pipe_buf_release>
			0: R_MIPS_26	put_page
   4:	8ca40000 	lw	a0,0(a1)

Disassembly of section .text.sock_spd_release:

00000000 <sock_spd_release>:
   0:	8c820000 	lw	v0,0(a0)
   4:	00052880 	sll	a1,a1,0x2
   8:	00451021 	addu	v0,v0,a1
   c:	08000000 	j	0 <sock_spd_release>
			c: R_MIPS_26	put_page
  10:	8c440000 	lw	a0,0(v0)

Disassembly of section .imem_text:

00000000 <kfree_skbmem>:
   0:	00802821 	move	a1,a0
   4:	8c840064 	lw	a0,100(a0)
   8:	24020001 	li	v0,1
   c:	7c830cc0 	ext	v1,a0,0x13,0x2
  10:	10620008 	beq	v1,v0,34 <kfree_skbmem+0x34>
  14:	24020002 	li	v0,2
  18:	10620011 	beq	v1,v0,60 <kfree_skbmem+0x60>
  1c:	00801021 	move	v0,a0
  20:	1460000d 	bnez	v1,58 <kfree_skbmem+0x58>
  24:	00000000 	nop
  28:	3c020000 	lui	v0,0x0
			28: R_MIPS_HI16	.bss
  2c:	08000000 	j	0 <kfree_skbmem>
			2c: R_MIPS_26	kmem_cache_free
  30:	8c440070 	lw	a0,112(v0)
			30: R_MIPS_LO16	.bss
  34:	24a20170 	addiu	v0,a1,368
  38:	c0440000 	ll	a0,0(v0)
  3c:	2483ffff 	addiu	v1,a0,-1
  40:	e0430000 	sc	v1,0(v0)
  44:	1060018d 	beqz	v1,67c <skbmgr_alloc_skb2k+0x1dc>
  48:	00000000 	nop
  4c:	2483ffff 	addiu	v1,a0,-1
  50:	10600012 	beqz	v1,9c <kfree_skbmem+0x9c>
  54:	00000000 	nop
  58:	03e00008 	jr	ra
  5c:	00000000 	nop
  60:	7c02a4c4 	ins	v0,zero,0x13,0x2
  64:	aca20064 	sw	v0,100(a1)
  68:	24a300b8 	addiu	v1,a1,184
  6c:	c0640000 	ll	a0,0(v1)
  70:	2482ffff 	addiu	v0,a0,-1
  74:	e0620000 	sc	v0,0(v1)
  78:	10400182 	beqz	v0,684 <skbmgr_alloc_skb2k+0x1e4>
  7c:	00000000 	nop
  80:	2482ffff 	addiu	v0,a0,-1
  84:	1440fff4 	bnez	v0,58 <kfree_skbmem+0x58>
  88:	00000000 	nop
  8c:	3c020000 	lui	v0,0x0
			8c: R_MIPS_HI16	.bss
  90:	8c440074 	lw	a0,116(v0)
			90: R_MIPS_LO16	.bss
  94:	08000000 	j	0 <kfree_skbmem>
			94: R_MIPS_26	kmem_cache_free
  98:	24a5ff48 	addiu	a1,a1,-184
  9c:	3c020000 	lui	v0,0x0
			9c: R_MIPS_HI16	.bss
  a0:	08000000 	j	0 <kfree_skbmem>
			a0: R_MIPS_26	kmem_cache_free
  a4:	8c440074 	lw	a0,116(v0)
			a4: R_MIPS_LO16	.bss

000000a8 <skbmgr_recycling_callback>:
  a8:	27bdffd8 	addiu	sp,sp,-40
  ac:	afb2001c 	sw	s2,28(sp)
  b0:	3c120000 	lui	s2,0x0
			b0: R_MIPS_HI16	skbmgr_pool
  b4:	afb30020 	sw	s3,32(sp)
  b8:	afb10018 	sw	s1,24(sp)
  bc:	afbf0024 	sw	ra,36(sp)
  c0:	afb00014 	sw	s0,20(sp)
  c4:	26530000 	addiu	s3,s2,0
			c4: R_MIPS_LO16	skbmgr_pool
  c8:	3c020000 	lui	v0,0x0
			c8: R_MIPS_HI16	skbmgr_hot_list_len
  cc:	8c430000 	lw	v1,0(v0)
			cc: R_MIPS_LO16	skbmgr_hot_list_len
  d0:	8e650008 	lw	a1,8(s3)
  d4:	00a3182b 	sltu	v1,a1,v1
  d8:	10600005 	beqz	v1,f0 <skbmgr_recycling_callback+0x48>
  dc:	00808821 	move	s1,a0
  e0:	8c8300b0 	lw	v1,176(a0)
  e4:	24020798 	li	v0,1944
  e8:	10620009 	beq	v1,v0,110 <skbmgr_recycling_callback+0x68>
  ec:	00000000 	nop
  f0:	00001021 	move	v0,zero
  f4:	8fbf0024 	lw	ra,36(sp)
  f8:	8fb30020 	lw	s3,32(sp)
  fc:	8fb2001c 	lw	s2,28(sp)
 100:	8fb10018 	lw	s1,24(sp)
 104:	8fb00014 	lw	s0,20(sp)
 108:	03e00008 	jr	ra
 10c:	27bd0028 	addiu	sp,sp,40
 110:	8c8300a4 	lw	v1,164(a0)
 114:	94620000 	lhu	v0,0(v1)
 118:	1440fff6 	bnez	v0,f4 <skbmgr_recycling_callback+0x4c>
 11c:	00001021 	move	v0,zero
 120:	8c620010 	lw	v0,16(v1)
 124:	1440fff3 	bnez	v0,f4 <skbmgr_recycling_callback+0x4c>
 128:	00001021 	move	v0,zero
 12c:	3c030000 	lui	v1,0x0
			12c: R_MIPS_HI16	skbmgr_max_list_len
 130:	8c620000 	lw	v0,0(v1)
			130: R_MIPS_LO16	skbmgr_max_list_len
 134:	0045102b 	sltu	v0,v0,a1
 138:	10400003 	beqz	v0,148 <skbmgr_recycling_callback+0xa0>
 13c:	3c100000 	lui	s0,0x0
			13c: R_MIPS_HI16	.bss
 140:	24a20001 	addiu	v0,a1,1
 144:	ac620000 	sw	v0,0(v1)
			144: R_MIPS_LO16	skbmgr_max_list_len
 148:	0c000000 	jal	0 <kfree_skbmem>
			148: R_MIPS_26	_raw_spin_lock_irqsave
 14c:	2604006c 	addiu	a0,s0,108
			14c: R_MIPS_LO16	.bss
 150:	8e450000 	lw	a1,0(s2)
			150: R_MIPS_LO16	skbmgr_pool
 154:	ae330004 	sw	s3,4(s1)
 158:	2604006c 	addiu	a0,s0,108
			158: R_MIPS_LO16	.bss
 15c:	ae250000 	sw	a1,0(s1)
 160:	acb10004 	sw	s1,4(a1)
 164:	8e630008 	lw	v1,8(s3)
 168:	00402821 	move	a1,v0
 16c:	ae510000 	sw	s1,0(s2)
			16c: R_MIPS_LO16	skbmgr_pool
 170:	24630001 	addiu	v1,v1,1
 174:	0c000000 	jal	0 <kfree_skbmem>
			174: R_MIPS_26	_raw_spin_unlock_irqrestore
 178:	ae630008 	sw	v1,8(s3)
 17c:	0800003d 	j	f4 <skbmgr_recycling_callback+0x4c>
			17c: R_MIPS_26	.imem_text
 180:	24020001 	li	v0,1

00000184 <kfree_skb>:
 184:	1080000f 	beqz	a0,1c4 <kfree_skb+0x40>
 188:	00000000 	nop
 18c:	8c8300b4 	lw	v1,180(a0)
 190:	24020001 	li	v0,1
 194:	14620003 	bne	v1,v0,1a4 <kfree_skb+0x20>
 198:	248500b4 	addiu	a1,a0,180
 19c:	08000000 	j	0 <kfree_skbmem>
			19c: R_MIPS_26	__kfree_skb
 1a0:	00000000 	nop
 1a4:	c0a30000 	ll	v1,0(a1)
 1a8:	2462ffff 	addiu	v0,v1,-1
 1ac:	e0a20000 	sc	v0,0(a1)
 1b0:	10400136 	beqz	v0,68c <skbmgr_alloc_skb2k+0x1ec>
 1b4:	00000000 	nop
 1b8:	2462ffff 	addiu	v0,v1,-1
 1bc:	1040fff7 	beqz	v0,19c <kfree_skb+0x18>
 1c0:	00000000 	nop
 1c4:	03e00008 	jr	ra
 1c8:	00000000 	nop

000001cc <skb_release_data>:
 1cc:	27bdffe0 	addiu	sp,sp,-32
 1d0:	afb10018 	sw	s1,24(sp)
 1d4:	afbf001c 	sw	ra,28(sp)
 1d8:	afb00014 	sw	s0,20(sp)
 1dc:	8c830064 	lw	v1,100(a0)
 1e0:	7c620780 	ext	v0,v1,0x1e,0x1
 1e4:	1040000e 	beqz	v0,220 <skb_release_data+0x54>
 1e8:	00808821 	move	s1,a0
 1ec:	7c6206c0 	ext	v0,v1,0x1b,0x1
 1f0:	14400032 	bnez	v0,2bc <skb_release_data+0xf0>
 1f4:	24040001 	li	a0,1
 1f8:	8e2200a4 	lw	v0,164(s1)
 1fc:	24420028 	addiu	v0,v0,40
 200:	c0450000 	ll	a1,0(v0)
 204:	00a41823 	subu	v1,a1,a0
 208:	e0430000 	sc	v1,0(v0)
 20c:	10600121 	beqz	v1,694 <skbmgr_alloc_skb2k+0x1f4>
 210:	00000000 	nop
 214:	00a41823 	subu	v1,a1,a0
 218:	14600016 	bnez	v1,274 <skb_release_data+0xa8>
 21c:	8fbf001c 	lw	ra,28(sp)
 220:	8e2500a4 	lw	a1,164(s1)
 224:	94a20000 	lhu	v0,0(a1)
 228:	14400016 	bnez	v0,284 <skb_release_data+0xb8>
 22c:	00008021 	move	s0,zero
 230:	8ca40010 	lw	a0,16(a1)
 234:	10800006 	beqz	a0,250 <skb_release_data+0x84>
 238:	00000000 	nop
 23c:	aca00010 	sw	zero,16(a1)
 240:	0c000000 	jal	0 <kfree_skbmem>
			240: R_MIPS_26	kfree_skb
 244:	8c900000 	lw	s0,0(a0)
 248:	1600fffd 	bnez	s0,240 <skb_release_data+0x74>
 24c:	02002021 	move	a0,s0
 250:	0c000000 	jal	0 <kfree_skbmem>
			250: R_MIPS_26	kfree
 254:	8e2400a8 	lw	a0,168(s1)
 258:	3c020000 	lui	v0,0x0
			258: R_MIPS_HI16	g_used_skb_num
 25c:	c0430000 	ll	v1,0(v0)
			25c: R_MIPS_LO16	g_used_skb_num
 260:	2463ffff 	addiu	v1,v1,-1
 264:	e0430000 	sc	v1,0(v0)
			264: R_MIPS_LO16	g_used_skb_num
 268:	1060010c 	beqz	v1,69c <skbmgr_alloc_skb2k+0x1fc>
 26c:	00000000 	nop
 270:	8fbf001c 	lw	ra,28(sp)
 274:	8fb10018 	lw	s1,24(sp)
 278:	8fb00014 	lw	s0,20(sp)
 27c:	03e00008 	jr	ra
 280:	27bd0020 	addiu	sp,sp,32
 284:	00101080 	sll	v0,s0,0x2
 288:	00101900 	sll	v1,s0,0x4
 28c:	00621823 	subu	v1,v1,v0
 290:	00a31821 	addu	v1,a1,v1
 294:	8c640030 	lw	a0,48(v1)
 298:	0c000000 	jal	0 <kfree_skbmem>
			298: R_MIPS_26	put_page
 29c:	26100001 	addiu	s0,s0,1
 2a0:	8e2500a4 	lw	a1,164(s1)
 2a4:	94a20000 	lhu	v0,0(a1)
 2a8:	0202102a 	slt	v0,s0,v0
 2ac:	1440fff6 	bnez	v0,288 <skb_release_data+0xbc>
 2b0:	00101080 	sll	v0,s0,0x2
 2b4:	0800008d 	j	234 <skb_release_data+0x68>
			2b4: R_MIPS_26	.imem_text
 2b8:	8ca40010 	lw	a0,16(a1)
 2bc:	3c020001 	lui	v0,0x1
 2c0:	0800007e 	j	1f8 <skb_release_data+0x2c>
			2c0: R_MIPS_26	.imem_text
 2c4:	34440001 	ori	a0,v0,0x1

000002c8 <__kfree_skb>:
 2c8:	27bdffe8 	addiu	sp,sp,-24
 2cc:	afb00010 	sw	s0,16(sp)
 2d0:	afbf0014 	sw	ra,20(sp)
 2d4:	0c000000 	jal	0 <kfree_skbmem>
			2d4: R_MIPS_26	.text.skb_release_all
 2d8:	00808021 	move	s0,a0
 2dc:	02002021 	move	a0,s0
 2e0:	8fbf0014 	lw	ra,20(sp)
 2e4:	8fb00010 	lw	s0,16(sp)
 2e8:	08000000 	j	0 <kfree_skbmem>
			2e8: R_MIPS_26	.imem_text
 2ec:	27bd0018 	addiu	sp,sp,24

000002f0 <__alloc_skb>:
 2f0:	27bdffd0 	addiu	sp,sp,-48
 2f4:	afb60028 	sw	s6,40(sp)
 2f8:	afb50024 	sw	s5,36(sp)
 2fc:	afb20018 	sw	s2,24(sp)
 300:	afb10014 	sw	s1,20(sp)
 304:	afbf002c 	sw	ra,44(sp)
 308:	afb40020 	sw	s4,32(sp)
 30c:	afb3001c 	sw	s3,28(sp)
 310:	afb00010 	sw	s0,16(sp)
 314:	00c0b021 	move	s6,a2
 318:	03e08821 	move	s1,ra
 31c:	00809021 	move	s2,a0
 320:	10c0004d 	beqz	a2,458 <__alloc_skb+0x168>
 324:	00a0a821 	move	s5,a1
 328:	3c020000 	lui	v0,0x0
			328: R_MIPS_HI16	.bss
 32c:	8c530074 	lw	s3,116(v0)
			32c: R_MIPS_LO16	.bss
 330:	2405fffe 	li	a1,-2
 334:	02a52824 	and	a1,s5,a1
 338:	0c000000 	jal	0 <kfree_skbmem>
			338: R_MIPS_26	kmem_cache_alloc
 33c:	02602021 	move	a0,s3
 340:	1040003a 	beqz	v0,42c <__alloc_skb+0x13c>
 344:	00408021 	move	s0,v0
 348:	3c140000 	lui	s4,0x0
			348: R_MIPS_HI16	g_used_skb_num
 34c:	3c020000 	lui	v0,0x0
			34c: R_MIPS_HI16	g_max_skb_num
 350:	8c440000 	lw	a0,0(v0)
			350: R_MIPS_LO16	g_max_skb_num
 354:	8e830000 	lw	v1,0(s4)
			354: R_MIPS_LO16	g_used_skb_num
 358:	0083182a 	slt	v1,a0,v1
 35c:	14600041 	bnez	v1,464 <__alloc_skb+0x174>
 360:	2643001f 	addiu	v1,s2,31
 364:	2402ffe0 	li	v0,-32
 368:	00629024 	and	s2,v1,v0
 36c:	02203021 	move	a2,s1
 370:	02a02821 	move	a1,s5
 374:	0c000000 	jal	0 <kfree_skbmem>
			374: R_MIPS_26	__kmalloc_track_caller
 378:	26440108 	addiu	a0,s2,264
 37c:	00408821 	move	s1,v0
 380:	10400038 	beqz	v0,464 <__alloc_skb+0x174>
 384:	ce010000 	pref	0x1,0(s0)
 388:	00529821 	addu	s3,v0,s2
 38c:	ce610000 	pref	0x1,0(s3)
 390:	c2820000 	ll	v0,0(s4)
			390: R_MIPS_LO16	g_used_skb_num
 394:	24420001 	addiu	v0,v0,1
 398:	e2820000 	sc	v0,0(s4)
			398: R_MIPS_LO16	g_used_skb_num
 39c:	104000c1 	beqz	v0,6a4 <skbmgr_alloc_skb2k+0x204>
 3a0:	00000000 	nop
 3a4:	3c040000 	lui	a0,0x0
			3a4: R_MIPS_HI16	peak_skb_num
 3a8:	8e820000 	lw	v0,0(s4)
			3a8: R_MIPS_LO16	g_used_skb_num
 3ac:	8c830000 	lw	v1,0(a0)
			3ac: R_MIPS_LO16	peak_skb_num
 3b0:	0062102a 	slt	v0,v1,v0
 3b4:	10400003 	beqz	v0,3c4 <__alloc_skb+0xd4>
 3b8:	00000000 	nop
 3bc:	8e820000 	lw	v0,0(s4)
			3bc: R_MIPS_LO16	g_used_skb_num
 3c0:	ac820000 	sw	v0,0(a0)
			3c0: R_MIPS_LO16	peak_skb_num
 3c4:	02002021 	move	a0,s0
 3c8:	00002821 	move	a1,zero
 3cc:	0c000000 	jal	0 <kfree_skbmem>
			3cc: R_MIPS_26	memset
 3d0:	240600a0 	li	a2,160
 3d4:	264300b8 	addiu	v1,s2,184
 3d8:	24120001 	li	s2,1
 3dc:	ae0300b0 	sw	v1,176(s0)
 3e0:	ae1100a0 	sw	s1,160(s0)
 3e4:	ae1200b4 	sw	s2,180(s0)
 3e8:	ae1100a8 	sw	s1,168(s0)
 3ec:	ae1100ac 	sw	s1,172(s0)
 3f0:	ae1300a4 	sw	s3,164(s0)
 3f4:	02602021 	move	a0,s3
 3f8:	00002821 	move	a1,zero
 3fc:	0c000000 	jal	0 <kfree_skbmem>
			3fc: R_MIPS_26	memset
 400:	24060028 	li	a2,40
 404:	12c00009 	beqz	s6,42c <__alloc_skb+0x13c>
 408:	ae720028 	sw	s2,40(s3)
 40c:	8e020064 	lw	v0,100(s0)
 410:	260400b8 	addiu	a0,s0,184
 414:	7e42a4c4 	ins	v0,s2,0x13,0x2
 418:	ae020064 	sw	v0,100(s0)
 41c:	8c830064 	lw	v1,100(a0)
 420:	ac9200b8 	sw	s2,184(a0)
 424:	7c03a4c4 	ins	v1,zero,0x13,0x2
 428:	ac830064 	sw	v1,100(a0)
 42c:	8fbf002c 	lw	ra,44(sp)
 430:	02001021 	move	v0,s0
 434:	8fb60028 	lw	s6,40(sp)
 438:	8fb50024 	lw	s5,36(sp)
 43c:	8fb40020 	lw	s4,32(sp)
 440:	8fb3001c 	lw	s3,28(sp)
 444:	8fb20018 	lw	s2,24(sp)
 448:	8fb10014 	lw	s1,20(sp)
 44c:	8fb00010 	lw	s0,16(sp)
 450:	03e00008 	jr	ra
 454:	27bd0030 	addiu	sp,sp,48
 458:	3c020000 	lui	v0,0x0
			458: R_MIPS_HI16	.bss
 45c:	080000cc 	j	330 <__alloc_skb+0x40>
			45c: R_MIPS_26	.imem_text
 460:	8c530070 	lw	s3,112(v0)
			460: R_MIPS_LO16	.bss
 464:	02002821 	move	a1,s0
 468:	0c000000 	jal	0 <kfree_skbmem>
			468: R_MIPS_26	kmem_cache_free
 46c:	02602021 	move	a0,s3
 470:	8fbf002c 	lw	ra,44(sp)
 474:	00008021 	move	s0,zero
 478:	02001021 	move	v0,s0
 47c:	8fb60028 	lw	s6,40(sp)
 480:	8fb50024 	lw	s5,36(sp)
 484:	8fb40020 	lw	s4,32(sp)
 488:	8fb3001c 	lw	s3,28(sp)
 48c:	8fb20018 	lw	s2,24(sp)
 490:	8fb10014 	lw	s1,20(sp)
 494:	8fb00010 	lw	s0,16(sp)
 498:	03e00008 	jr	ra
 49c:	27bd0030 	addiu	sp,sp,48

000004a0 <skbmgr_alloc_skb2k>:
 4a0:	27bdffd8 	addiu	sp,sp,-40
 4a4:	afb10014 	sw	s1,20(sp)
 4a8:	3c110000 	lui	s1,0x0
			4a8: R_MIPS_HI16	skbmgr_pool
 4ac:	afb00010 	sw	s0,16(sp)
 4b0:	afbf0024 	sw	ra,36(sp)
 4b4:	afb40020 	sw	s4,32(sp)
 4b8:	afb3001c 	sw	s3,28(sp)
 4bc:	afb20018 	sw	s2,24(sp)
 4c0:	26300000 	addiu	s0,s1,0
			4c0: R_MIPS_LO16	skbmgr_pool
 4c4:	8e020008 	lw	v0,8(s0)
 4c8:	14400038 	bnez	v0,5ac <skbmgr_alloc_skb2k+0x10c>
 4cc:	3c020000 	lui	v0,0x0
			4cc: R_MIPS_HI16	skbmgr_limit
 4d0:	8c440000 	lw	a0,0(v0)
			4d0: R_MIPS_LO16	skbmgr_limit
 4d4:	10800013 	beqz	a0,524 <skbmgr_alloc_skb2k+0x84>
 4d8:	3c030000 	lui	v1,0x0
			4d8: R_MIPS_HI16	skbmgr_alloc_no
 4dc:	8c620000 	lw	v0,0(v1)
			4dc: R_MIPS_LO16	skbmgr_alloc_no
 4e0:	0044102a 	slt	v0,v0,a0
 4e4:	14400010 	bnez	v0,528 <skbmgr_alloc_skb2k+0x88>
 4e8:	240406e0 	li	a0,1760
 4ec:	3c030000 	lui	v1,0x0
			4ec: R_MIPS_HI16	skbmgr_alloc_fail
 4f0:	8c620000 	lw	v0,0(v1)
			4f0: R_MIPS_LO16	skbmgr_alloc_fail
 4f4:	0000a021 	move	s4,zero
 4f8:	24420001 	addiu	v0,v0,1
 4fc:	ac620000 	sw	v0,0(v1)
			4fc: R_MIPS_LO16	skbmgr_alloc_fail
 500:	8fbf0024 	lw	ra,36(sp)
 504:	02801021 	move	v0,s4
 508:	8fb40020 	lw	s4,32(sp)
 50c:	8fb3001c 	lw	s3,28(sp)
 510:	8fb20018 	lw	s2,24(sp)
 514:	8fb10014 	lw	s1,20(sp)
 518:	8fb00010 	lw	s0,16(sp)
 51c:	03e00008 	jr	ra
 520:	27bd0028 	addiu	sp,sp,40
 524:	240406e0 	li	a0,1760
 528:	24050220 	li	a1,544
 52c:	00003021 	move	a2,zero
 530:	0c000000 	jal	0 <kfree_skbmem>
			530: R_MIPS_26	__alloc_skb
 534:	2407ffff 	li	a3,-1
 538:	10400047 	beqz	v0,658 <skbmgr_alloc_skb2k+0x1b8>
 53c:	0040a021 	move	s4,v0
 540:	3c020000 	lui	v0,0x0
			540: R_MIPS_HI16	skbmgr_recycling_callback
 544:	24420000 	addiu	v0,v0,0
			544: R_MIPS_LO16	skbmgr_recycling_callback
 548:	24040001 	li	a0,1
 54c:	ae82006c 	sw	v0,108(s4)
 550:	ae840070 	sw	a0,112(s4)
 554:	3c030000 	lui	v1,0x0
			554: R_MIPS_HI16	skbmgr_alloc_no
 558:	c0620000 	ll	v0,0(v1)
			558: R_MIPS_LO16	skbmgr_alloc_no
 55c:	24420001 	addiu	v0,v0,1
 560:	e0620000 	sc	v0,0(v1)
			560: R_MIPS_LO16	skbmgr_alloc_no
 564:	10400051 	beqz	v0,6ac <skbmgr_alloc_skb2k+0x20c>
 568:	00000000 	nop
 56c:	3c040000 	lui	a0,0x0
			56c: R_MIPS_HI16	skbmgr_max_alloc_no
 570:	8c630000 	lw	v1,0(v1)
			570: R_MIPS_LO16	skbmgr_alloc_no
 574:	8c820000 	lw	v0,0(a0)
			574: R_MIPS_LO16	skbmgr_max_alloc_no
 578:	0043102a 	slt	v0,v0,v1
 57c:	1040ffe1 	beqz	v0,504 <skbmgr_alloc_skb2k+0x64>
 580:	8fbf0024 	lw	ra,36(sp)
 584:	ac830000 	sw	v1,0(a0)
			584: R_MIPS_LO16	skbmgr_max_alloc_no
 588:	8fbf0024 	lw	ra,36(sp)
 58c:	02801021 	move	v0,s4
 590:	8fb40020 	lw	s4,32(sp)
 594:	8fb3001c 	lw	s3,28(sp)
 598:	8fb20018 	lw	s2,24(sp)
 59c:	8fb10014 	lw	s1,20(sp)
 5a0:	8fb00010 	lw	s0,16(sp)
 5a4:	03e00008 	jr	ra
 5a8:	27bd0028 	addiu	sp,sp,40
 5ac:	3c120000 	lui	s2,0x0
			5ac: R_MIPS_HI16	.bss
 5b0:	0c000000 	jal	0 <kfree_skbmem>
			5b0: R_MIPS_26	_raw_spin_lock_irqsave
 5b4:	2644006c 	addiu	a0,s2,108
			5b4: R_MIPS_LO16	.bss
 5b8:	8e340000 	lw	s4,0(s1)
			5b8: R_MIPS_LO16	skbmgr_pool
 5bc:	1214002b 	beq	s0,s4,66c <skbmgr_alloc_skb2k+0x1cc>
 5c0:	00402821 	move	a1,v0
 5c4:	12800029 	beqz	s4,66c <skbmgr_alloc_skb2k+0x1cc>
 5c8:	2644006c 	addiu	a0,s2,108
			5c8: R_MIPS_LO16	.bss
 5cc:	8e020008 	lw	v0,8(s0)
 5d0:	24120001 	li	s2,1
 5d4:	2442ffff 	addiu	v0,v0,-1
 5d8:	ae020008 	sw	v0,8(s0)
 5dc:	8e830000 	lw	v1,0(s4)
 5e0:	8e820004 	lw	v0,4(s4)
 5e4:	ae800000 	sw	zero,0(s4)
 5e8:	ae800004 	sw	zero,4(s4)
 5ec:	ac430000 	sw	v1,0(v0)
 5f0:	0c000000 	jal	0 <kfree_skbmem>
			5f0: R_MIPS_26	_raw_spin_unlock_irqrestore
 5f4:	ac620004 	sw	v0,4(v1)
 5f8:	8e9300b0 	lw	s3,176(s4)
 5fc:	8e9100a8 	lw	s1,168(s4)
 600:	02802021 	move	a0,s4
 604:	2670ff48 	addiu	s0,s3,-184
 608:	02308021 	addu	s0,s1,s0
 60c:	00002821 	move	a1,zero
 610:	0c000000 	jal	0 <kfree_skbmem>
			610: R_MIPS_26	memset
 614:	240600a0 	li	a2,160
 618:	ae9300b0 	sw	s3,176(s4)
 61c:	ae9200b4 	sw	s2,180(s4)
 620:	ae9100a8 	sw	s1,168(s4)
 624:	ae9100ac 	sw	s1,172(s4)
 628:	ae9100a0 	sw	s1,160(s4)
 62c:	ae9000a4 	sw	s0,164(s4)
 630:	02002021 	move	a0,s0
 634:	00002821 	move	a1,zero
 638:	0c000000 	jal	0 <kfree_skbmem>
			638: R_MIPS_26	memset
 63c:	24060028 	li	a2,40
 640:	3c020000 	lui	v0,0x0
			640: R_MIPS_HI16	skbmgr_recycling_callback
 644:	24420000 	addiu	v0,v0,0
			644: R_MIPS_LO16	skbmgr_recycling_callback
 648:	ae120028 	sw	s2,40(s0)
 64c:	ae82006c 	sw	v0,108(s4)
 650:	08000155 	j	554 <skbmgr_alloc_skb2k+0xb4>
			650: R_MIPS_26	.imem_text
 654:	ae920070 	sw	s2,112(s4)
 658:	3c030000 	lui	v1,0x0
			658: R_MIPS_HI16	skbmgr_alloc_fail
 65c:	8c620000 	lw	v0,0(v1)
			65c: R_MIPS_LO16	skbmgr_alloc_fail
 660:	24420001 	addiu	v0,v0,1
 664:	08000140 	j	500 <skbmgr_alloc_skb2k+0x60>
			664: R_MIPS_26	.imem_text
 668:	ac620000 	sw	v0,0(v1)
			668: R_MIPS_LO16	skbmgr_alloc_fail
 66c:	0c000000 	jal	0 <kfree_skbmem>
			66c: R_MIPS_26	_raw_spin_unlock_irqrestore
 670:	2644006c 	addiu	a0,s2,108
			670: R_MIPS_LO16	.bss
 674:	08000134 	j	4d0 <skbmgr_alloc_skb2k+0x30>
			674: R_MIPS_26	.imem_text
 678:	3c020000 	lui	v0,0x0
			678: R_MIPS_HI16	skbmgr_limit
 67c:	1000fe6e 	b	38 <kfree_skbmem+0x38>
 680:	00000000 	nop
 684:	1000fe79 	b	6c <kfree_skbmem+0x6c>
 688:	00000000 	nop
 68c:	1000fec5 	b	1a4 <kfree_skb+0x20>
 690:	00000000 	nop
 694:	1000feda 	b	200 <skb_release_data+0x34>
 698:	00000000 	nop
 69c:	1000feef 	b	25c <skb_release_data+0x90>
 6a0:	00000000 	nop
 6a4:	1000ff3a 	b	390 <__alloc_skb+0xa0>
 6a8:	00000000 	nop
 6ac:	1000ffaa 	b	558 <skbmgr_alloc_skb2k+0xb8>
 6b0:	00000000 	nop

Disassembly of section .text.skbmgr_4k_recycling_callback:

00000000 <skbmgr_4k_recycling_callback>:
   0:	27bdffd8 	addiu	sp,sp,-40
   4:	afb2001c 	sw	s2,28(sp)
   8:	3c120000 	lui	s2,0x0
			8: R_MIPS_HI16	skbmgr_4k_pool
   c:	afb30020 	sw	s3,32(sp)
  10:	afb10018 	sw	s1,24(sp)
  14:	afbf0024 	sw	ra,36(sp)
  18:	afb00014 	sw	s0,20(sp)
  1c:	26530000 	addiu	s3,s2,0
			1c: R_MIPS_LO16	skbmgr_4k_pool
  20:	3c020000 	lui	v0,0x0
			20: R_MIPS_HI16	skbmgr_4k_hot_list_len
  24:	8c430000 	lw	v1,0(v0)
			24: R_MIPS_LO16	skbmgr_4k_hot_list_len
  28:	8e650008 	lw	a1,8(s3)
  2c:	00a3182b 	sltu	v1,a1,v1
  30:	10600005 	beqz	v1,48 <skbmgr_4k_recycling_callback+0x48>
  34:	00808821 	move	s1,a0
  38:	8c8300b0 	lw	v1,176(a0)
  3c:	24020f98 	li	v0,3992
  40:	10620009 	beq	v1,v0,68 <skbmgr_4k_recycling_callback+0x68>
  44:	00000000 	nop
  48:	00001021 	move	v0,zero
  4c:	8fbf0024 	lw	ra,36(sp)
  50:	8fb30020 	lw	s3,32(sp)
  54:	8fb2001c 	lw	s2,28(sp)
  58:	8fb10018 	lw	s1,24(sp)
  5c:	8fb00014 	lw	s0,20(sp)
  60:	03e00008 	jr	ra
  64:	27bd0028 	addiu	sp,sp,40
  68:	8c8300a4 	lw	v1,164(a0)
  6c:	94620000 	lhu	v0,0(v1)
  70:	1440fff6 	bnez	v0,4c <skbmgr_4k_recycling_callback+0x4c>
  74:	00001021 	move	v0,zero
  78:	8c620010 	lw	v0,16(v1)
  7c:	1440fff3 	bnez	v0,4c <skbmgr_4k_recycling_callback+0x4c>
  80:	00001021 	move	v0,zero
  84:	3c030000 	lui	v1,0x0
			84: R_MIPS_HI16	skbmgr_4k_max_list_len
  88:	8c620000 	lw	v0,0(v1)
			88: R_MIPS_LO16	skbmgr_4k_max_list_len
  8c:	0045102b 	sltu	v0,v0,a1
  90:	10400003 	beqz	v0,a0 <skbmgr_4k_recycling_callback+0xa0>
  94:	3c100000 	lui	s0,0x0
			94: R_MIPS_HI16	.bss
  98:	24a20001 	addiu	v0,a1,1
  9c:	ac620000 	sw	v0,0(v1)
			9c: R_MIPS_LO16	skbmgr_4k_max_list_len
  a0:	0c000000 	jal	0 <skbmgr_4k_recycling_callback>
			a0: R_MIPS_26	_raw_spin_lock_irqsave
  a4:	26040068 	addiu	a0,s0,104
			a4: R_MIPS_LO16	.bss
  a8:	8e450000 	lw	a1,0(s2)
			a8: R_MIPS_LO16	skbmgr_4k_pool
  ac:	ae330004 	sw	s3,4(s1)
  b0:	26040068 	addiu	a0,s0,104
			b0: R_MIPS_LO16	.bss
  b4:	ae250000 	sw	a1,0(s1)
  b8:	acb10004 	sw	s1,4(a1)
  bc:	8e630008 	lw	v1,8(s3)
  c0:	00402821 	move	a1,v0
  c4:	ae510000 	sw	s1,0(s2)
			c4: R_MIPS_LO16	skbmgr_4k_pool
  c8:	24630001 	addiu	v1,v1,1
  cc:	0c000000 	jal	0 <skbmgr_4k_recycling_callback>
			cc: R_MIPS_26	_raw_spin_unlock_irqrestore
  d0:	ae630008 	sw	v1,8(s3)
  d4:	08000013 	j	4c <skbmgr_4k_recycling_callback+0x4c>
			d4: R_MIPS_26	.text.skbmgr_4k_recycling_callback
  d8:	24020001 	li	v0,1

Disassembly of section .text.skb_insert:

00000000 <skb_insert>:
   0:	27bdffd8 	addiu	sp,sp,-40
   4:	afb30020 	sw	s3,32(sp)
   8:	24d3000c 	addiu	s3,a2,12
   c:	afb10018 	sw	s1,24(sp)
  10:	00808821 	move	s1,a0
  14:	02602021 	move	a0,s3
  18:	afbf0024 	sw	ra,36(sp)
  1c:	afb2001c 	sw	s2,28(sp)
  20:	afb00014 	sw	s0,20(sp)
  24:	00c09021 	move	s2,a2
  28:	0c000000 	jal	0 <skb_insert>
			28: R_MIPS_26	_raw_spin_lock_irqsave
  2c:	00a08021 	move	s0,a1
  30:	8e230004 	lw	v1,4(s1)
  34:	ae110000 	sw	s1,0(s0)
  38:	02602021 	move	a0,s3
  3c:	ae030004 	sw	v1,4(s0)
  40:	ac700000 	sw	s0,0(v1)
  44:	ae300004 	sw	s0,4(s1)
  48:	8e430008 	lw	v1,8(s2)
  4c:	00402821 	move	a1,v0
  50:	24630001 	addiu	v1,v1,1
  54:	ae430008 	sw	v1,8(s2)
  58:	8fbf0024 	lw	ra,36(sp)
  5c:	8fb30020 	lw	s3,32(sp)
  60:	8fb2001c 	lw	s2,28(sp)
  64:	8fb10018 	lw	s1,24(sp)
  68:	8fb00014 	lw	s0,20(sp)
  6c:	08000000 	j	0 <skb_insert>
			6c: R_MIPS_26	_raw_spin_unlock_irqrestore
  70:	27bd0028 	addiu	sp,sp,40

Disassembly of section .text.skb_append:

00000000 <skb_append>:
   0:	27bdffd8 	addiu	sp,sp,-40
   4:	afb30020 	sw	s3,32(sp)
   8:	24d3000c 	addiu	s3,a2,12
   c:	afb10018 	sw	s1,24(sp)
  10:	00808821 	move	s1,a0
  14:	02602021 	move	a0,s3
  18:	afbf0024 	sw	ra,36(sp)
  1c:	afb2001c 	sw	s2,28(sp)
  20:	afb00014 	sw	s0,20(sp)
  24:	00c09021 	move	s2,a2
  28:	0c000000 	jal	0 <skb_append>
			28: R_MIPS_26	_raw_spin_lock_irqsave
  2c:	00a08021 	move	s0,a1
  30:	8e230000 	lw	v1,0(s1)
  34:	ae110004 	sw	s1,4(s0)
  38:	02602021 	move	a0,s3
  3c:	ae030000 	sw	v1,0(s0)
  40:	ac700004 	sw	s0,4(v1)
  44:	ae300000 	sw	s0,0(s1)
  48:	8e430008 	lw	v1,8(s2)
  4c:	00402821 	move	a1,v0
  50:	24630001 	addiu	v1,v1,1
  54:	ae430008 	sw	v1,8(s2)
  58:	8fbf0024 	lw	ra,36(sp)
  5c:	8fb30020 	lw	s3,32(sp)
  60:	8fb2001c 	lw	s2,28(sp)
  64:	8fb10018 	lw	s1,24(sp)
  68:	8fb00014 	lw	s0,20(sp)
  6c:	08000000 	j	0 <skb_append>
			6c: R_MIPS_26	_raw_spin_unlock_irqrestore
  70:	27bd0028 	addiu	sp,sp,40

Disassembly of section .text.skb_unlink:

00000000 <skb_unlink>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb20018 	sw	s2,24(sp)
   8:	24b2000c 	addiu	s2,a1,12
   c:	afb10014 	sw	s1,20(sp)
  10:	afb00010 	sw	s0,16(sp)
  14:	00a08821 	move	s1,a1
  18:	00808021 	move	s0,a0
  1c:	afbf001c 	sw	ra,28(sp)
  20:	0c000000 	jal	0 <skb_unlink>
			20: R_MIPS_26	_raw_spin_lock_irqsave
  24:	02402021 	move	a0,s2
  28:	8e230008 	lw	v1,8(s1)
  2c:	00402821 	move	a1,v0
  30:	02402021 	move	a0,s2
  34:	2463ffff 	addiu	v1,v1,-1
  38:	ae230008 	sw	v1,8(s1)
  3c:	8e060000 	lw	a2,0(s0)
  40:	8e020004 	lw	v0,4(s0)
  44:	ae000000 	sw	zero,0(s0)
  48:	ae000004 	sw	zero,4(s0)
  4c:	ac460000 	sw	a2,0(v0)
  50:	acc20004 	sw	v0,4(a2)
  54:	8fbf001c 	lw	ra,28(sp)
  58:	8fb20018 	lw	s2,24(sp)
  5c:	8fb10014 	lw	s1,20(sp)
  60:	8fb00010 	lw	s0,16(sp)
  64:	08000000 	j	0 <skb_unlink>
			64: R_MIPS_26	_raw_spin_unlock_irqrestore
  68:	27bd0020 	addiu	sp,sp,32

Disassembly of section .text.skb_queue_tail:

00000000 <skb_queue_tail>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb20018 	sw	s2,24(sp)
   8:	2492000c 	addiu	s2,a0,12
   c:	afb10014 	sw	s1,20(sp)
  10:	00808821 	move	s1,a0
  14:	02402021 	move	a0,s2
  18:	afbf001c 	sw	ra,28(sp)
  1c:	afb00010 	sw	s0,16(sp)
  20:	0c000000 	jal	0 <skb_queue_tail>
			20: R_MIPS_26	_raw_spin_lock_irqsave
  24:	00a08021 	move	s0,a1
  28:	8e250004 	lw	a1,4(s1)
  2c:	ae110000 	sw	s1,0(s0)
  30:	02402021 	move	a0,s2
  34:	ae050004 	sw	a1,4(s0)
  38:	acb00000 	sw	s0,0(a1)
  3c:	8e230008 	lw	v1,8(s1)
  40:	ae300004 	sw	s0,4(s1)
  44:	00402821 	move	a1,v0
  48:	24630001 	addiu	v1,v1,1
  4c:	ae230008 	sw	v1,8(s1)
  50:	8fbf001c 	lw	ra,28(sp)
  54:	8fb20018 	lw	s2,24(sp)
  58:	8fb10014 	lw	s1,20(sp)
  5c:	8fb00010 	lw	s0,16(sp)
  60:	08000000 	j	0 <skb_queue_tail>
			60: R_MIPS_26	_raw_spin_unlock_irqrestore
  64:	27bd0020 	addiu	sp,sp,32

Disassembly of section .text.sock_queue_err_skb:

00000000 <sock_queue_err_skb>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb20018 	sw	s2,24(sp)
   8:	afb10014 	sw	s1,20(sp)
   c:	afb00010 	sw	s0,16(sp)
  10:	afbf001c 	sw	ra,28(sp)
  14:	00808021 	move	s0,a0
  18:	8c820064 	lw	v0,100(a0)
  1c:	8ca400b0 	lw	a0,176(a1)
  20:	8e03002c 	lw	v1,44(s0)
  24:	00a08821 	move	s1,a1
  28:	00441021 	addu	v0,v0,a0
  2c:	0043102b 	sltu	v0,v0,v1
  30:	26120064 	addiu	s2,s0,100
  34:	10400017 	beqz	v0,94 <sock_queue_err_skb+0x94>
  38:	2403fff4 	li	v1,-12
  3c:	8ca20068 	lw	v0,104(a1)
  40:	10400004 	beqz	v0,54 <sock_queue_err_skb+0x54>
  44:	00000000 	nop
  48:	0040f809 	jalr	v0
  4c:	00a02021 	move	a0,a1
  50:	8e2400b0 	lw	a0,176(s1)
  54:	3c020000 	lui	v0,0x0
			54: R_MIPS_HI16	.text.sock_rmem_free
  58:	24420000 	addiu	v0,v0,0
			58: R_MIPS_LO16	.text.sock_rmem_free
  5c:	ae220068 	sw	v0,104(s1)
  60:	ae300010 	sw	s0,16(s1)
  64:	c2420000 	ll	v0,0(s2)
  68:	00441021 	addu	v0,v0,a0
  6c:	e2420000 	sc	v0,0(s2)
  70:	1040001b 	beqz	v0,e0 <sock_queue_err_skb+0xe0>
  74:	00000000 	nop
  78:	260400bc 	addiu	a0,s0,188
  7c:	0c000000 	jal	0 <sock_queue_err_skb>
			7c: R_MIPS_26	skb_queue_tail
  80:	02202821 	move	a1,s1
  84:	8e0200b4 	lw	v0,180(s0)
  88:	30420001 	andi	v0,v0,0x1
  8c:	10400008 	beqz	v0,b0 <sock_queue_err_skb+0xb0>
  90:	00001821 	move	v1,zero
  94:	8fbf001c 	lw	ra,28(sp)
  98:	00601021 	move	v0,v1
  9c:	8fb20018 	lw	s2,24(sp)
  a0:	8fb10014 	lw	s1,20(sp)
  a4:	8fb00010 	lw	s0,16(sp)
  a8:	03e00008 	jr	ra
  ac:	27bd0020 	addiu	sp,sp,32
  b0:	8e02014c 	lw	v0,332(s0)
  b4:	8e250050 	lw	a1,80(s1)
  b8:	0040f809 	jalr	v0
  bc:	02002021 	move	a0,s0
  c0:	8fbf001c 	lw	ra,28(sp)
  c4:	00001821 	move	v1,zero
  c8:	00601021 	move	v0,v1
  cc:	8fb20018 	lw	s2,24(sp)
  d0:	8fb10014 	lw	s1,20(sp)
  d4:	8fb00010 	lw	s0,16(sp)
  d8:	03e00008 	jr	ra
  dc:	27bd0020 	addiu	sp,sp,32
  e0:	1000ffe0 	b	64 <sock_queue_err_skb+0x64>
  e4:	00000000 	nop

Disassembly of section .text.skb_queue_head:

00000000 <skb_queue_head>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb20018 	sw	s2,24(sp)
   8:	2492000c 	addiu	s2,a0,12
   c:	afb10014 	sw	s1,20(sp)
  10:	00808821 	move	s1,a0
  14:	02402021 	move	a0,s2
  18:	afbf001c 	sw	ra,28(sp)
  1c:	afb00010 	sw	s0,16(sp)
  20:	0c000000 	jal	0 <skb_queue_head>
			20: R_MIPS_26	_raw_spin_lock_irqsave
  24:	00a08021 	move	s0,a1
  28:	8e250000 	lw	a1,0(s1)
  2c:	ae110004 	sw	s1,4(s0)
  30:	02402021 	move	a0,s2
  34:	ae050000 	sw	a1,0(s0)
  38:	acb00004 	sw	s0,4(a1)
  3c:	8e230008 	lw	v1,8(s1)
  40:	ae300000 	sw	s0,0(s1)
  44:	00402821 	move	a1,v0
  48:	24630001 	addiu	v1,v1,1
  4c:	ae230008 	sw	v1,8(s1)
  50:	8fbf001c 	lw	ra,28(sp)
  54:	8fb20018 	lw	s2,24(sp)
  58:	8fb10014 	lw	s1,20(sp)
  5c:	8fb00010 	lw	s0,16(sp)
  60:	08000000 	j	0 <skb_queue_head>
			60: R_MIPS_26	_raw_spin_unlock_irqrestore
  64:	27bd0020 	addiu	sp,sp,32

Disassembly of section .text.skb_dequeue_tail:

00000000 <skb_dequeue_tail>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb20018 	sw	s2,24(sp)
   8:	2492000c 	addiu	s2,a0,12
   c:	afb10014 	sw	s1,20(sp)
  10:	00808821 	move	s1,a0
  14:	afb00010 	sw	s0,16(sp)
  18:	afbf001c 	sw	ra,28(sp)
  1c:	0c000000 	jal	0 <skb_dequeue_tail>
			1c: R_MIPS_26	_raw_spin_lock_irqsave
  20:	02402021 	move	a0,s2
  24:	8e300004 	lw	s0,4(s1)
  28:	12300015 	beq	s1,s0,80 <skb_dequeue_tail+0x80>
  2c:	00402821 	move	a1,v0
  30:	1200000a 	beqz	s0,5c <skb_dequeue_tail+0x5c>
  34:	00000000 	nop
  38:	8e220008 	lw	v0,8(s1)
  3c:	2442ffff 	addiu	v0,v0,-1
  40:	ae220008 	sw	v0,8(s1)
  44:	8e030000 	lw	v1,0(s0)
  48:	8e020004 	lw	v0,4(s0)
  4c:	ae000000 	sw	zero,0(s0)
  50:	ae000004 	sw	zero,4(s0)
  54:	ac430000 	sw	v1,0(v0)
  58:	ac620004 	sw	v0,4(v1)
  5c:	0c000000 	jal	0 <skb_dequeue_tail>
			5c: R_MIPS_26	_raw_spin_unlock_irqrestore
  60:	02402021 	move	a0,s2
  64:	8fbf001c 	lw	ra,28(sp)
  68:	02001021 	move	v0,s0
  6c:	8fb20018 	lw	s2,24(sp)
  70:	8fb10014 	lw	s1,20(sp)
  74:	8fb00010 	lw	s0,16(sp)
  78:	03e00008 	jr	ra
  7c:	27bd0020 	addiu	sp,sp,32
  80:	08000017 	j	5c <skb_dequeue_tail+0x5c>
			80: R_MIPS_26	.text.skb_dequeue_tail
  84:	00008021 	move	s0,zero

Disassembly of section .text.skb_dequeue:

00000000 <skb_dequeue>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb20018 	sw	s2,24(sp)
   8:	2492000c 	addiu	s2,a0,12
   c:	afb10014 	sw	s1,20(sp)
  10:	00808821 	move	s1,a0
  14:	afb00010 	sw	s0,16(sp)
  18:	afbf001c 	sw	ra,28(sp)
  1c:	0c000000 	jal	0 <skb_dequeue>
			1c: R_MIPS_26	_raw_spin_lock_irqsave
  20:	02402021 	move	a0,s2
  24:	8e300000 	lw	s0,0(s1)
  28:	12300015 	beq	s1,s0,80 <skb_dequeue+0x80>
  2c:	00402821 	move	a1,v0
  30:	1200000a 	beqz	s0,5c <skb_dequeue+0x5c>
  34:	00000000 	nop
  38:	8e220008 	lw	v0,8(s1)
  3c:	2442ffff 	addiu	v0,v0,-1
  40:	ae220008 	sw	v0,8(s1)
  44:	8e030000 	lw	v1,0(s0)
  48:	8e020004 	lw	v0,4(s0)
  4c:	ae000000 	sw	zero,0(s0)
  50:	ae000004 	sw	zero,4(s0)
  54:	ac430000 	sw	v1,0(v0)
  58:	ac620004 	sw	v0,4(v1)
  5c:	0c000000 	jal	0 <skb_dequeue>
			5c: R_MIPS_26	_raw_spin_unlock_irqrestore
  60:	02402021 	move	a0,s2
  64:	8fbf001c 	lw	ra,28(sp)
  68:	02001021 	move	v0,s0
  6c:	8fb20018 	lw	s2,24(sp)
  70:	8fb10014 	lw	s1,20(sp)
  74:	8fb00010 	lw	s0,16(sp)
  78:	03e00008 	jr	ra
  7c:	27bd0020 	addiu	sp,sp,32
  80:	08000017 	j	5c <skb_dequeue+0x5c>
			80: R_MIPS_26	.text.skb_dequeue
  84:	00008021 	move	s0,zero

Disassembly of section .text.__copy_skb_header:

00000000 <__copy_skb_header>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb10018 	sw	s1,24(sp)
   8:	afb00014 	sw	s0,20(sp)
   c:	afbf001c 	sw	ra,28(sp)
  10:	00a08821 	move	s1,a1
  14:	8ca90048 	lw	t1,72(a1)
  18:	8ca3000c 	lw	v1,12(a1)
  1c:	8ca20008 	lw	v0,8(a1)
  20:	8e260094 	lw	a2,148(s1)
  24:	8ca50014 	lw	a1,20(a1)
  28:	8e270098 	lw	a3,152(s1)
  2c:	8e28009c 	lw	t0,156(s1)
  30:	00808021 	move	s0,a0
  34:	31240001 	andi	a0,t1,0x1
  38:	ae03000c 	sw	v1,12(s0)
  3c:	ae020008 	sw	v0,8(s0)
  40:	ae050014 	sw	a1,20(s0)
  44:	ae060094 	sw	a2,148(s0)
  48:	ae070098 	sw	a3,152(s0)
  4c:	ae08009c 	sw	t0,156(s0)
  50:	1480000a 	bnez	a0,7c <__copy_skb_header+0x7c>
  54:	ae090048 	sw	t1,72(s0)
  58:	2402fffe 	li	v0,-2
  5c:	01222024 	and	a0,t1,v0
  60:	10800006 	beqz	a0,7c <__copy_skb_header+0x7c>
  64:	00000000 	nop
  68:	c0820080 	ll	v0,128(a0)
  6c:	24420001 	addiu	v0,v0,1
  70:	e0820080 	sc	v0,128(a0)
  74:	10400052 	beqz	v0,1c0 <__copy_skb_header+0x1c0>
  78:	00000000 	nop
  7c:	8e220084 	lw	v0,132(s1)
  80:	8e23004c 	lw	v1,76(s1)
  84:	10600006 	beqz	v1,a0 <__copy_skb_header+0xa0>
  88:	ae020084 	sw	v0,132(s0)
  8c:	c0620000 	ll	v0,0(v1)
  90:	24420001 	addiu	v0,v0,1
  94:	e0620000 	sc	v0,0(v1)
  98:	1040004b 	beqz	v0,1c8 <__copy_skb_header+0x1c8>
  9c:	00000000 	nop
  a0:	ae03004c 	sw	v1,76(s0)
  a4:	26040018 	addiu	a0,s0,24
  a8:	26250018 	addiu	a1,s1,24
  ac:	0c000000 	jal	0 <__copy_skb_header>
			ac: R_MIPS_26	memcpy
  b0:	24060030 	li	a2,48
  b4:	8e24005c 	lw	a0,92(s1)
  b8:	8e030064 	lw	v1,100(s0)
  bc:	ae04005c 	sw	a0,92(s0)
  c0:	8e220064 	lw	v0,100(s1)
  c4:	7c4207c0 	ext	v0,v0,0x1f,0x1
  c8:	7c43ffc4 	ins	v1,v0,0x1f,0x1
  cc:	ae030064 	sw	v1,100(s0)
  d0:	8e220064 	lw	v0,100(s1)
  d4:	7c421540 	ext	v0,v0,0x15,0x3
  d8:	7c43bd44 	ins	v1,v0,0x15,0x3
  dc:	ae030064 	sw	v1,100(s0)
  e0:	8e220064 	lw	v0,100(s1)
  e4:	7c420f00 	ext	v0,v0,0x1c,0x2
  e8:	7c43ef04 	ins	v1,v0,0x1c,0x2
  ec:	ae030064 	sw	v1,100(s0)
  f0:	96220088 	lhu	v0,136(s1)
  f4:	8e230060 	lw	v1,96(s1)
  f8:	a6020088 	sh	v0,136(s0)
  fc:	ae030060 	sw	v1,96(s0)
 100:	8e220088 	lw	v0,136(s1)
 104:	8e030088 	lw	v1,136(s0)
 108:	7c420340 	ext	v0,v0,0xd,0x1
 10c:	7c436b44 	ins	v1,v0,0xd,0x1
 110:	ae030088 	sw	v1,136(s0)
 114:	8e220074 	lw	v0,116(s1)
 118:	96240066 	lhu	a0,102(s1)
 11c:	8e25008c 	lw	a1,140(s1)
 120:	ae020074 	sw	v0,116(s0)
 124:	8e23007c 	lw	v1,124(s1)
 128:	8e220074 	lw	v0,116(s1)
 12c:	a6040066 	sh	a0,102(s0)
 130:	ae05008c 	sw	a1,140(s0)
 134:	10400006 	beqz	v0,150 <__copy_skb_header+0x150>
 138:	ae03007c 	sw	v1,124(s0)
 13c:	c0430000 	ll	v1,0(v0)
 140:	24630001 	addiu	v1,v1,1
 144:	e0430000 	sc	v1,0(v0)
 148:	10600021 	beqz	v1,1d0 <__copy_skb_header+0x1d0>
 14c:	00000000 	nop
 150:	8e220064 	lw	v0,100(s1)
 154:	8e030064 	lw	v1,100(s0)
 158:	7c421600 	ext	v0,v0,0x18,0x3
 15c:	7c43d604 	ins	v1,v0,0x18,0x3
 160:	ae030064 	sw	v1,100(s0)
 164:	8e220078 	lw	v0,120(s1)
 168:	ae020078 	sw	v0,120(s0)
 16c:	8e220078 	lw	v0,120(s1)
 170:	10400006 	beqz	v0,18c <__copy_skb_header+0x18c>
 174:	00000000 	nop
 178:	c04300b4 	ll	v1,180(v0)
 17c:	24630001 	addiu	v1,v1,1
 180:	e04300b4 	sc	v1,180(v0)
 184:	10600014 	beqz	v1,1d8 <__copy_skb_header+0x1d8>
 188:	00000000 	nop
 18c:	96220090 	lhu	v0,144(s1)
 190:	96230080 	lhu	v1,128(s1)
 194:	96240082 	lhu	a0,130(s1)
 198:	a6020090 	sh	v0,144(s0)
 19c:	a6030080 	sh	v1,128(s0)
 1a0:	a6040082 	sh	a0,130(s0)
 1a4:	ae000070 	sw	zero,112(s0)
 1a8:	ae00006c 	sw	zero,108(s0)
 1ac:	8fbf001c 	lw	ra,28(sp)
 1b0:	8fb10018 	lw	s1,24(sp)
 1b4:	8fb00014 	lw	s0,20(sp)
 1b8:	03e00008 	jr	ra
 1bc:	27bd0020 	addiu	sp,sp,32
 1c0:	1000ffa9 	b	68 <__copy_skb_header+0x68>
 1c4:	00000000 	nop
 1c8:	1000ffb0 	b	8c <__copy_skb_header+0x8c>
 1cc:	00000000 	nop
 1d0:	1000ffda 	b	13c <__copy_skb_header+0x13c>
 1d4:	00000000 	nop
 1d8:	1000ffe7 	b	178 <__copy_skb_header+0x178>
 1dc:	00000000 	nop

Disassembly of section .text.copy_skb_header:

00000000 <copy_skb_header>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb20018 	sw	s2,24(sp)
   8:	afb10014 	sw	s1,20(sp)
   c:	afb00010 	sw	s0,16(sp)
  10:	afbf001c 	sw	ra,28(sp)
  14:	8c8300ac 	lw	v1,172(a0)
  18:	8ca200ac 	lw	v0,172(a1)
  1c:	00808821 	move	s1,a0
  20:	00a09021 	move	s2,a1
  24:	0c000000 	jal	0 <copy_skb_header>
			24: R_MIPS_26	.text.__copy_skb_header
  28:	00628023 	subu	s0,v1,v0
  2c:	8e220094 	lw	v0,148(s1)
  30:	8e230098 	lw	v1,152(s1)
  34:	8e24009c 	lw	a0,156(s1)
  38:	00501021 	addu	v0,v0,s0
  3c:	00701821 	addu	v1,v1,s0
  40:	ae220094 	sw	v0,148(s1)
  44:	10800003 	beqz	a0,54 <copy_skb_header+0x54>
  48:	ae230098 	sw	v1,152(s1)
  4c:	00901021 	addu	v0,a0,s0
  50:	ae22009c 	sw	v0,156(s1)
  54:	8e4300a4 	lw	v1,164(s2)
  58:	8e2400a4 	lw	a0,164(s1)
  5c:	94620002 	lhu	v0,2(v1)
  60:	a4820002 	sh	v0,2(a0)
  64:	8e4300a4 	lw	v1,164(s2)
  68:	8e2400a4 	lw	a0,164(s1)
  6c:	94620004 	lhu	v0,4(v1)
  70:	a4820004 	sh	v0,4(a0)
  74:	8e4300a4 	lw	v1,164(s2)
  78:	8e2400a4 	lw	a0,164(s1)
  7c:	94620006 	lhu	v0,6(v1)
  80:	a4820006 	sh	v0,6(a0)
  84:	8fbf001c 	lw	ra,28(sp)
  88:	8fb20018 	lw	s2,24(sp)
  8c:	8fb10014 	lw	s1,20(sp)
  90:	8fb00010 	lw	s0,16(sp)
  94:	03e00008 	jr	ra
  98:	27bd0020 	addiu	sp,sp,32

Disassembly of section .text.__skb_clone:

00000000 <__skb_clone>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb10018 	sw	s1,24(sp)
   8:	afb00014 	sw	s0,20(sp)
   c:	00a08821 	move	s1,a1
  10:	afbf001c 	sw	ra,28(sp)
  14:	ac800004 	sw	zero,4(a0)
  18:	ac800000 	sw	zero,0(a0)
  1c:	ac800010 	sw	zero,16(a0)
  20:	0c000000 	jal	0 <__skb_clone>
			20: R_MIPS_26	.text.__copy_skb_header
  24:	00808021 	move	s0,a0
  28:	8e220050 	lw	v0,80(s1)
  2c:	8e230054 	lw	v1,84(s1)
  30:	96240058 	lhu	a0,88(s1)
  34:	ae020050 	sw	v0,80(s0)
  38:	ae030054 	sw	v1,84(s0)
  3c:	a6040058 	sh	a0,88(s0)
  40:	8e220064 	lw	v0,100(s1)
  44:	7c4206c0 	ext	v0,v0,0x1b,0x1
  48:	14400026 	bnez	v0,e4 <__skb_clone+0xe4>
  4c:	00000000 	nop
  50:	9623005a 	lhu	v1,90(s1)
  54:	8e020064 	lw	v0,100(s0)
  58:	24070001 	li	a3,1
  5c:	a603005a 	sh	v1,90(s0)
  60:	7ce2f784 	ins	v0,a3,0x1e,0x1
  64:	7c02dec4 	ins	v0,zero,0x1b,0x1
  68:	ae020064 	sw	v0,100(s0)
  6c:	8e2300a4 	lw	v1,164(s1)
  70:	8e2200a0 	lw	v0,160(s1)
  74:	8e2400a8 	lw	a0,168(s1)
  78:	8e2500ac 	lw	a1,172(s1)
  7c:	8e2600b0 	lw	a2,176(s1)
  80:	ae0300a4 	sw	v1,164(s0)
  84:	ae0200a0 	sw	v0,160(s0)
  88:	ae00006c 	sw	zero,108(s0)
  8c:	ae0400a8 	sw	a0,168(s0)
  90:	ae0500ac 	sw	a1,172(s0)
  94:	ae0600b0 	sw	a2,176(s0)
  98:	ae000068 	sw	zero,104(s0)
  9c:	ae000070 	sw	zero,112(s0)
  a0:	ae20006c 	sw	zero,108(s1)
  a4:	ae0700b4 	sw	a3,180(s0)
  a8:	8e2200a4 	lw	v0,164(s1)
  ac:	c0430028 	ll	v1,40(v0)
  b0:	24630001 	addiu	v1,v1,1
  b4:	e0430028 	sc	v1,40(v0)
  b8:	1060000f 	beqz	v1,f8 <__skb_clone+0xf8>
  bc:	00000000 	nop
  c0:	8e230064 	lw	v1,100(s1)
  c4:	02001021 	move	v0,s0
  c8:	7ce3f784 	ins	v1,a3,0x1e,0x1
  cc:	ae230064 	sw	v1,100(s1)
  d0:	8fbf001c 	lw	ra,28(sp)
  d4:	8fb10018 	lw	s1,24(sp)
  d8:	8fb00014 	lw	s0,20(sp)
  dc:	03e00008 	jr	ra
  e0:	27bd0020 	addiu	sp,sp,32
  e4:	8e2300a8 	lw	v1,168(s1)
  e8:	8e2200ac 	lw	v0,172(s1)
  ec:	00431023 	subu	v0,v0,v1
  f0:	08000015 	j	54 <__skb_clone+0x54>
			f0: R_MIPS_26	.text.__skb_clone
  f4:	3043ffff 	andi	v1,v0,0xffff
  f8:	1000ffec 	b	ac <__skb_clone+0xac>
  fc:	00000000 	nop

Disassembly of section .text.skb_store_bits:

00000000 <skb_store_bits>:
   0:	27bdffc8 	addiu	sp,sp,-56
   4:	afb7002c 	sw	s7,44(sp)
   8:	afb50024 	sw	s5,36(sp)
   c:	afb20018 	sw	s2,24(sp)
  10:	afb10014 	sw	s1,20(sp)
  14:	afbf0034 	sw	ra,52(sp)
  18:	afbe0030 	sw	s8,48(sp)
  1c:	afb60028 	sw	s6,40(sp)
  20:	afb40020 	sw	s4,32(sp)
  24:	afb3001c 	sw	s3,28(sp)
  28:	afb00010 	sw	s0,16(sp)
  2c:	0080b821 	move	s7,a0
  30:	8c840050 	lw	a0,80(a0)
  34:	00e08821 	move	s1,a3
  38:	00a09021 	move	s2,a1
  3c:	00871023 	subu	v0,a0,a3
  40:	0045102a 	slt	v0,v0,a1
  44:	00c0a821 	move	s5,a2
  48:	14400061 	bnez	v0,1d0 <skb_store_bits+0x1d0>
  4c:	8ee30054 	lw	v1,84(s7)
  50:	00839823 	subu	s3,a0,v1
  54:	02658023 	subu	s0,s3,a1
  58:	1a00000b 	blez	s0,88 <skb_store_bits+0x88>
  5c:	00f0102a 	slt	v0,a3,s0
  60:	14400068 	bnez	v0,204 <skb_store_bits+0x204>
  64:	00c02821 	move	a1,a2
  68:	8ee400ac 	lw	a0,172(s7)
  6c:	00f08823 	subu	s1,a3,s0
  70:	00922021 	addu	a0,a0,s2
  74:	0c000000 	jal	0 <skb_store_bits>
			74: R_MIPS_26	memcpy
  78:	02003021 	move	a2,s0
  7c:	12200065 	beqz	s1,214 <skb_store_bits+0x214>
  80:	02b0a821 	addu	s5,s5,s0
  84:	02509021 	addu	s2,s2,s0
  88:	8ef000a4 	lw	s0,164(s7)
  8c:	96020000 	lhu	v0,0(s0)
  90:	1040002f 	beqz	v0,150 <skb_store_bits+0x150>
  94:	0000a021 	move	s4,zero
  98:	3c1e8000 	lui	s8,0x8000
  9c:	02321021 	addu	v0,s1,s2
  a0:	0053102a 	slt	v0,v0,s3
  a4:	14400068 	bnez	v0,248 <skb_store_bits+0x248>
  a8:	3c040000 	lui	a0,0x0
			a8: R_MIPS_HI16	$LC3
  ac:	00141880 	sll	v1,s4,0x2
  b0:	00141100 	sll	v0,s4,0x4
  b4:	00431023 	subu	v0,v0,v1
  b8:	02022821 	addu	a1,s0,v0
  bc:	8ca30038 	lw	v1,56(a1)
  c0:	02208021 	move	s0,s1
  c4:	0263b021 	addu	s6,s3,v1
  c8:	02d21023 	subu	v0,s6,s2
  cc:	0222182a 	slt	v1,s1,v0
  d0:	18400019 	blez	v0,138 <skb_store_bits+0x138>
  d4:	0043800a 	movz	s0,v0,v1
  d8:	8f820014 	lw	v0,20(gp)
  dc:	8ca40030 	lw	a0,48(a1)
  e0:	24420001 	addiu	v0,v0,1
  e4:	af820014 	sw	v0,20(gp)
  e8:	3c020000 	lui	v0,0x0
			e8: R_MIPS_HI16	mem_map
  ec:	8c430000 	lw	v1,0(v0)
			ec: R_MIPS_LO16	mem_map
  f0:	8ca20034 	lw	v0,52(a1)
  f4:	02003021 	move	a2,s0
  f8:	00832023 	subu	a0,a0,v1
  fc:	00042143 	sra	a0,a0,0x5
 100:	02421021 	addu	v0,s2,v0
 104:	00042300 	sll	a0,a0,0xc
 108:	00531023 	subu	v0,v0,s3
 10c:	009e2021 	addu	a0,a0,s8
 110:	02a02821 	move	a1,s5
 114:	0c000000 	jal	0 <skb_store_bits>
			114: R_MIPS_26	memcpy
 118:	00822021 	addu	a0,a0,v0
 11c:	8f820014 	lw	v0,20(gp)
 120:	2442ffff 	addiu	v0,v0,-1
 124:	af820014 	sw	v0,20(gp)
 128:	02308823 	subu	s1,s1,s0
 12c:	02b0a821 	addu	s5,s5,s0
 130:	12200038 	beqz	s1,214 <skb_store_bits+0x214>
 134:	02509021 	addu	s2,s2,s0
 138:	8ef000a4 	lw	s0,164(s7)
 13c:	26940001 	addiu	s4,s4,1
 140:	96020000 	lhu	v0,0(s0)
 144:	0282102a 	slt	v0,s4,v0
 148:	1440ffd4 	bnez	v0,9c <skb_store_bits+0x9c>
 14c:	02c09821 	move	s3,s6
 150:	8e140010 	lw	s4,16(s0)
 154:	1280001c 	beqz	s4,1c8 <skb_store_bits+0x1c8>
 158:	3c020000 	lui	v0,0x0
			158: R_MIPS_HI16	$LC3
 15c:	24560000 	addiu	s6,v0,0
			15c: R_MIPS_LO16	$LC3
 160:	02321021 	addu	v0,s1,s2
 164:	0053102a 	slt	v0,v0,s3
 168:	1440003c 	bnez	v0,25c <skb_store_bits+0x25c>
 16c:	02c02021 	move	a0,s6
 170:	8e820050 	lw	v0,80(s4)
 174:	02532823 	subu	a1,s2,s3
 178:	02208021 	move	s0,s1
 17c:	02621021 	addu	v0,s3,v0
 180:	00409821 	move	s3,v0
 184:	00521023 	subu	v0,v0,s2
 188:	0222182a 	slt	v1,s1,v0
 18c:	0043800a 	movz	s0,v0,v1
 190:	02802021 	move	a0,s4
 194:	02a03021 	move	a2,s5
 198:	18400008 	blez	v0,1bc <skb_store_bits+0x1bc>
 19c:	02003821 	move	a3,s0
 1a0:	0c000000 	jal	0 <skb_store_bits>
			1a0: R_MIPS_26	skb_store_bits
 1a4:	02b0a821 	addu	s5,s5,s0
 1a8:	02308823 	subu	s1,s1,s0
 1ac:	14400008 	bnez	v0,1d0 <skb_store_bits+0x1d0>
 1b0:	02509021 	addu	s2,s2,s0
 1b4:	12200018 	beqz	s1,218 <skb_store_bits+0x218>
 1b8:	8fbf0034 	lw	ra,52(sp)
 1bc:	8e940000 	lw	s4,0(s4)
 1c0:	1680ffe8 	bnez	s4,164 <skb_store_bits+0x164>
 1c4:	02321021 	addu	v0,s1,s2
 1c8:	12200013 	beqz	s1,218 <skb_store_bits+0x218>
 1cc:	8fbf0034 	lw	ra,52(sp)
 1d0:	8fbf0034 	lw	ra,52(sp)
 1d4:	2402fff2 	li	v0,-14
 1d8:	8fbe0030 	lw	s8,48(sp)
 1dc:	8fb7002c 	lw	s7,44(sp)
 1e0:	8fb60028 	lw	s6,40(sp)
 1e4:	8fb50024 	lw	s5,36(sp)
 1e8:	8fb40020 	lw	s4,32(sp)
 1ec:	8fb3001c 	lw	s3,28(sp)
 1f0:	8fb20018 	lw	s2,24(sp)
 1f4:	8fb10014 	lw	s1,20(sp)
 1f8:	8fb00010 	lw	s0,16(sp)
 1fc:	03e00008 	jr	ra
 200:	27bd0038 	addiu	sp,sp,56
 204:	8ee400ac 	lw	a0,172(s7)
 208:	00e03021 	move	a2,a3
 20c:	0c000000 	jal	0 <skb_store_bits>
			20c: R_MIPS_26	memcpy
 210:	00922021 	addu	a0,a0,s2
 214:	8fbf0034 	lw	ra,52(sp)
 218:	00001021 	move	v0,zero
 21c:	8fbe0030 	lw	s8,48(sp)
 220:	8fb7002c 	lw	s7,44(sp)
 224:	8fb60028 	lw	s6,40(sp)
 228:	8fb50024 	lw	s5,36(sp)
 22c:	8fb40020 	lw	s4,32(sp)
 230:	8fb3001c 	lw	s3,28(sp)
 234:	8fb20018 	lw	s2,24(sp)
 238:	8fb10014 	lw	s1,20(sp)
 23c:	8fb00010 	lw	s0,16(sp)
 240:	03e00008 	jr	ra
 244:	27bd0038 	addiu	sp,sp,56
 248:	24840000 	addiu	a0,a0,0
			248: R_MIPS_LO16	$LC3
 24c:	0c000000 	jal	0 <skb_store_bits>
			24c: R_MIPS_26	warn_slowpath_null
 250:	240506b2 	li	a1,1714
 254:	0800002c 	j	b0 <skb_store_bits+0xb0>
			254: R_MIPS_26	.text.skb_store_bits
 258:	00141880 	sll	v1,s4,0x2
 25c:	0c000000 	jal	0 <skb_store_bits>
			25c: R_MIPS_26	warn_slowpath_null
 260:	240506cb 	li	a1,1739
 264:	0800005d 	j	174 <skb_store_bits+0x174>
			264: R_MIPS_26	.text.skb_store_bits
 268:	8e820050 	lw	v0,80(s4)

Disassembly of section .text.skb_copy_bits:

00000000 <skb_copy_bits>:
   0:	27bdffc8 	addiu	sp,sp,-56
   4:	afb7002c 	sw	s7,44(sp)
   8:	afb50024 	sw	s5,36(sp)
   c:	afb20018 	sw	s2,24(sp)
  10:	afb10014 	sw	s1,20(sp)
  14:	afbf0034 	sw	ra,52(sp)
  18:	afbe0030 	sw	s8,48(sp)
  1c:	afb60028 	sw	s6,40(sp)
  20:	afb40020 	sw	s4,32(sp)
  24:	afb3001c 	sw	s3,28(sp)
  28:	afb00010 	sw	s0,16(sp)
  2c:	0080b821 	move	s7,a0
  30:	8c840050 	lw	a0,80(a0)
  34:	00e08821 	move	s1,a3
  38:	00a09021 	move	s2,a1
  3c:	00871023 	subu	v0,a0,a3
  40:	0045102a 	slt	v0,v0,a1
  44:	00c0a821 	move	s5,a2
  48:	14400063 	bnez	v0,1d8 <skb_copy_bits+0x1d8>
  4c:	8ee30054 	lw	v1,84(s7)
  50:	00839823 	subu	s3,a0,v1
  54:	02658023 	subu	s0,s3,a1
  58:	1a00000b 	blez	s0,88 <skb_copy_bits+0x88>
  5c:	00f0102a 	slt	v0,a3,s0
  60:	1440006a 	bnez	v0,20c <skb_copy_bits+0x20c>
  64:	00c02021 	move	a0,a2
  68:	8ee500ac 	lw	a1,172(s7)
  6c:	00f08823 	subu	s1,a3,s0
  70:	00b22821 	addu	a1,a1,s2
  74:	0c000000 	jal	0 <skb_copy_bits>
			74: R_MIPS_26	memcpy
  78:	02003021 	move	a2,s0
  7c:	12200067 	beqz	s1,21c <skb_copy_bits+0x21c>
  80:	02b0a821 	addu	s5,s5,s0
  84:	02509021 	addu	s2,s2,s0
  88:	8ee400a4 	lw	a0,164(s7)
  8c:	94820000 	lhu	v0,0(a0)
  90:	10400031 	beqz	v0,158 <skb_copy_bits+0x158>
  94:	0000a021 	move	s4,zero
  98:	3c1e8000 	lui	s8,0x8000
  9c:	02321021 	addu	v0,s1,s2
  a0:	0053102a 	slt	v0,v0,s3
  a4:	1440006a 	bnez	v0,250 <skb_copy_bits+0x250>
  a8:	00000000 	nop
  ac:	00141880 	sll	v1,s4,0x2
  b0:	00141100 	sll	v0,s4,0x4
  b4:	00433823 	subu	a3,v0,v1
  b8:	00872821 	addu	a1,a0,a3
  bc:	8ca30038 	lw	v1,56(a1)
  c0:	02208021 	move	s0,s1
  c4:	0263b021 	addu	s6,s3,v1
  c8:	02d21023 	subu	v0,s6,s2
  cc:	0222182a 	slt	v1,s1,v0
  d0:	1840001c 	blez	v0,144 <skb_copy_bits+0x144>
  d4:	0043800a 	movz	s0,v0,v1
  d8:	8f820014 	lw	v0,20(gp)
  dc:	8ca50030 	lw	a1,48(a1)
  e0:	24420001 	addiu	v0,v0,1
  e4:	af820014 	sw	v0,20(gp)
  e8:	8ee200a4 	lw	v0,164(s7)
  ec:	3c030000 	lui	v1,0x0
			ec: R_MIPS_HI16	mem_map
  f0:	8c660000 	lw	a2,0(v1)
			f0: R_MIPS_LO16	mem_map
  f4:	00471021 	addu	v0,v0,a3
  f8:	8c430034 	lw	v1,52(v0)
  fc:	00a62823 	subu	a1,a1,a2
 100:	00052943 	sra	a1,a1,0x5
 104:	02431821 	addu	v1,s2,v1
 108:	00052b00 	sll	a1,a1,0xc
 10c:	00731823 	subu	v1,v1,s3
 110:	00be2821 	addu	a1,a1,s8
 114:	02a02021 	move	a0,s5
 118:	00a32821 	addu	a1,a1,v1
 11c:	0c000000 	jal	0 <skb_copy_bits>
			11c: R_MIPS_26	memcpy
 120:	02003021 	move	a2,s0
 124:	8f820014 	lw	v0,20(gp)
 128:	2442ffff 	addiu	v0,v0,-1
 12c:	af820014 	sw	v0,20(gp)
 130:	02308823 	subu	s1,s1,s0
 134:	02b0a821 	addu	s5,s5,s0
 138:	12200038 	beqz	s1,21c <skb_copy_bits+0x21c>
 13c:	02509021 	addu	s2,s2,s0
 140:	8ee400a4 	lw	a0,164(s7)
 144:	94820000 	lhu	v0,0(a0)
 148:	26940001 	addiu	s4,s4,1
 14c:	0282102a 	slt	v0,s4,v0
 150:	1440ffd2 	bnez	v0,9c <skb_copy_bits+0x9c>
 154:	02c09821 	move	s3,s6
 158:	8c940010 	lw	s4,16(a0)
 15c:	1280001c 	beqz	s4,1d0 <skb_copy_bits+0x1d0>
 160:	3c020000 	lui	v0,0x0
			160: R_MIPS_HI16	$LC3
 164:	24560000 	addiu	s6,v0,0
			164: R_MIPS_LO16	$LC3
 168:	02511021 	addu	v0,s2,s1
 16c:	0053102a 	slt	v0,v0,s3
 170:	1440003d 	bnez	v0,268 <skb_copy_bits+0x268>
 174:	02c02021 	move	a0,s6
 178:	8e820050 	lw	v0,80(s4)
 17c:	02532823 	subu	a1,s2,s3
 180:	02208021 	move	s0,s1
 184:	02621021 	addu	v0,s3,v0
 188:	00409821 	move	s3,v0
 18c:	00521023 	subu	v0,v0,s2
 190:	0222182a 	slt	v1,s1,v0
 194:	0043800a 	movz	s0,v0,v1
 198:	02802021 	move	a0,s4
 19c:	02a03021 	move	a2,s5
 1a0:	18400008 	blez	v0,1c4 <skb_copy_bits+0x1c4>
 1a4:	02003821 	move	a3,s0
 1a8:	0c000000 	jal	0 <skb_copy_bits>
			1a8: R_MIPS_26	skb_copy_bits
 1ac:	02b0a821 	addu	s5,s5,s0
 1b0:	02308823 	subu	s1,s1,s0
 1b4:	14400008 	bnez	v0,1d8 <skb_copy_bits+0x1d8>
 1b8:	02509021 	addu	s2,s2,s0
 1bc:	12200018 	beqz	s1,220 <skb_copy_bits+0x220>
 1c0:	8fbf0034 	lw	ra,52(sp)
 1c4:	8e940000 	lw	s4,0(s4)
 1c8:	1680ffe8 	bnez	s4,16c <skb_copy_bits+0x16c>
 1cc:	02511021 	addu	v0,s2,s1
 1d0:	12200013 	beqz	s1,220 <skb_copy_bits+0x220>
 1d4:	8fbf0034 	lw	ra,52(sp)
 1d8:	8fbf0034 	lw	ra,52(sp)
 1dc:	2402fff2 	li	v0,-14
 1e0:	8fbe0030 	lw	s8,48(sp)
 1e4:	8fb7002c 	lw	s7,44(sp)
 1e8:	8fb60028 	lw	s6,40(sp)
 1ec:	8fb50024 	lw	s5,36(sp)
 1f0:	8fb40020 	lw	s4,32(sp)
 1f4:	8fb3001c 	lw	s3,28(sp)
 1f8:	8fb20018 	lw	s2,24(sp)
 1fc:	8fb10014 	lw	s1,20(sp)
 200:	8fb00010 	lw	s0,16(sp)
 204:	03e00008 	jr	ra
 208:	27bd0038 	addiu	sp,sp,56
 20c:	8ee500ac 	lw	a1,172(s7)
 210:	00e03021 	move	a2,a3
 214:	0c000000 	jal	0 <skb_copy_bits>
			214: R_MIPS_26	memcpy
 218:	00b22821 	addu	a1,a1,s2
 21c:	8fbf0034 	lw	ra,52(sp)
 220:	00001021 	move	v0,zero
 224:	8fbe0030 	lw	s8,48(sp)
 228:	8fb7002c 	lw	s7,44(sp)
 22c:	8fb60028 	lw	s6,40(sp)
 230:	8fb50024 	lw	s5,36(sp)
 234:	8fb40020 	lw	s4,32(sp)
 238:	8fb3001c 	lw	s3,28(sp)
 23c:	8fb20018 	lw	s2,24(sp)
 240:	8fb10014 	lw	s1,20(sp)
 244:	8fb00010 	lw	s0,16(sp)
 248:	03e00008 	jr	ra
 24c:	27bd0038 	addiu	sp,sp,56
 250:	3c040000 	lui	a0,0x0
			250: R_MIPS_HI16	$LC3
 254:	24840000 	addiu	a0,a0,0
			254: R_MIPS_LO16	$LC3
 258:	0c000000 	jal	0 <skb_copy_bits>
			258: R_MIPS_26	warn_slowpath_null
 25c:	2405057f 	li	a1,1407
 260:	0800002b 	j	ac <skb_copy_bits+0xac>
			260: R_MIPS_26	.text.skb_copy_bits
 264:	8ee400a4 	lw	a0,164(s7)
 268:	0c000000 	jal	0 <skb_copy_bits>
			268: R_MIPS_26	warn_slowpath_null
 26c:	24050599 	li	a1,1433
 270:	0800005f 	j	17c <skb_copy_bits+0x17c>
			270: R_MIPS_26	.text.skb_copy_bits
 274:	8e820050 	lw	v0,80(s4)

Disassembly of section .text.skb_pull_rcsum:

00000000 <skb_pull_rcsum>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb20018 	sw	s2,24(sp)
   8:	afb10014 	sw	s1,20(sp)
   c:	afbf001c 	sw	ra,28(sp)
  10:	afb00010 	sw	s0,16(sp)
  14:	8c820050 	lw	v0,80(a0)
  18:	00808821 	move	s1,a0
  1c:	00a09021 	move	s2,a1
  20:	0045182b 	sltu	v1,v0,a1
  24:	00038036 	tne	zero,v1,0x200
  28:	8c840054 	lw	a0,84(a0)
  2c:	00451023 	subu	v0,v0,a1
  30:	ae220050 	sw	v0,80(s1)
  34:	0044102b 	sltu	v0,v0,a0
  38:	00028036 	tne	zero,v0,0x200
  3c:	8e230064 	lw	v1,100(s1)
  40:	3c023000 	lui	v0,0x3000
  44:	00621824 	and	v1,v1,v0
  48:	3c022000 	lui	v0,0x2000
  4c:	10620009 	beq	v1,v0,74 <skb_pull_rcsum+0x74>
  50:	8e2400ac 	lw	a0,172(s1)
  54:	00921021 	addu	v0,a0,s2
  58:	ae2200ac 	sw	v0,172(s1)
  5c:	8fbf001c 	lw	ra,28(sp)
  60:	8fb20018 	lw	s2,24(sp)
  64:	8fb10014 	lw	s1,20(sp)
  68:	8fb00010 	lw	s0,16(sp)
  6c:	03e00008 	jr	ra
  70:	27bd0020 	addiu	sp,sp,32
  74:	8e30005c 	lw	s0,92(s1)
  78:	0c000000 	jal	0 <skb_pull_rcsum>
			78: R_MIPS_26	csum_partial
  7c:	00003021 	move	a2,zero
  80:	00021027 	nor	v0,zero,v0
  84:	00508021 	addu	s0,v0,s0
  88:	0202102b 	sltu	v0,s0,v0
  8c:	00501021 	addu	v0,v0,s0
  90:	8e2400ac 	lw	a0,172(s1)
  94:	08000015 	j	54 <skb_pull_rcsum+0x54>
			94: R_MIPS_26	.text.skb_pull_rcsum
  98:	ae22005c 	sw	v0,92(s1)

Disassembly of section .text.skb_checksum:

00000000 <skb_checksum>:
   0:	27bdffc8 	addiu	sp,sp,-56
   4:	afbe0030 	sw	s8,48(sp)
   8:	afb7002c 	sw	s7,44(sp)
   c:	afb50024 	sw	s5,36(sp)
  10:	afb3001c 	sw	s3,28(sp)
  14:	afb20018 	sw	s2,24(sp)
  18:	afb10014 	sw	s1,20(sp)
  1c:	afb00010 	sw	s0,16(sp)
  20:	afbf0034 	sw	ra,52(sp)
  24:	afb60028 	sw	s6,40(sp)
  28:	afb40020 	sw	s4,32(sp)
  2c:	8c830050 	lw	v1,80(a0)
  30:	8c820054 	lw	v0,84(a0)
  34:	0080f021 	move	s8,a0
  38:	00a09021 	move	s2,a1
  3c:	00629823 	subu	s3,v1,v0
  40:	02658023 	subu	s0,s3,a1
  44:	00c08821 	move	s1,a2
  48:	00e0b821 	move	s7,a3
  4c:	1a00000e 	blez	s0,88 <skb_checksum+0x88>
  50:	0000a821 	move	s5,zero
  54:	00d0102a 	slt	v0,a2,s0
  58:	14400083 	bnez	v0,268 <skb_checksum+0x268>
  5c:	8fbf0034 	lw	ra,52(sp)
  60:	8c8400ac 	lw	a0,172(a0)
  64:	00e03021 	move	a2,a3
  68:	02308823 	subu	s1,s1,s0
  6c:	00852021 	addu	a0,a0,a1
  70:	0c000000 	jal	0 <skb_checksum>
			70: R_MIPS_26	csum_partial
  74:	02002821 	move	a1,s0
  78:	1220006e 	beqz	s1,234 <skb_checksum+0x234>
  7c:	0040b821 	move	s7,v0
  80:	02509021 	addu	s2,s2,s0
  84:	0200a821 	move	s5,s0
  88:	8fc400a4 	lw	a0,164(s8)
  8c:	94820000 	lhu	v0,0(a0)
  90:	1040003e 	beqz	v0,18c <skb_checksum+0x18c>
  94:	0000a021 	move	s4,zero
  98:	02321021 	addu	v0,s1,s2
  9c:	0053102a 	slt	v0,v0,s3
  a0:	14400084 	bnez	v0,2b4 <skb_checksum+0x2b4>
  a4:	00000000 	nop
  a8:	00141880 	sll	v1,s4,0x2
  ac:	00141100 	sll	v0,s4,0x4
  b0:	00431023 	subu	v0,v0,v1
  b4:	00822821 	addu	a1,a0,v0
  b8:	8ca30038 	lw	v1,56(a1)
  bc:	02208021 	move	s0,s1
  c0:	0263b021 	addu	s6,s3,v1
  c4:	02d21023 	subu	v0,s6,s2
  c8:	0222182a 	slt	v1,s1,v0
  cc:	1840002a 	blez	v0,178 <skb_checksum+0x178>
  d0:	0043800a 	movz	s0,v0,v1
  d4:	8f820014 	lw	v0,20(gp)
  d8:	8ca40030 	lw	a0,48(a1)
  dc:	24420001 	addiu	v0,v0,1
  e0:	af820014 	sw	v0,20(gp)
  e4:	3c020000 	lui	v0,0x0
			e4: R_MIPS_HI16	mem_map
  e8:	8c430000 	lw	v1,0(v0)
			e8: R_MIPS_LO16	mem_map
  ec:	8ca20034 	lw	v0,52(a1)
  f0:	00003021 	move	a2,zero
  f4:	00832023 	subu	a0,a0,v1
  f8:	00042143 	sra	a0,a0,0x5
  fc:	3c038000 	lui	v1,0x8000
 100:	02421021 	addu	v0,s2,v0
 104:	00042300 	sll	a0,a0,0xc
 108:	00531023 	subu	v0,v0,s3
 10c:	00832021 	addu	a0,a0,v1
 110:	02002821 	move	a1,s0
 114:	0c000000 	jal	0 <skb_checksum>
			114: R_MIPS_26	csum_partial
 118:	00822021 	addu	a0,a0,v0
 11c:	00402021 	move	a0,v0
 120:	8f820014 	lw	v0,20(gp)
 124:	2442ffff 	addiu	v0,v0,-1
 128:	af820014 	sw	v0,20(gp)
 12c:	3c0500ff 	lui	a1,0xff
 130:	34a500ff 	ori	a1,a1,0xff
 134:	00851024 	and	v0,a0,a1
 138:	00022a00 	sll	a1,v0,0x8
 13c:	3c0200ff 	lui	v0,0xff
 140:	344200ff 	ori	v0,v0,0xff
 144:	00041a02 	srl	v1,a0,0x8
 148:	00621824 	and	v1,v1,v0
 14c:	32a20001 	andi	v0,s5,0x1
 150:	02308823 	subu	s1,s1,s0
 154:	02509021 	addu	s2,s2,s0
 158:	10400002 	beqz	v0,164 <skb_checksum+0x164>
 15c:	02b0a821 	addu	s5,s5,s0
 160:	00652021 	addu	a0,v1,a1
 164:	00971821 	addu	v1,a0,s7
 168:	0064102b 	sltu	v0,v1,a0
 16c:	12200031 	beqz	s1,234 <skb_checksum+0x234>
 170:	0043b821 	addu	s7,v0,v1
 174:	8fc400a4 	lw	a0,164(s8)
 178:	94820000 	lhu	v0,0(a0)
 17c:	26940001 	addiu	s4,s4,1
 180:	0282102a 	slt	v0,s4,v0
 184:	1440ffc4 	bnez	v0,98 <skb_checksum+0x98>
 188:	02c09821 	move	s3,s6
 18c:	8c940010 	lw	s4,16(a0)
 190:	12800027 	beqz	s4,230 <skb_checksum+0x230>
 194:	3c020000 	lui	v0,0x0
			194: R_MIPS_HI16	$LC3
 198:	3c0300ff 	lui	v1,0xff
 19c:	245e0000 	addiu	s8,v0,0
			19c: R_MIPS_LO16	$LC3
 1a0:	347600ff 	ori	s6,v1,0xff
 1a4:	02511021 	addu	v0,s2,s1
 1a8:	0053102a 	slt	v0,v0,s3
 1ac:	1440003d 	bnez	v0,2a4 <skb_checksum+0x2a4>
 1b0:	03c02021 	move	a0,s8
 1b4:	8e820050 	lw	v0,80(s4)
 1b8:	02532823 	subu	a1,s2,s3
 1bc:	02208021 	move	s0,s1
 1c0:	02621021 	addu	v0,s3,v0
 1c4:	00409821 	move	s3,v0
 1c8:	00521023 	subu	v0,v0,s2
 1cc:	0222182a 	slt	v1,s1,v0
 1d0:	0043800a 	movz	s0,v0,v1
 1d4:	02802021 	move	a0,s4
 1d8:	00003821 	move	a3,zero
 1dc:	18400011 	blez	v0,224 <skb_checksum+0x224>
 1e0:	02003021 	move	a2,s0
 1e4:	0c000000 	jal	0 <skb_checksum>
			1e4: R_MIPS_26	skb_checksum
 1e8:	02308823 	subu	s1,s1,s0
 1ec:	00021a02 	srl	v1,v0,0x8
 1f0:	00402021 	move	a0,v0
 1f4:	00561024 	and	v0,v0,s6
 1f8:	00022a00 	sll	a1,v0,0x8
 1fc:	32a20001 	andi	v0,s5,0x1
 200:	02509021 	addu	s2,s2,s0
 204:	00761824 	and	v1,v1,s6
 208:	10400002 	beqz	v0,214 <skb_checksum+0x214>
 20c:	02b0a821 	addu	s5,s5,s0
 210:	00652021 	addu	a0,v1,a1
 214:	00971821 	addu	v1,a0,s7
 218:	0064102b 	sltu	v0,v1,a0
 21c:	12200005 	beqz	s1,234 <skb_checksum+0x234>
 220:	0043b821 	addu	s7,v0,v1
 224:	8e940000 	lw	s4,0(s4)
 228:	1680ffdf 	bnez	s4,1a8 <skb_checksum+0x1a8>
 22c:	02511021 	addu	v0,s2,s1
 230:	00118036 	tne	zero,s1,0x200
 234:	8fbf0034 	lw	ra,52(sp)
 238:	02e01021 	move	v0,s7
 23c:	8fbe0030 	lw	s8,48(sp)
 240:	8fb7002c 	lw	s7,44(sp)
 244:	8fb60028 	lw	s6,40(sp)
 248:	8fb50024 	lw	s5,36(sp)
 24c:	8fb40020 	lw	s4,32(sp)
 250:	8fb3001c 	lw	s3,28(sp)
 254:	8fb20018 	lw	s2,24(sp)
 258:	8fb10014 	lw	s1,20(sp)
 25c:	8fb00010 	lw	s0,16(sp)
 260:	03e00008 	jr	ra
 264:	27bd0038 	addiu	sp,sp,56
 268:	8c8400ac 	lw	a0,172(a0)
 26c:	00c02821 	move	a1,a2
 270:	00922021 	addu	a0,a0,s2
 274:	8fbe0030 	lw	s8,48(sp)
 278:	8fb7002c 	lw	s7,44(sp)
 27c:	8fb60028 	lw	s6,40(sp)
 280:	8fb50024 	lw	s5,36(sp)
 284:	8fb40020 	lw	s4,32(sp)
 288:	8fb3001c 	lw	s3,28(sp)
 28c:	8fb20018 	lw	s2,24(sp)
 290:	8fb10014 	lw	s1,20(sp)
 294:	8fb00010 	lw	s0,16(sp)
 298:	00e03021 	move	a2,a3
 29c:	08000000 	j	0 <skb_checksum>
			29c: R_MIPS_26	csum_partial
 2a0:	27bd0038 	addiu	sp,sp,56
 2a4:	0c000000 	jal	0 <skb_checksum>
			2a4: R_MIPS_26	warn_slowpath_null
 2a8:	24050715 	li	a1,1813
 2ac:	0800006e 	j	1b8 <skb_checksum+0x1b8>
			2ac: R_MIPS_26	.text.skb_checksum
 2b0:	8e820050 	lw	v0,80(s4)
 2b4:	3c040000 	lui	a0,0x0
			2b4: R_MIPS_HI16	$LC3
 2b8:	24840000 	addiu	a0,a0,0
			2b8: R_MIPS_LO16	$LC3
 2bc:	0c000000 	jal	0 <skb_checksum>
			2bc: R_MIPS_26	warn_slowpath_null
 2c0:	240506fb 	li	a1,1787
 2c4:	0800002a 	j	a8 <skb_checksum+0xa8>
			2c4: R_MIPS_26	.text.skb_checksum
 2c8:	8fc400a4 	lw	a0,164(s8)

Disassembly of section .text.skb_append_datato_frags:

00000000 <skb_append_datato_frags>:
   0:	27bdffc0 	addiu	sp,sp,-64
   4:	afb30024 	sw	s3,36(sp)
   8:	8fb30050 	lw	s3,80(sp)
   c:	afbe0038 	sw	s8,56(sp)
  10:	afb70034 	sw	s7,52(sp)
  14:	afb60030 	sw	s6,48(sp)
  18:	afb5002c 	sw	s5,44(sp)
  1c:	afb40028 	sw	s4,40(sp)
  20:	afb20020 	sw	s2,32(sp)
  24:	afbf003c 	sw	ra,60(sp)
  28:	afb1001c 	sw	s1,28(sp)
  2c:	afb00018 	sw	s0,24(sp)
  30:	0080a821 	move	s5,a0
  34:	00a09021 	move	s2,a1
  38:	afa60048 	sw	a2,72(sp)
  3c:	afa7004c 	sw	a3,76(sp)
  40:	24960068 	addiu	s6,a0,104
  44:	0000a021 	move	s4,zero
  48:	3c1e0000 	lui	s8,0x0
			48: R_MIPS_HI16	mem_map
  4c:	3c178000 	lui	s7,0x8000
  50:	8e4200a4 	lw	v0,164(s2)
  54:	3c060000 	lui	a2,0x0
			54: R_MIPS_HI16	contig_page_data
  58:	00002821 	move	a1,zero
  5c:	94500000 	lhu	s0,0(v0)
  60:	24c60600 	addiu	a2,a2,1536
			60: R_MIPS_LO16	contig_page_data
  64:	2e020012 	sltiu	v0,s0,18
  68:	10400054 	beqz	v0,1bc <skb_append_datato_frags+0x1bc>
  6c:	00003821 	move	a3,zero
  70:	0c000000 	jal	0 <skb_append_datato_frags>
			70: R_MIPS_26	__alloc_pages_nodemask
  74:	8ea4009c 	lw	a0,156(s5)
  78:	00402021 	move	a0,v0
  7c:	00101880 	sll	v1,s0,0x2
  80:	00101100 	sll	v0,s0,0x4
  84:	00431823 	subu	v1,v0,v1
  88:	10800059 	beqz	a0,1f0 <skb_append_datato_frags+0x1f0>
  8c:	26050001 	addiu	a1,s0,1
  90:	aea40130 	sw	a0,304(s5)
  94:	aea00138 	sw	zero,312(s5)
  98:	8e4200a4 	lw	v0,164(s2)
  9c:	00431021 	addu	v0,v0,v1
  a0:	ac440030 	sw	a0,48(v0)
  a4:	ac400038 	sw	zero,56(v0)
  a8:	ac400034 	sw	zero,52(v0)
  ac:	8e4300a4 	lw	v1,164(s2)
  b0:	a4650000 	sh	a1,0(v1)
  b4:	8e4200b0 	lw	v0,176(s2)
  b8:	24421000 	addiu	v0,v0,4096
  bc:	ae4200b0 	sw	v0,176(s2)
  c0:	c2c20000 	ll	v0,0(s6)
  c4:	24421000 	addiu	v0,v0,4096
  c8:	e2c20000 	sc	v0,0(s6)
  cc:	10400055 	beqz	v0,224 <skb_append_datato_frags+0x224>
  d0:	00000000 	nop
  d4:	8e4500a4 	lw	a1,164(s2)
  d8:	8fc70000 	lw	a3,0(s8)
			d8: R_MIPS_LO16	mem_map
  dc:	8fa4004c 	lw	a0,76(sp)
  e0:	94a20000 	lhu	v0,0(a1)
  e4:	02803021 	move	a2,s4
  e8:	2442ffff 	addiu	v0,v0,-1
  ec:	00021900 	sll	v1,v0,0x4
  f0:	00021080 	sll	v0,v0,0x2
  f4:	00621823 	subu	v1,v1,v0
  f8:	00a38821 	addu	s1,a1,v1
  fc:	8e250030 	lw	a1,48(s1)
 100:	8e230034 	lw	v1,52(s1)
 104:	8e280038 	lw	t0,56(s1)
 108:	00a72823 	subu	a1,a1,a3
 10c:	00052943 	sra	a1,a1,0x5
 110:	24021000 	li	v0,4096
 114:	00052b00 	sll	a1,a1,0xc
 118:	00433823 	subu	a3,v0,v1
 11c:	00b72821 	addu	a1,a1,s7
 120:	00681821 	addu	v1,v1,t0
 124:	00f3102a 	slt	v0,a3,s3
 128:	00e08021 	move	s0,a3
 12c:	00a32821 	addu	a1,a1,v1
 130:	8fa30048 	lw	v1,72(sp)
 134:	0262800a 	movz	s0,s3,v0
 138:	02003821 	move	a3,s0
 13c:	afa00010 	sw	zero,16(sp)
 140:	0060f809 	jalr	v1
 144:	afb20014 	sw	s2,20(sp)
 148:	0290a021 	addu	s4,s4,s0
 14c:	0440001b 	bltz	v0,1bc <skb_append_datato_frags+0x1bc>
 150:	02709823 	subu	s3,s3,s0
 154:	8ea20138 	lw	v0,312(s5)
 158:	00501021 	addu	v0,v0,s0
 15c:	aea20138 	sw	v0,312(s5)
 160:	8e230038 	lw	v1,56(s1)
 164:	02031821 	addu	v1,s0,v1
 168:	ae230038 	sw	v1,56(s1)
 16c:	8e420050 	lw	v0,80(s2)
 170:	8e430054 	lw	v1,84(s2)
 174:	00501021 	addu	v0,v0,s0
 178:	00701821 	addu	v1,v1,s0
 17c:	ae420050 	sw	v0,80(s2)
 180:	1e60ffb3 	bgtz	s3,50 <skb_append_datato_frags+0x50>
 184:	ae430054 	sw	v1,84(s2)
 188:	8fbf003c 	lw	ra,60(sp)
 18c:	00001021 	move	v0,zero
 190:	8fbe0038 	lw	s8,56(sp)
 194:	8fb70034 	lw	s7,52(sp)
 198:	8fb60030 	lw	s6,48(sp)
 19c:	8fb5002c 	lw	s5,44(sp)
 1a0:	8fb40028 	lw	s4,40(sp)
 1a4:	8fb30024 	lw	s3,36(sp)
 1a8:	8fb20020 	lw	s2,32(sp)
 1ac:	8fb1001c 	lw	s1,28(sp)
 1b0:	8fb00018 	lw	s0,24(sp)
 1b4:	03e00008 	jr	ra
 1b8:	27bd0040 	addiu	sp,sp,64
 1bc:	8fbf003c 	lw	ra,60(sp)
 1c0:	2402fff2 	li	v0,-14
 1c4:	8fbe0038 	lw	s8,56(sp)
 1c8:	8fb70034 	lw	s7,52(sp)
 1cc:	8fb60030 	lw	s6,48(sp)
 1d0:	8fb5002c 	lw	s5,44(sp)
 1d4:	8fb40028 	lw	s4,40(sp)
 1d8:	8fb30024 	lw	s3,36(sp)
 1dc:	8fb20020 	lw	s2,32(sp)
 1e0:	8fb1001c 	lw	s1,28(sp)
 1e4:	8fb00018 	lw	s0,24(sp)
 1e8:	03e00008 	jr	ra
 1ec:	27bd0040 	addiu	sp,sp,64
 1f0:	8fbf003c 	lw	ra,60(sp)
 1f4:	2402fff4 	li	v0,-12
 1f8:	8fbe0038 	lw	s8,56(sp)
 1fc:	8fb70034 	lw	s7,52(sp)
 200:	8fb60030 	lw	s6,48(sp)
 204:	8fb5002c 	lw	s5,44(sp)
 208:	8fb40028 	lw	s4,40(sp)
 20c:	8fb30024 	lw	s3,36(sp)
 210:	8fb20020 	lw	s2,32(sp)
 214:	8fb1001c 	lw	s1,28(sp)
 218:	8fb00018 	lw	s0,24(sp)
 21c:	03e00008 	jr	ra
 220:	27bd0040 	addiu	sp,sp,64
 224:	1000ffa6 	b	c0 <skb_append_datato_frags+0xc0>
 228:	00000000 	nop

Disassembly of section .text.__skb_splice_bits:

00000000 <__skb_splice_bits>:
   0:	27bdffb8 	addiu	sp,sp,-72
   4:	afb7003c 	sw	s7,60(sp)
   8:	afb40030 	sw	s4,48(sp)
   c:	afb00020 	sw	s0,32(sp)
  10:	afbf0044 	sw	ra,68(sp)
  14:	afbe0040 	sw	s8,64(sp)
  18:	afb60038 	sw	s6,56(sp)
  1c:	afb50034 	sw	s5,52(sp)
  20:	afb3002c 	sw	s3,44(sp)
  24:	afb20028 	sw	s2,40(sp)
  28:	afb10024 	sw	s1,36(sp)
  2c:	00e0a021 	move	s4,a3
  30:	8ce70000 	lw	a3,0(a3)
  34:	3c0d0000 	lui	t5,0x0
			34: R_MIPS_HI16	mem_map
  38:	afa5004c 	sw	a1,76(sp)
  3c:	00c07821 	move	t7,a2
  40:	00807021 	move	t6,a0
  44:	8fb00058 	lw	s0,88(sp)
  48:	8fb7005c 	lw	s7,92(sp)
  4c:	8da60000 	lw	a2,0(t5)
			4c: R_MIPS_LO16	mem_map
  50:	8c8500ac 	lw	a1,172(a0)
  54:	8c830050 	lw	v1,80(a0)
  58:	10e00026 	beqz	a3,f4 <__skb_splice_bits+0xf4>
  5c:	8c820054 	lw	v0,84(a0)
  60:	8de40000 	lw	a0,0(t7)
  64:	00629823 	subu	s3,v1,v0
  68:	0093102b 	sltu	v0,a0,s3
  6c:	1440002e 	bnez	v0,128 <__skb_splice_bits+0x128>
  70:	3c028000 	lui	v0,0x8000
  74:	00931023 	subu	v0,a0,s3
  78:	ade20000 	sw	v0,0(t7)
  7c:	8dc600a4 	lw	a2,164(t6)
  80:	94c20000 	lhu	v0,0(a2)
  84:	10400109 	beqz	v0,4ac <__skb_splice_bits+0x4ac>
  88:	8fbf0044 	lw	ra,68(sp)
  8c:	8e840000 	lw	a0,0(s4)
  90:	8cc80038 	lw	t0,56(a2)
  94:	8cc90030 	lw	t1,48(a2)
  98:	10800017 	beqz	a0,f8 <__skb_splice_bits+0xf8>
  9c:	8cca0034 	lw	t2,52(a2)
  a0:	00005821 	move	t3,zero
  a4:	240c1000 	li	t4,4096
  a8:	8de50000 	lw	a1,0(t7)
  ac:	00a8102b 	sltu	v0,a1,t0
  b0:	14400085 	bnez	v0,2c8 <__skb_splice_bits+0x2c8>
  b4:	00a81023 	subu	v0,a1,t0
  b8:	ade20000 	sw	v0,0(t7)
  bc:	8dc500a4 	lw	a1,164(t6)
  c0:	256b0001 	addiu	t3,t3,1
  c4:	94a20000 	lhu	v0,0(a1)
  c8:	0162102a 	slt	v0,t3,v0
  cc:	104000f6 	beqz	v0,4a8 <__skb_splice_bits+0x4a8>
  d0:	000b1880 	sll	v1,t3,0x2
  d4:	000b1100 	sll	v0,t3,0x4
  d8:	8e840000 	lw	a0,0(s4)
  dc:	00431023 	subu	v0,v0,v1
  e0:	00a21021 	addu	v0,a1,v0
  e4:	8c480038 	lw	t0,56(v0)
  e8:	8c490030 	lw	t1,48(v0)
  ec:	1480ffee 	bnez	a0,a8 <__skb_splice_bits+0xa8>
  f0:	8c4a0034 	lw	t2,52(v0)
  f4:	8fbf0044 	lw	ra,68(sp)
  f8:	24020001 	li	v0,1
  fc:	8fbe0040 	lw	s8,64(sp)
 100:	8fb7003c 	lw	s7,60(sp)
 104:	8fb60038 	lw	s6,56(sp)
 108:	8fb50034 	lw	s5,52(sp)
 10c:	8fb40030 	lw	s4,48(sp)
 110:	8fb3002c 	lw	s3,44(sp)
 114:	8fb20028 	lw	s2,40(sp)
 118:	8fb10024 	lw	s1,36(sp)
 11c:	8fb00020 	lw	s0,32(sp)
 120:	03e00008 	jr	ra
 124:	27bd0048 	addiu	sp,sp,72
 128:	00a21021 	addu	v0,a1,v0
 12c:	00021302 	srl	v0,v0,0xc
 130:	00021140 	sll	v0,v0,0x5
 134:	00c2f021 	addu	s8,a2,v0
 138:	148000ce 	bnez	a0,474 <__skb_splice_bits+0x474>
 13c:	30b60fff 	andi	s6,a1,0xfff
 140:	8fa4004c 	lw	a0,76(sp)
 144:	8e030008 	lw	v1,8(s0)
 148:	8c820014 	lw	v0,20(a0)
 14c:	1062ffe9 	beq	v1,v0,f4 <__skb_splice_bits+0xf4>
 150:	0267102b 	sltu	v0,s3,a3
 154:	02609021 	move	s2,s3
 158:	00e2900a 	movz	s2,a3,v0
 15c:	8ef10130 	lw	s1,304(s7)
 160:	24021000 	li	v0,4096
 164:	00561823 	subu	v1,v0,s6
 168:	0072102b 	sltu	v0,v1,s2
 16c:	122000af 	beqz	s1,42c <__skb_splice_bits+0x42c>
 170:	0062900b 	movn	s2,v1,v0
 174:	8ef50138 	lw	s5,312(s7)
 178:	24041000 	li	a0,4096
 17c:	00951823 	subu	v1,a0,s5
 180:	2c620040 	sltiu	v0,v1,64
 184:	10400003 	beqz	v0,194 <__skb_splice_bits+0x194>
 188:	0072202b 	sltu	a0,v1,s2
 18c:	1480009f 	bnez	a0,40c <__skb_splice_bits+0x40c>
 190:	00000000 	nop
 194:	0064900b 	movn	s2,v1,a0
 198:	8da40000 	lw	a0,0(t5)
			198: R_MIPS_LO16	mem_map
 19c:	3c028000 	lui	v0,0x8000
 1a0:	02403021 	move	a2,s2
 1a4:	03c42823 	subu	a1,s8,a0
 1a8:	02242023 	subu	a0,s1,a0
 1ac:	00042143 	sra	a0,a0,0x5
 1b0:	00052943 	sra	a1,a1,0x5
 1b4:	00042300 	sll	a0,a0,0xc
 1b8:	00052b00 	sll	a1,a1,0xc
 1bc:	00822021 	addu	a0,a0,v0
 1c0:	00a22821 	addu	a1,a1,v0
 1c4:	00952021 	addu	a0,a0,s5
 1c8:	00b62821 	addu	a1,a1,s6
 1cc:	afad0010 	sw	t5,16(sp)
 1d0:	afae0014 	sw	t6,20(sp)
 1d4:	0c000000 	jal	0 <__skb_splice_bits>
			1d4: R_MIPS_26	memcpy
 1d8:	afaf0018 	sw	t7,24(sp)
 1dc:	8ee30138 	lw	v1,312(s7)
 1e0:	02202021 	move	a0,s1
 1e4:	00721821 	addu	v1,v1,s2
 1e8:	aee30138 	sw	v1,312(s7)
 1ec:	8e220000 	lw	v0,0(s1)
 1f0:	8fad0010 	lw	t5,16(sp)
 1f4:	8fae0014 	lw	t6,20(sp)
 1f8:	30428000 	andi	v0,v0,0x8000
 1fc:	10400002 	beqz	v0,208 <__skb_splice_bits+0x208>
 200:	8faf0018 	lw	t7,24(sp)
 204:	8e24000c 	lw	a0,12(s1)
 208:	8c820004 	lw	v0,4(a0)
 20c:	c0820004 	ll	v0,4(a0)
 210:	24420001 	addiu	v0,v0,1
 214:	e0820004 	sc	v0,4(a0)
 218:	104000b0 	beqz	v0,4dc <__skb_splice_bits+0x4dc>
 21c:	00000000 	nop
 220:	1220ffb5 	beqz	s1,f8 <__skb_splice_bits+0xf8>
 224:	8fbf0044 	lw	ra,68(sp)
 228:	8e020008 	lw	v0,8(s0)
 22c:	8e030000 	lw	v1,0(s0)
 230:	02564021 	addu	t0,s2,s6
 234:	00021080 	sll	v0,v0,0x2
 238:	00621821 	addu	v1,v1,v0
 23c:	ac710000 	sw	s1,0(v1)
 240:	8e040008 	lw	a0,8(s0)
 244:	8e050004 	lw	a1,4(s0)
 248:	00083302 	srl	a2,t0,0xc
 24c:	00041100 	sll	v0,a0,0x4
 250:	00042080 	sll	a0,a0,0x2
 254:	00441023 	subu	v0,v0,a0
 258:	00a22821 	addu	a1,a1,v0
 25c:	acb20004 	sw	s2,4(a1)
 260:	8e030008 	lw	v1,8(s0)
 264:	8e040004 	lw	a0,4(s0)
 268:	00031100 	sll	v0,v1,0x4
 26c:	00031880 	sll	v1,v1,0x2
 270:	00431023 	subu	v0,v0,v1
 274:	00822021 	addu	a0,a0,v0
 278:	ac950000 	sw	s5,0(a0)
 27c:	8e020008 	lw	v0,8(s0)
 280:	24420001 	addiu	v0,v0,1
 284:	10c00007 	beqz	a2,2a4 <__skb_splice_bits+0x2a4>
 288:	ae020008 	sw	v0,8(s0)
 28c:	8da30000 	lw	v1,0(t5)
			28c: R_MIPS_LO16	mem_map
 290:	03c31023 	subu	v0,s8,v1
 294:	00021143 	sra	v0,v0,0x5
 298:	24420001 	addiu	v0,v0,1
 29c:	00021140 	sll	v0,v0,0x5
 2a0:	0062f021 	addu	s8,v1,v0
 2a4:	8e820000 	lw	v0,0(s4)
 2a8:	00523823 	subu	a3,v0,s2
 2ac:	10e0ff73 	beqz	a3,7c <__skb_splice_bits+0x7c>
 2b0:	ae870000 	sw	a3,0(s4)
 2b4:	02729823 	subu	s3,s3,s2
 2b8:	1260ff70 	beqz	s3,7c <__skb_splice_bits+0x7c>
 2bc:	31160fff 	andi	s6,t0,0xfff
 2c0:	08000051 	j	144 <__skb_splice_bits+0x144>
			2c0: R_MIPS_26	.text.__skb_splice_bits
 2c4:	8fa4004c 	lw	a0,76(sp)
 2c8:	10a00043 	beqz	a1,3d8 <__skb_splice_bits+0x3d8>
 2cc:	00803021 	move	a2,a0
 2d0:	01453021 	addu	a2,t2,a1
 2d4:	00062302 	srl	a0,a2,0xc
 2d8:	10800007 	beqz	a0,2f8 <__skb_splice_bits+0x2f8>
 2dc:	00000000 	nop
 2e0:	8da30000 	lw	v1,0(t5)
			2e0: R_MIPS_LO16	mem_map
 2e4:	01231023 	subu	v0,t1,v1
 2e8:	00021143 	sra	v0,v0,0x5
 2ec:	00441021 	addu	v0,v0,a0
 2f0:	00021140 	sll	v0,v0,0x5
 2f4:	00624821 	addu	t1,v1,v0
 2f8:	ade00000 	sw	zero,0(t7)
 2fc:	8e840000 	lw	a0,0(s4)
 300:	01054023 	subu	t0,t0,a1
 304:	30ca0fff 	andi	t2,a2,0xfff
 308:	080000f6 	j	3d8 <__skb_splice_bits+0x3d8>
			308: R_MIPS_26	.text.__skb_splice_bits
 30c:	00803021 	move	a2,a0
 310:	8d220000 	lw	v0,0(t1)
 314:	30428000 	andi	v0,v0,0x8000
 318:	10400002 	beqz	v0,324 <__skb_splice_bits+0x324>
 31c:	00000000 	nop
 320:	8d23000c 	lw	v1,12(t1)
 324:	8c620004 	lw	v0,4(v1)
 328:	c0620004 	ll	v0,4(v1)
 32c:	24420001 	addiu	v0,v0,1
 330:	e0620004 	sc	v0,4(v1)
 334:	1040006b 	beqz	v0,4e4 <__skb_splice_bits+0x4e4>
 338:	00000000 	nop
 33c:	8e020008 	lw	v0,8(s0)
 340:	8e030000 	lw	v1,0(s0)
 344:	00ea3021 	addu	a2,a3,t2
 348:	00021080 	sll	v0,v0,0x2
 34c:	00621821 	addu	v1,v1,v0
 350:	ac690000 	sw	t1,0(v1)
 354:	8e040008 	lw	a0,8(s0)
 358:	8e050004 	lw	a1,4(s0)
 35c:	01074023 	subu	t0,t0,a3
 360:	00041100 	sll	v0,a0,0x4
 364:	00042080 	sll	a0,a0,0x2
 368:	00441023 	subu	v0,v0,a0
 36c:	00a22821 	addu	a1,a1,v0
 370:	aca70004 	sw	a3,4(a1)
 374:	8e030008 	lw	v1,8(s0)
 378:	8e040004 	lw	a0,4(s0)
 37c:	00062b02 	srl	a1,a2,0xc
 380:	00031100 	sll	v0,v1,0x4
 384:	00031880 	sll	v1,v1,0x2
 388:	00431023 	subu	v0,v0,v1
 38c:	00822021 	addu	a0,a0,v0
 390:	ac8a0000 	sw	t2,0(a0)
 394:	8e020008 	lw	v0,8(s0)
 398:	30ca0fff 	andi	t2,a2,0xfff
 39c:	24420001 	addiu	v0,v0,1
 3a0:	10a00007 	beqz	a1,3c0 <__skb_splice_bits+0x3c0>
 3a4:	ae020008 	sw	v0,8(s0)
 3a8:	8da30000 	lw	v1,0(t5)
			3a8: R_MIPS_LO16	mem_map
 3ac:	01231023 	subu	v0,t1,v1
 3b0:	00021143 	sra	v0,v0,0x5
 3b4:	00451021 	addu	v0,v0,a1
 3b8:	00021140 	sll	v0,v0,0x5
 3bc:	00624821 	addu	t1,v1,v0
 3c0:	8e820000 	lw	v0,0(s4)
 3c4:	00473023 	subu	a2,v0,a3
 3c8:	10c0ff3c 	beqz	a2,bc <__skb_splice_bits+0xbc>
 3cc:	ae860000 	sw	a2,0(s4)
 3d0:	1100ff3a 	beqz	t0,bc <__skb_splice_bits+0xbc>
 3d4:	00000000 	nop
 3d8:	0106102b 	sltu	v0,t0,a2
 3dc:	01003821 	move	a3,t0
 3e0:	018a1823 	subu	v1,t4,t2
 3e4:	00c2380a 	movz	a3,a2,v0
 3e8:	0067102b 	sltu	v0,v1,a3
 3ec:	0062380b 	movn	a3,v1,v0
 3f0:	8fa3004c 	lw	v1,76(sp)
 3f4:	8e040008 	lw	a0,8(s0)
 3f8:	8c620014 	lw	v0,20(v1)
 3fc:	1482ffc4 	bne	a0,v0,310 <__skb_splice_bits+0x310>
 400:	01201821 	move	v1,t1
 404:	0800003e 	j	f8 <__skb_splice_bits+0xf8>
			404: R_MIPS_26	.text.__skb_splice_bits
 408:	8fbf0044 	lw	ra,68(sp)
 40c:	02202021 	move	a0,s1
 410:	afad0010 	sw	t5,16(sp)
 414:	afae0014 	sw	t6,20(sp)
 418:	0c000000 	jal	0 <__skb_splice_bits>
			418: R_MIPS_26	put_page
 41c:	afaf0018 	sw	t7,24(sp)
 420:	8fad0010 	lw	t5,16(sp)
 424:	8fae0014 	lw	t6,20(sp)
 428:	8faf0018 	lw	t7,24(sp)
 42c:	8ee4009c 	lw	a0,156(s7)
 430:	3c060000 	lui	a2,0x0
			430: R_MIPS_HI16	contig_page_data
 434:	00002821 	move	a1,zero
 438:	24c60600 	addiu	a2,a2,1536
			438: R_MIPS_LO16	contig_page_data
 43c:	00003821 	move	a3,zero
 440:	afad0010 	sw	t5,16(sp)
 444:	afae0014 	sw	t6,20(sp)
 448:	0c000000 	jal	0 <__skb_splice_bits>
			448: R_MIPS_26	__alloc_pages_nodemask
 44c:	afaf0018 	sw	t7,24(sp)
 450:	aee20130 	sw	v0,304(s7)
 454:	00408821 	move	s1,v0
 458:	8fad0010 	lw	t5,16(sp)
 45c:	8fae0014 	lw	t6,20(sp)
 460:	1040ff24 	beqz	v0,f4 <__skb_splice_bits+0xf4>
 464:	8faf0018 	lw	t7,24(sp)
 468:	aee00138 	sw	zero,312(s7)
 46c:	08000066 	j	198 <__skb_splice_bits+0x198>
			46c: R_MIPS_26	.text.__skb_splice_bits
 470:	0000a821 	move	s5,zero
 474:	00962821 	addu	a1,a0,s6
 478:	00051b02 	srl	v1,a1,0xc
 47c:	10600005 	beqz	v1,494 <__skb_splice_bits+0x494>
 480:	03c61023 	subu	v0,s8,a2
 484:	00021143 	sra	v0,v0,0x5
 488:	00431021 	addu	v0,v0,v1
 48c:	00021140 	sll	v0,v0,0x5
 490:	00c2f021 	addu	s8,a2,v0
 494:	ade00000 	sw	zero,0(t7)
 498:	8e870000 	lw	a3,0(s4)
 49c:	02649823 	subu	s3,s3,a0
 4a0:	08000050 	j	140 <__skb_splice_bits+0x140>
			4a0: R_MIPS_26	.text.__skb_splice_bits
 4a4:	30b60fff 	andi	s6,a1,0xfff
 4a8:	8fbf0044 	lw	ra,68(sp)
 4ac:	00001021 	move	v0,zero
 4b0:	8fbe0040 	lw	s8,64(sp)
 4b4:	8fb7003c 	lw	s7,60(sp)
 4b8:	8fb60038 	lw	s6,56(sp)
 4bc:	8fb50034 	lw	s5,52(sp)
 4c0:	8fb40030 	lw	s4,48(sp)
 4c4:	8fb3002c 	lw	s3,44(sp)
 4c8:	8fb20028 	lw	s2,40(sp)
 4cc:	8fb10024 	lw	s1,36(sp)
 4d0:	8fb00020 	lw	s0,32(sp)
 4d4:	03e00008 	jr	ra
 4d8:	27bd0048 	addiu	sp,sp,72
 4dc:	1000ff4b 	b	20c <__skb_splice_bits+0x20c>
 4e0:	00000000 	nop
 4e4:	1000ff90 	b	328 <__skb_splice_bits+0x328>
 4e8:	00000000 	nop

Disassembly of section .text.__netdev_alloc_page:

00000000 <__netdev_alloc_page>:
   0:	3c060000 	lui	a2,0x0
			0: R_MIPS_HI16	contig_page_data
   4:	00a02021 	move	a0,a1
   8:	24c60600 	addiu	a2,a2,1536
			8: R_MIPS_LO16	contig_page_data
   c:	00002821 	move	a1,zero
  10:	08000000 	j	0 <__netdev_alloc_page>
			10: R_MIPS_26	__alloc_pages_nodemask
  14:	00003821 	move	a3,zero

Disassembly of section .text.skb_copy_and_csum_bits:

00000000 <skb_copy_and_csum_bits>:
   0:	27bdffb8 	addiu	sp,sp,-72
   4:	afbe0040 	sw	s8,64(sp)
   8:	afb60038 	sw	s6,56(sp)
   c:	afb50034 	sw	s5,52(sp)
  10:	afb3002c 	sw	s3,44(sp)
  14:	afb20028 	sw	s2,40(sp)
  18:	afb10024 	sw	s1,36(sp)
  1c:	afb00020 	sw	s0,32(sp)
  20:	afbf0044 	sw	ra,68(sp)
  24:	afb7003c 	sw	s7,60(sp)
  28:	afb40030 	sw	s4,48(sp)
  2c:	afa40018 	sw	a0,24(sp)
  30:	8c830050 	lw	v1,80(a0)
  34:	8c820054 	lw	v0,84(a0)
  38:	00a09021 	move	s2,a1
  3c:	00c0b021 	move	s6,a2
  40:	00629823 	subu	s3,v1,v0
  44:	02658023 	subu	s0,s3,a1
  48:	00e08821 	move	s1,a3
  4c:	8fbe0058 	lw	s8,88(sp)
  50:	1a000011 	blez	s0,98 <skb_copy_and_csum_bits+0x98>
  54:	0000a821 	move	s5,zero
  58:	00f0102a 	slt	v0,a3,s0
  5c:	1440008a 	bnez	v0,288 <skb_copy_and_csum_bits+0x288>
  60:	8fbf0044 	lw	ra,68(sp)
  64:	8fa20018 	lw	v0,24(sp)
  68:	03c03821 	move	a3,s8
  6c:	02308823 	subu	s1,s1,s0
  70:	8c4400ac 	lw	a0,172(v0)
  74:	00852021 	addu	a0,a0,a1
  78:	00c02821 	move	a1,a2
  7c:	0c000000 	jal	0 <skb_copy_and_csum_bits>
			7c: R_MIPS_26	csum_partial_copy_nocheck
  80:	02003021 	move	a2,s0
  84:	12200073 	beqz	s1,254 <skb_copy_and_csum_bits+0x254>
  88:	0040f021 	move	s8,v0
  8c:	02509021 	addu	s2,s2,s0
  90:	02d0b021 	addu	s6,s6,s0
  94:	0200a821 	move	s5,s0
  98:	8fa30018 	lw	v1,24(sp)
  9c:	8c6400a4 	lw	a0,164(v1)
  a0:	94820000 	lhu	v0,0(a0)
  a4:	10400041 	beqz	v0,1ac <skb_copy_and_csum_bits+0x1ac>
  a8:	0000a021 	move	s4,zero
  ac:	02321021 	addu	v0,s1,s2
  b0:	0053102a 	slt	v0,v0,s3
  b4:	1440008a 	bnez	v0,2e0 <skb_copy_and_csum_bits+0x2e0>
  b8:	00000000 	nop
  bc:	00141880 	sll	v1,s4,0x2
  c0:	00141100 	sll	v0,s4,0x4
  c4:	00431023 	subu	v0,v0,v1
  c8:	00822821 	addu	a1,a0,v0
  cc:	8ca30038 	lw	v1,56(a1)
  d0:	02208021 	move	s0,s1
  d4:	0263b821 	addu	s7,s3,v1
  d8:	02f21023 	subu	v0,s7,s2
  dc:	0222182a 	slt	v1,s1,v0
  e0:	1840002d 	blez	v0,198 <skb_copy_and_csum_bits+0x198>
  e4:	0043800a 	movz	s0,v0,v1
  e8:	8f820014 	lw	v0,20(gp)
  ec:	8ca40030 	lw	a0,48(a1)
  f0:	24420001 	addiu	v0,v0,1
  f4:	af820014 	sw	v0,20(gp)
  f8:	3c020000 	lui	v0,0x0
			f8: R_MIPS_HI16	mem_map
  fc:	8c430000 	lw	v1,0(v0)
			fc: R_MIPS_LO16	mem_map
 100:	8ca20034 	lw	v0,52(a1)
 104:	02003021 	move	a2,s0
 108:	00832023 	subu	a0,a0,v1
 10c:	00042143 	sra	a0,a0,0x5
 110:	3c038000 	lui	v1,0x8000
 114:	02421021 	addu	v0,s2,v0
 118:	00042300 	sll	a0,a0,0xc
 11c:	00531023 	subu	v0,v0,s3
 120:	00832021 	addu	a0,a0,v1
 124:	02c02821 	move	a1,s6
 128:	00822021 	addu	a0,a0,v0
 12c:	0c000000 	jal	0 <skb_copy_and_csum_bits>
			12c: R_MIPS_26	csum_partial_copy_nocheck
 130:	00003821 	move	a3,zero
 134:	00402021 	move	a0,v0
 138:	8f820014 	lw	v0,20(gp)
 13c:	2442ffff 	addiu	v0,v0,-1
 140:	af820014 	sw	v0,20(gp)
 144:	3c0500ff 	lui	a1,0xff
 148:	34a500ff 	ori	a1,a1,0xff
 14c:	00851024 	and	v0,a0,a1
 150:	00022a00 	sll	a1,v0,0x8
 154:	3c0200ff 	lui	v0,0xff
 158:	344200ff 	ori	v0,v0,0xff
 15c:	00041a02 	srl	v1,a0,0x8
 160:	00621824 	and	v1,v1,v0
 164:	32a20001 	andi	v0,s5,0x1
 168:	02308823 	subu	s1,s1,s0
 16c:	02509021 	addu	s2,s2,s0
 170:	02d0b021 	addu	s6,s6,s0
 174:	10400002 	beqz	v0,180 <skb_copy_and_csum_bits+0x180>
 178:	02b0a821 	addu	s5,s5,s0
 17c:	00652021 	addu	a0,v1,a1
 180:	009e1821 	addu	v1,a0,s8
 184:	0064102b 	sltu	v0,v1,a0
 188:	12200032 	beqz	s1,254 <skb_copy_and_csum_bits+0x254>
 18c:	0043f021 	addu	s8,v0,v1
 190:	8fa30018 	lw	v1,24(sp)
 194:	8c6400a4 	lw	a0,164(v1)
 198:	94820000 	lhu	v0,0(a0)
 19c:	26940001 	addiu	s4,s4,1
 1a0:	0282102a 	slt	v0,s4,v0
 1a4:	1440ffc1 	bnez	v0,ac <skb_copy_and_csum_bits+0xac>
 1a8:	02e09821 	move	s3,s7
 1ac:	8c940010 	lw	s4,16(a0)
 1b0:	12800027 	beqz	s4,250 <skb_copy_and_csum_bits+0x250>
 1b4:	02321021 	addu	v0,s1,s2
 1b8:	3c0300ff 	lui	v1,0xff
 1bc:	347700ff 	ori	s7,v1,0xff
 1c0:	0053102a 	slt	v0,v0,s3
 1c4:	14400041 	bnez	v0,2cc <skb_copy_and_csum_bits+0x2cc>
 1c8:	3c040000 	lui	a0,0x0
			1c8: R_MIPS_HI16	$LC3
 1cc:	8e820050 	lw	v0,80(s4)
 1d0:	02532823 	subu	a1,s2,s3
 1d4:	02208021 	move	s0,s1
 1d8:	02621021 	addu	v0,s3,v0
 1dc:	00409821 	move	s3,v0
 1e0:	00521023 	subu	v0,v0,s2
 1e4:	0222182a 	slt	v1,s1,v0
 1e8:	0043800a 	movz	s0,v0,v1
 1ec:	02802021 	move	a0,s4
 1f0:	02c03021 	move	a2,s6
 1f4:	18400013 	blez	v0,244 <skb_copy_and_csum_bits+0x244>
 1f8:	02003821 	move	a3,s0
 1fc:	0c000000 	jal	0 <skb_copy_and_csum_bits>
			1fc: R_MIPS_26	skb_copy_and_csum_bits
 200:	afa00010 	sw	zero,16(sp)
 204:	00021a02 	srl	v1,v0,0x8
 208:	00402021 	move	a0,v0
 20c:	00571024 	and	v0,v0,s7
 210:	00022a00 	sll	a1,v0,0x8
 214:	32a20001 	andi	v0,s5,0x1
 218:	02308823 	subu	s1,s1,s0
 21c:	02509021 	addu	s2,s2,s0
 220:	02d0b021 	addu	s6,s6,s0
 224:	00771824 	and	v1,v1,s7
 228:	10400002 	beqz	v0,234 <skb_copy_and_csum_bits+0x234>
 22c:	02b0a821 	addu	s5,s5,s0
 230:	00652021 	addu	a0,v1,a1
 234:	009e1821 	addu	v1,a0,s8
 238:	0064102b 	sltu	v0,v1,a0
 23c:	12200005 	beqz	s1,254 <skb_copy_and_csum_bits+0x254>
 240:	0043f021 	addu	s8,v0,v1
 244:	8e940000 	lw	s4,0(s4)
 248:	1680ffdd 	bnez	s4,1c0 <skb_copy_and_csum_bits+0x1c0>
 24c:	02321021 	addu	v0,s1,s2
 250:	00118036 	tne	zero,s1,0x200
 254:	8fbf0044 	lw	ra,68(sp)
 258:	03c01021 	move	v0,s8
 25c:	8fbe0040 	lw	s8,64(sp)
 260:	8fb7003c 	lw	s7,60(sp)
 264:	8fb60038 	lw	s6,56(sp)
 268:	8fb50034 	lw	s5,52(sp)
 26c:	8fb40030 	lw	s4,48(sp)
 270:	8fb3002c 	lw	s3,44(sp)
 274:	8fb20028 	lw	s2,40(sp)
 278:	8fb10024 	lw	s1,36(sp)
 27c:	8fb00020 	lw	s0,32(sp)
 280:	03e00008 	jr	ra
 284:	27bd0048 	addiu	sp,sp,72
 288:	8fa50018 	lw	a1,24(sp)
 28c:	8fb7003c 	lw	s7,60(sp)
 290:	8ca400ac 	lw	a0,172(a1)
 294:	8fb60038 	lw	s6,56(sp)
 298:	00c02821 	move	a1,a2
 29c:	00922021 	addu	a0,a0,s2
 2a0:	00e03021 	move	a2,a3
 2a4:	8fb50034 	lw	s5,52(sp)
 2a8:	03c03821 	move	a3,s8
 2ac:	8fb40030 	lw	s4,48(sp)
 2b0:	8fbe0040 	lw	s8,64(sp)
 2b4:	8fb3002c 	lw	s3,44(sp)
 2b8:	8fb20028 	lw	s2,40(sp)
 2bc:	8fb10024 	lw	s1,36(sp)
 2c0:	8fb00020 	lw	s0,32(sp)
 2c4:	08000000 	j	0 <skb_copy_and_csum_bits>
			2c4: R_MIPS_26	csum_partial_copy_nocheck
 2c8:	27bd0048 	addiu	sp,sp,72
 2cc:	24840000 	addiu	a0,a0,0
			2cc: R_MIPS_LO16	$LC3
 2d0:	0c000000 	jal	0 <skb_copy_and_csum_bits>
			2d0: R_MIPS_26	warn_slowpath_null
 2d4:	24050764 	li	a1,1892
 2d8:	08000074 	j	1d0 <skb_copy_and_csum_bits+0x1d0>
			2d8: R_MIPS_26	.text.skb_copy_and_csum_bits
 2dc:	8e820050 	lw	v0,80(s4)
 2e0:	3c040000 	lui	a0,0x0
			2e0: R_MIPS_HI16	$LC3
 2e4:	24840000 	addiu	a0,a0,0
			2e4: R_MIPS_LO16	$LC3
 2e8:	0c000000 	jal	0 <skb_copy_and_csum_bits>
			2e8: R_MIPS_26	warn_slowpath_null
 2ec:	24050746 	li	a1,1862
 2f0:	8fa50018 	lw	a1,24(sp)
 2f4:	0800002f 	j	bc <skb_copy_and_csum_bits+0xbc>
			2f4: R_MIPS_26	.text.skb_copy_and_csum_bits
 2f8:	8ca400a4 	lw	a0,164(a1)

Disassembly of section .text.skb_copy_and_csum_dev:

00000000 <skb_copy_and_csum_dev>:
   0:	27bdffd0 	addiu	sp,sp,-48
   4:	afb30028 	sw	s3,40(sp)
   8:	afb20024 	sw	s2,36(sp)
   c:	afbf002c 	sw	ra,44(sp)
  10:	afb10020 	sw	s1,32(sp)
  14:	afb0001c 	sw	s0,28(sp)
  18:	8c820064 	lw	v0,100(a0)
  1c:	3c033000 	lui	v1,0x3000
  20:	00809021 	move	s2,a0
  24:	00431024 	and	v0,v0,v1
  28:	1043002c 	beq	v0,v1,dc <skb_copy_and_csum_dev+0xdc>
  2c:	00a09821 	move	s3,a1
  30:	8c830050 	lw	v1,80(a0)
  34:	8c820054 	lw	v0,84(a0)
  38:	8c8700ac 	lw	a3,172(a0)
  3c:	00621823 	subu	v1,v1,v0
  40:	00608821 	move	s1,v1
  44:	0071102b 	sltu	v0,v1,s1
  48:	00028036 	tne	zero,v0,0x200
  4c:	00e02821 	move	a1,a3
  50:	02602021 	move	a0,s3
  54:	0c000000 	jal	0 <skb_copy_and_csum_dev>
			54: R_MIPS_26	memcpy
  58:	02203021 	move	a2,s1
  5c:	8e470050 	lw	a3,80(s2)
  60:	12270008 	beq	s1,a3,84 <skb_copy_and_csum_dev+0x84>
  64:	00004021 	move	t0,zero
  68:	00f13823 	subu	a3,a3,s1
  6c:	02402021 	move	a0,s2
  70:	02202821 	move	a1,s1
  74:	02713021 	addu	a2,s3,s1
  78:	0c000000 	jal	0 <skb_copy_and_csum_dev>
			78: R_MIPS_26	skb_copy_and_csum_bits
  7c:	afa00010 	sw	zero,16(sp)
  80:	00404021 	move	t0,v0
  84:	8e420064 	lw	v0,100(s2)
  88:	3c033000 	lui	v1,0x3000
  8c:	00431024 	and	v0,v0,v1
  90:	1443000c 	bne	v0,v1,c4 <skb_copy_and_csum_dev+0xc4>
  94:	8fbf002c 	lw	ra,44(sp)
  98:	9643005e 	lhu	v1,94(s2)
  9c:	02711021 	addu	v0,s3,s1
  a0:	00080c00 	sll	at,t0,0x10
  a4:	01014021 	addu	t0,t0,at
  a8:	0101082b 	sltu	at,t0,at
  ac:	00084402 	srl	t0,t0,0x10
  b0:	01014021 	addu	t0,t0,at
  b4:	3908ffff 	xori	t0,t0,0xffff
  b8:	00431021 	addu	v0,v0,v1
  bc:	a4480000 	sh	t0,0(v0)
  c0:	8fbf002c 	lw	ra,44(sp)
  c4:	8fb30028 	lw	s3,40(sp)
  c8:	8fb20024 	lw	s2,36(sp)
  cc:	8fb10020 	lw	s1,32(sp)
  d0:	8fb0001c 	lw	s0,28(sp)
  d4:	03e00008 	jr	ra
  d8:	27bd0030 	addiu	sp,sp,48
  dc:	8c8700ac 	lw	a3,172(a0)
  e0:	8c8200a8 	lw	v0,168(a0)
  e4:	8e450050 	lw	a1,80(s2)
  e8:	9484005c 	lhu	a0,92(a0)
  ec:	8e430054 	lw	v1,84(s2)
  f0:	00e21023 	subu	v0,a3,v0
  f4:	00828823 	subu	s1,a0,v0
  f8:	08000011 	j	44 <skb_copy_and_csum_dev+0x44>
			f8: R_MIPS_26	.text.skb_copy_and_csum_dev
  fc:	00a31823 	subu	v1,a1,v1

Disassembly of section .text.skb_splice_bits:

00000000 <skb_splice_bits>:
   0:	27bdfeb0 	addiu	sp,sp,-336
   4:	afb40140 	sw	s4,320(sp)
   8:	afb20138 	sw	s2,312(sp)
   c:	27a20030 	addiu	v0,sp,48
  10:	00809021 	move	s2,a0
  14:	27a30070 	addiu	v1,sp,112
  18:	00c02021 	move	a0,a2
  1c:	00c0a021 	move	s4,a2
  20:	8fa60160 	lw	a2,352(sp)
  24:	afa20018 	sw	v0,24(sp)
  28:	afa3001c 	sw	v1,28(sp)
  2c:	3c020000 	lui	v0,0x0
			2c: R_MIPS_HI16	.rodata
  30:	3c030000 	lui	v1,0x0
			30: R_MIPS_HI16	.text.sock_spd_release
  34:	afb3013c 	sw	s3,316(sp)
  38:	24420004 	addiu	v0,v0,4
			38: R_MIPS_LO16	.rodata
  3c:	24630000 	addiu	v1,v1,0
			3c: R_MIPS_LO16	.text.sock_spd_release
  40:	27b30018 	addiu	s3,sp,24
  44:	afb00130 	sw	s0,304(sp)
  48:	afa50154 	sw	a1,340(sp)
  4c:	afbf014c 	sw	ra,332(sp)
  50:	afb60148 	sw	s6,328(sp)
  54:	afb50144 	sw	s5,324(sp)
  58:	afb10134 	sw	s1,308(sp)
  5c:	afa7015c 	sw	a3,348(sp)
  60:	afa60024 	sw	a2,36(sp)
  64:	afa20028 	sw	v0,40(sp)
  68:	afa3002c 	sw	v1,44(sp)
  6c:	afa00020 	sw	zero,32(sp)
  70:	02602821 	move	a1,s3
  74:	0c000000 	jal	0 <skb_splice_bits>
			74: R_MIPS_26	splice_grow_spd
  78:	8e510010 	lw	s1,16(s2)
  7c:	1040000c 	beqz	v0,b0 <skb_splice_bits+0xb0>
  80:	2410fff4 	li	s0,-12
  84:	8fbf014c 	lw	ra,332(sp)
  88:	02001021 	move	v0,s0
  8c:	8fb60148 	lw	s6,328(sp)
  90:	8fb50144 	lw	s5,324(sp)
  94:	8fb40140 	lw	s4,320(sp)
  98:	8fb3013c 	lw	s3,316(sp)
  9c:	8fb20138 	lw	s2,312(sp)
  a0:	8fb10134 	lw	s1,308(sp)
  a4:	8fb00130 	lw	s0,304(sp)
  a8:	03e00008 	jr	ra
  ac:	27bd0150 	addiu	sp,sp,336
  b0:	27b60154 	addiu	s6,sp,340
  b4:	27b5015c 	addiu	s5,sp,348
  b8:	02402021 	move	a0,s2
  bc:	02802821 	move	a1,s4
  c0:	02c03021 	move	a2,s6
  c4:	02a03821 	move	a3,s5
  c8:	afb30010 	sw	s3,16(sp)
  cc:	0c000000 	jal	0 <skb_splice_bits>
			cc: R_MIPS_26	.text.__skb_splice_bits
  d0:	afb10014 	sw	s1,20(sp)
  d4:	14400018 	bnez	v0,138 <skb_splice_bits+0x138>
  d8:	8fa20020 	lw	v0,32(sp)
  dc:	8fa2015c 	lw	v0,348(sp)
  e0:	10400015 	beqz	v0,138 <skb_splice_bits+0x138>
  e4:	8fa20020 	lw	v0,32(sp)
  e8:	8e4200a4 	lw	v0,164(s2)
  ec:	8c500010 	lw	s0,16(v0)
  f0:	16000008 	bnez	s0,114 <skb_splice_bits+0x114>
  f4:	02002021 	move	a0,s0
  f8:	0800004e 	j	138 <skb_splice_bits+0x138>
			f8: R_MIPS_26	.text.skb_splice_bits
  fc:	8fa20020 	lw	v0,32(sp)
 100:	8e100000 	lw	s0,0(s0)
 104:	1200000b 	beqz	s0,134 <skb_splice_bits+0x134>
 108:	8fa2015c 	lw	v0,348(sp)
 10c:	10400009 	beqz	v0,134 <skb_splice_bits+0x134>
 110:	02002021 	move	a0,s0
 114:	02802821 	move	a1,s4
 118:	02c03021 	move	a2,s6
 11c:	02a03821 	move	a3,s5
 120:	afb30010 	sw	s3,16(sp)
 124:	0c000000 	jal	0 <skb_splice_bits>
			124: R_MIPS_26	.text.__skb_splice_bits
 128:	afb10014 	sw	s1,20(sp)
 12c:	1040fff4 	beqz	v0,100 <skb_splice_bits+0x100>
 130:	00000000 	nop
 134:	8fa20020 	lw	v0,32(sp)
 138:	1440000f 	bnez	v0,178 <skb_splice_bits+0x178>
 13c:	00008021 	move	s0,zero
 140:	02802021 	move	a0,s4
 144:	0c000000 	jal	0 <skb_splice_bits>
			144: R_MIPS_26	splice_shrink_spd
 148:	02602821 	move	a1,s3
 14c:	8fbf014c 	lw	ra,332(sp)
 150:	02001021 	move	v0,s0
 154:	8fb60148 	lw	s6,328(sp)
 158:	8fb50144 	lw	s5,324(sp)
 15c:	8fb40140 	lw	s4,320(sp)
 160:	8fb3013c 	lw	s3,316(sp)
 164:	8fb20138 	lw	s2,312(sp)
 168:	8fb10134 	lw	s1,308(sp)
 16c:	8fb00130 	lw	s0,304(sp)
 170:	03e00008 	jr	ra
 174:	27bd0150 	addiu	sp,sp,336
 178:	0c000000 	jal	0 <skb_splice_bits>
			178: R_MIPS_26	release_sock
 17c:	02202021 	move	a0,s1
 180:	02802021 	move	a0,s4
 184:	0c000000 	jal	0 <skb_splice_bits>
			184: R_MIPS_26	splice_to_pipe
 188:	02602821 	move	a1,s3
 18c:	02202021 	move	a0,s1
 190:	00002821 	move	a1,zero
 194:	0c000000 	jal	0 <skb_splice_bits>
			194: R_MIPS_26	lock_sock_nested
 198:	00408021 	move	s0,v0
 19c:	08000051 	j	144 <skb_splice_bits+0x144>
			19c: R_MIPS_26	.text.skb_splice_bits
 1a0:	02802021 	move	a0,s4

Disassembly of section .text.skb_push:

00000000 <skb_push>:
   0:	27bdffd0 	addiu	sp,sp,-48
   4:	afbf002c 	sw	ra,44(sp)
   8:	8c8200ac 	lw	v0,172(a0)
   c:	8c830050 	lw	v1,80(a0)
  10:	8c8900a8 	lw	t1,168(a0)
  14:	00454023 	subu	t0,v0,a1
  18:	00653021 	addu	a2,v1,a1
  1c:	0109102b 	sltu	v0,t0,t1
  20:	00a03821 	move	a3,a1
  24:	ac8800ac 	sw	t0,172(a0)
  28:	ac860050 	sw	a2,80(a0)
  2c:	14400005 	bnez	v0,44 <skb_push+0x44>
  30:	03e02821 	move	a1,ra
  34:	8fbf002c 	lw	ra,44(sp)
  38:	01001021 	move	v0,t0
  3c:	03e00008 	jr	ra
  40:	27bd0030 	addiu	sp,sp,48
  44:	8c820014 	lw	v0,20(a0)
  48:	8c8300a0 	lw	v1,160(a0)
  4c:	1040000c 	beqz	v0,80 <skb_push+0x80>
  50:	8c8a00a4 	lw	t2,164(a0)
  54:	3c040000 	lui	a0,0x0
			54: R_MIPS_HI16	$LC27
  58:	24840000 	addiu	a0,a0,0
			58: R_MIPS_LO16	$LC27
  5c:	afa90010 	sw	t1,16(sp)
  60:	afa80014 	sw	t0,20(sp)
  64:	afa30018 	sw	v1,24(sp)
  68:	afaa001c 	sw	t2,28(sp)
  6c:	0c000000 	jal	0 <skb_push>
			6c: R_MIPS_26	printk
  70:	afa20020 	sw	v0,32(sp)
  74:	0200000d 	break	0x200
  78:	0800001e 	j	78 <skb_push+0x78>
			78: R_MIPS_26	.text.skb_push
  7c:	00000000 	nop
  80:	3c020000 	lui	v0,0x0
			80: R_MIPS_HI16	$LC26
  84:	08000015 	j	54 <skb_push+0x54>
			84: R_MIPS_26	.text.skb_push
  88:	24420000 	addiu	v0,v0,0
			88: R_MIPS_LO16	$LC26

Disassembly of section .text.skb_put:

00000000 <skb_put>:
   0:	27bdffd0 	addiu	sp,sp,-48
   4:	afbf002c 	sw	ra,44(sp)
   8:	00a03821 	move	a3,a1
   c:	8c8900a0 	lw	t1,160(a0)
  10:	03e02821 	move	a1,ra
  14:	8c820054 	lw	v0,84(a0)
  18:	00028036 	tne	zero,v0,0x200
  1c:	8c830050 	lw	v1,80(a0)
  20:	8c8a00a4 	lw	t2,164(a0)
  24:	01274021 	addu	t0,t1,a3
  28:	00673021 	addu	a2,v1,a3
  2c:	0148102b 	sltu	v0,t2,t0
  30:	ac8800a0 	sw	t0,160(a0)
  34:	14400005 	bnez	v0,4c <skb_put+0x4c>
  38:	ac860050 	sw	a2,80(a0)
  3c:	8fbf002c 	lw	ra,44(sp)
  40:	01201021 	move	v0,t1
  44:	03e00008 	jr	ra
  48:	27bd0030 	addiu	sp,sp,48
  4c:	8c820014 	lw	v0,20(a0)
  50:	8c8300a8 	lw	v1,168(a0)
  54:	14400003 	bnez	v0,64 <skb_put+0x64>
  58:	8c8900ac 	lw	t1,172(a0)
  5c:	3c020000 	lui	v0,0x0
			5c: R_MIPS_HI16	$LC26
  60:	24420000 	addiu	v0,v0,0
			60: R_MIPS_LO16	$LC26
  64:	3c040000 	lui	a0,0x0
			64: R_MIPS_HI16	$LC28
  68:	24840000 	addiu	a0,a0,0
			68: R_MIPS_LO16	$LC28
  6c:	afa30010 	sw	v1,16(sp)
  70:	afa90014 	sw	t1,20(sp)
  74:	afa80018 	sw	t0,24(sp)
  78:	afaa001c 	sw	t2,28(sp)
  7c:	0c000000 	jal	0 <skb_put>
			7c: R_MIPS_26	printk
  80:	afa20020 	sw	v0,32(sp)
  84:	0200000d 	break	0x200
  88:	08000022 	j	88 <skb_put+0x88>
			88: R_MIPS_26	.text.skb_put
  8c:	00000000 	nop

Disassembly of section .text.skb_split:

00000000 <skb_split>:
   0:	27bdffd8 	addiu	sp,sp,-40
   4:	afb30020 	sw	s3,32(sp)
   8:	afb2001c 	sw	s2,28(sp)
   c:	afb10018 	sw	s1,24(sp)
  10:	afb00014 	sw	s0,20(sp)
  14:	afbf0024 	sw	ra,36(sp)
  18:	00808821 	move	s1,a0
  1c:	8e230054 	lw	v1,84(s1)
  20:	8c840050 	lw	a0,80(a0)
  24:	00c09021 	move	s2,a2
  28:	00838023 	subu	s0,a0,v1
  2c:	00d0102b 	sltu	v0,a2,s0
  30:	14400057 	bnez	v0,190 <skb_split+0x190>
  34:	00a09821 	move	s3,a1
  38:	8e2200a4 	lw	v0,164(s1)
  3c:	00d02023 	subu	a0,a2,s0
  40:	00002821 	move	a1,zero
  44:	944f0000 	lhu	t7,0(v0)
  48:	a4400000 	sh	zero,0(v0)
  4c:	8e230050 	lw	v1,80(s1)
  50:	00661823 	subu	v1,v1,a2
  54:	ae630050 	sw	v1,80(s3)
  58:	ae630054 	sw	v1,84(s3)
  5c:	ae260050 	sw	a2,80(s1)
  60:	11e0003e 	beqz	t7,15c <skb_split+0x15c>
  64:	ae240054 	sw	a0,84(s1)
  68:	00004821 	move	t1,zero
  6c:	00006021 	move	t4,zero
  70:	8e2400a4 	lw	a0,164(s1)
  74:	00096880 	sll	t5,t1,0x2
  78:	00093100 	sll	a2,t1,0x4
  7c:	00cd5823 	subu	t3,a2,t5
  80:	008b2821 	addu	a1,a0,t3
  84:	8ca70038 	lw	a3,56(a1)
  88:	000c1080 	sll	v0,t4,0x2
  8c:	000c1900 	sll	v1,t4,0x4
  90:	02077021 	addu	t6,s0,a3
  94:	00624023 	subu	t0,v1,v0
  98:	024e102b 	sltu	v0,s2,t6
  9c:	10400038 	beqz	v0,180 <skb_split+0x180>
  a0:	0212502b 	sltu	t2,s0,s2
  a4:	8e6200a4 	lw	v0,164(s3)
  a8:	8ca40034 	lw	a0,52(a1)
  ac:	8ca30030 	lw	v1,48(a1)
  b0:	00481021 	addu	v0,v0,t0
  b4:	ac470038 	sw	a3,56(v0)
  b8:	ac430030 	sw	v1,48(v0)
  bc:	11400021 	beqz	t2,144 <skb_split+0x144>
  c0:	ac440034 	sw	a0,52(v0)
  c4:	8e2200a4 	lw	v0,164(s1)
  c8:	004b1021 	addu	v0,v0,t3
  cc:	8c420030 	lw	v0,48(v0)
  d0:	8c430000 	lw	v1,0(v0)
  d4:	30638000 	andi	v1,v1,0x8000
  d8:	10600002 	beqz	v1,e4 <skb_split+0xe4>
  dc:	00000000 	nop
  e0:	8c42000c 	lw	v0,12(v0)
  e4:	8c430004 	lw	v1,4(v0)
  e8:	c0430004 	ll	v1,4(v0)
  ec:	24630001 	addiu	v1,v1,1
  f0:	e0430004 	sc	v1,4(v0)
  f4:	1060005b 	beqz	v1,264 <skb_split+0x264>
  f8:	00000000 	nop
  fc:	8e6300a4 	lw	v1,164(s3)
 100:	02502823 	subu	a1,s2,s0
 104:	00cd3023 	subu	a2,a2,t5
 108:	8c620034 	lw	v0,52(v1)
 10c:	00451021 	addu	v0,v0,a1
 110:	ac620034 	sw	v0,52(v1)
 114:	8e6400a4 	lw	a0,164(s3)
 118:	8c820038 	lw	v0,56(a0)
 11c:	00521023 	subu	v0,v0,s2
 120:	00501021 	addu	v0,v0,s0
 124:	ac820038 	sw	v0,56(a0)
 128:	8e2300a4 	lw	v1,164(s1)
 12c:	00661821 	addu	v1,v1,a2
 130:	ac650038 	sw	a1,56(v1)
 134:	8e2400a4 	lw	a0,164(s1)
 138:	94820000 	lhu	v0,0(a0)
 13c:	24420001 	addiu	v0,v0,1
 140:	a4820000 	sh	v0,0(a0)
 144:	258c0001 	addiu	t4,t4,1
 148:	25290001 	addiu	t1,t1,1
 14c:	012f102a 	slt	v0,t1,t7
 150:	1440ffc7 	bnez	v0,70 <skb_split+0x70>
 154:	01c08021 	move	s0,t6
 158:	3185ffff 	andi	a1,t4,0xffff
 15c:	8e6200a4 	lw	v0,164(s3)
 160:	a4450000 	sh	a1,0(v0)
 164:	8fbf0024 	lw	ra,36(sp)
 168:	8fb30020 	lw	s3,32(sp)
 16c:	8fb2001c 	lw	s2,28(sp)
 170:	8fb10018 	lw	s1,24(sp)
 174:	8fb00014 	lw	s0,20(sp)
 178:	03e00008 	jr	ra
 17c:	27bd0028 	addiu	sp,sp,40
 180:	94820000 	lhu	v0,0(a0)
 184:	24420001 	addiu	v0,v0,1
 188:	08000052 	j	148 <skb_split+0x148>
			188: R_MIPS_26	.text.skb_split
 18c:	a4820000 	sh	v0,0(a0)
 190:	02068023 	subu	s0,s0,a2
 194:	00a02021 	move	a0,a1
 198:	0c000000 	jal	0 <skb_split>
			198: R_MIPS_26	skb_put
 19c:	02002821 	move	a1,s0
 1a0:	8e2500ac 	lw	a1,172(s1)
 1a4:	00402021 	move	a0,v0
 1a8:	02003021 	move	a2,s0
 1ac:	0c000000 	jal	0 <skb_split>
			1ac: R_MIPS_26	memcpy
 1b0:	00b22821 	addu	a1,a1,s2
 1b4:	8e2500a4 	lw	a1,164(s1)
 1b8:	94a30000 	lhu	v1,0(a1)
 1bc:	10600014 	beqz	v1,210 <skb_split+0x210>
 1c0:	00000000 	nop
 1c4:	00004021 	move	t0,zero
 1c8:	00081880 	sll	v1,t0,0x2
 1cc:	00082100 	sll	a0,t0,0x4
 1d0:	00832023 	subu	a0,a0,v1
 1d4:	00a41021 	addu	v0,a1,a0
 1d8:	8e6300a4 	lw	v1,164(s3)
 1dc:	8c450038 	lw	a1,56(v0)
 1e0:	8c460030 	lw	a2,48(v0)
 1e4:	8c470034 	lw	a3,52(v0)
 1e8:	00641821 	addu	v1,v1,a0
 1ec:	ac650038 	sw	a1,56(v1)
 1f0:	ac660030 	sw	a2,48(v1)
 1f4:	ac670034 	sw	a3,52(v1)
 1f8:	8e2500a4 	lw	a1,164(s1)
 1fc:	25080001 	addiu	t0,t0,1
 200:	94a30000 	lhu	v1,0(a1)
 204:	0103102a 	slt	v0,t0,v1
 208:	1440ffef 	bnez	v0,1c8 <skb_split+0x1c8>
 20c:	00000000 	nop
 210:	8e6200a4 	lw	v0,164(s3)
 214:	a4430000 	sh	v1,0(v0)
 218:	8e2300a4 	lw	v1,164(s1)
 21c:	a4600000 	sh	zero,0(v1)
 220:	8e240054 	lw	a0,84(s1)
 224:	8e620050 	lw	v0,80(s3)
 228:	8e2300ac 	lw	v1,172(s1)
 22c:	ae640054 	sw	a0,84(s3)
 230:	00441021 	addu	v0,v0,a0
 234:	00721821 	addu	v1,v1,s2
 238:	ae620050 	sw	v0,80(s3)
 23c:	ae2300a0 	sw	v1,160(s1)
 240:	ae200054 	sw	zero,84(s1)
 244:	ae320050 	sw	s2,80(s1)
 248:	8fbf0024 	lw	ra,36(sp)
 24c:	8fb30020 	lw	s3,32(sp)
 250:	8fb2001c 	lw	s2,28(sp)
 254:	8fb10018 	lw	s1,24(sp)
 258:	8fb00014 	lw	s0,20(sp)
 25c:	03e00008 	jr	ra
 260:	27bd0028 	addiu	sp,sp,40
 264:	1000ffa0 	b	e8 <skb_split+0xe8>
 268:	00000000 	nop

Disassembly of section .text.skbmgr_free_all_skbs:

00000000 <skbmgr_free_all_skbs>:
   0:	27bdffd8 	addiu	sp,sp,-40
   4:	3c020000 	lui	v0,0x0
			4: R_MIPS_HI16	skbmgr_pool
   8:	afb30020 	sw	s3,32(sp)
   c:	afb2001c 	sw	s2,28(sp)
  10:	afb10018 	sw	s1,24(sp)
  14:	afbf0024 	sw	ra,36(sp)
  18:	afb00014 	sw	s0,20(sp)
  1c:	24510000 	addiu	s1,v0,0
			1c: R_MIPS_LO16	skbmgr_pool
  20:	24120001 	li	s2,1
  24:	08000010 	j	40 <skbmgr_free_all_skbs+0x40>
			24: R_MIPS_26	.text.skbmgr_free_all_skbs
  28:	3c130000 	lui	s3,0x0
			28: R_MIPS_HI16	skbmgr_alloc_no
  2c:	02002021 	move	a0,s0
  30:	0c000073 	jal	1cc <$LC20>
			30: R_MIPS_26	.imem_text
  34:	ae000070 	sw	zero,112(s0)
  38:	0c000000 	jal	0 <skbmgr_free_all_skbs>
			38: R_MIPS_26	.imem_text
  3c:	02002021 	move	a0,s0
  40:	0c000000 	jal	0 <skbmgr_free_all_skbs>
			40: R_MIPS_26	skb_dequeue
  44:	02202021 	move	a0,s1
  48:	1040000b 	beqz	v0,78 <skbmgr_free_all_skbs+0x78>
  4c:	00408021 	move	s0,v0
  50:	8e020070 	lw	v0,112(s0)
  54:	1452fff5 	bne	v0,s2,2c <skbmgr_free_all_skbs+0x2c>
  58:	ae00006c 	sw	zero,108(s0)
  5c:	c2620000 	ll	v0,0(s3)
			5c: R_MIPS_LO16	skbmgr_alloc_no
  60:	2442ffff 	addiu	v0,v0,-1
  64:	e2620000 	sc	v0,0(s3)
			64: R_MIPS_LO16	skbmgr_alloc_no
  68:	1040000a 	beqz	v0,94 <skbmgr_free_all_skbs+0x94>
  6c:	00000000 	nop
  70:	0800000c 	j	30 <skbmgr_free_all_skbs+0x30>
			70: R_MIPS_26	.text.skbmgr_free_all_skbs
  74:	02002021 	move	a0,s0
  78:	8fbf0024 	lw	ra,36(sp)
  7c:	8fb30020 	lw	s3,32(sp)
  80:	8fb2001c 	lw	s2,28(sp)
  84:	8fb10018 	lw	s1,24(sp)
  88:	8fb00014 	lw	s0,20(sp)
  8c:	03e00008 	jr	ra
  90:	27bd0028 	addiu	sp,sp,40
  94:	1000fff1 	b	5c <skbmgr_free_all_skbs+0x5c>
  98:	00000000 	nop

Disassembly of section .text.limit_write:

00000000 <limit_write>:
   0:	27bdffa8 	addiu	sp,sp,-88
   4:	2cc20041 	sltiu	v0,a2,65
   8:	afb00050 	sw	s0,80(sp)
   c:	afbf0054 	sw	ra,84(sp)
  10:	14400006 	bnez	v0,2c <limit_write+0x2c>
  14:	2410ffea 	li	s0,-22
  18:	8fbf0054 	lw	ra,84(sp)
  1c:	02001021 	move	v0,s0
  20:	8fb00050 	lw	s0,80(sp)
  24:	03e00008 	jr	ra
  28:	27bd0058 	addiu	sp,sp,88
  2c:	8f830018 	lw	v1,24(gp)
  30:	00a61021 	addu	v0,a1,a2
  34:	00451025 	or	v0,v0,a1
  38:	00c21025 	or	v0,a2,v0
  3c:	00431024 	and	v0,v0,v1
  40:	00c08021 	move	s0,a2
  44:	14400005 	bnez	v0,5c <limit_write+0x5c>
  48:	00c01821 	move	v1,a2
  4c:	27a40010 	addiu	a0,sp,16
  50:	0c000000 	jal	0 <limit_write>
			50: R_MIPS_26	__copy_user
  54:	00a60821 	addu	at,a1,a2
  58:	00c01821 	move	v1,a2
  5c:	10600003 	beqz	v1,6c <limit_write+0x6c>
  60:	27a40010 	addiu	a0,sp,16
  64:	08000006 	j	18 <limit_write+0x18>
			64: R_MIPS_26	.text.limit_write
  68:	2410fff2 	li	s0,-14
  6c:	00002821 	move	a1,zero
  70:	0c000000 	jal	0 <limit_write>
			70: R_MIPS_26	simple_strtoul
  74:	2406000a 	li	a2,10
  78:	3c030000 	lui	v1,0x0
			78: R_MIPS_HI16	skbmgr_hot_list_len
  7c:	8c650000 	lw	a1,0(v1)
			7c: R_MIPS_LO16	skbmgr_hot_list_len
  80:	3c040000 	lui	a0,0x0
			80: R_MIPS_HI16	skbmgr_limit
  84:	14a0ffe4 	bnez	a1,18 <limit_write+0x18>
  88:	ac820000 	sw	v0,0(a0)
			88: R_MIPS_LO16	skbmgr_limit
  8c:	0c000000 	jal	0 <limit_write>
			8c: R_MIPS_26	skbmgr_free_all_skbs
  90:	00000000 	nop
  94:	3c020000 	lui	v0,0x0
			94: R_MIPS_HI16	skbmgr_max_list_len
  98:	08000006 	j	18 <limit_write+0x18>
			98: R_MIPS_26	.text.limit_write
  9c:	ac400000 	sw	zero,0(v0)
			9c: R_MIPS_LO16	skbmgr_max_list_len

Disassembly of section .text.hot_list_len_write:

00000000 <hot_list_len_write>:
   0:	27bdffa8 	addiu	sp,sp,-88
   4:	2cc20041 	sltiu	v0,a2,65
   8:	afb00050 	sw	s0,80(sp)
   c:	afbf0054 	sw	ra,84(sp)
  10:	14400006 	bnez	v0,2c <hot_list_len_write+0x2c>
  14:	2410ffea 	li	s0,-22
  18:	8fbf0054 	lw	ra,84(sp)
  1c:	02001021 	move	v0,s0
  20:	8fb00050 	lw	s0,80(sp)
  24:	03e00008 	jr	ra
  28:	27bd0058 	addiu	sp,sp,88
  2c:	8f830018 	lw	v1,24(gp)
  30:	00a61021 	addu	v0,a1,a2
  34:	00451025 	or	v0,v0,a1
  38:	00c21025 	or	v0,a2,v0
  3c:	00431024 	and	v0,v0,v1
  40:	00c08021 	move	s0,a2
  44:	14400005 	bnez	v0,5c <hot_list_len_write+0x5c>
  48:	00c01821 	move	v1,a2
  4c:	27a40010 	addiu	a0,sp,16
  50:	0c000000 	jal	0 <hot_list_len_write>
			50: R_MIPS_26	__copy_user
  54:	00a60821 	addu	at,a1,a2
  58:	00c01821 	move	v1,a2
  5c:	10600003 	beqz	v1,6c <hot_list_len_write+0x6c>
  60:	27a40010 	addiu	a0,sp,16
  64:	08000006 	j	18 <hot_list_len_write+0x18>
			64: R_MIPS_26	.text.hot_list_len_write
  68:	2410fff2 	li	s0,-14
  6c:	00002821 	move	a1,zero
  70:	0c000000 	jal	0 <hot_list_len_write>
			70: R_MIPS_26	simple_strtoul
  74:	2406000a 	li	a2,10
  78:	3c030000 	lui	v1,0x0
			78: R_MIPS_HI16	skbmgr_hot_list_len
  7c:	1440ffe6 	bnez	v0,18 <hot_list_len_write+0x18>
  80:	ac620000 	sw	v0,0(v1)
			80: R_MIPS_LO16	skbmgr_hot_list_len
  84:	0c000000 	jal	0 <hot_list_len_write>
			84: R_MIPS_26	skbmgr_free_all_skbs
  88:	00000000 	nop
  8c:	3c020000 	lui	v0,0x0
			8c: R_MIPS_HI16	skbmgr_max_list_len
  90:	08000006 	j	18 <hot_list_len_write+0x18>
			90: R_MIPS_26	.text.hot_list_len_write
  94:	ac400000 	sw	zero,0(v0)
			94: R_MIPS_LO16	skbmgr_max_list_len

Disassembly of section .text.skb_release_head_state:

00000000 <skb_release_head_state>:
   0:	27bdffe8 	addiu	sp,sp,-24
   4:	afb00010 	sw	s0,16(sp)
   8:	afbf0014 	sw	ra,20(sp)
   c:	8c830048 	lw	v1,72(a0)
  10:	10600005 	beqz	v1,28 <skb_release_head_state+0x28>
  14:	00808021 	move	s0,a0
  18:	30620001 	andi	v0,v1,0x1
  1c:	10400034 	beqz	v0,f0 <skb_release_head_state+0xf0>
  20:	2404fffe 	li	a0,-2
  24:	ae000048 	sw	zero,72(s0)
  28:	8e04004c 	lw	a0,76(s0)
  2c:	10800009 	beqz	a0,54 <skb_release_head_state+0x54>
  30:	00000000 	nop
  34:	c0830000 	ll	v1,0(a0)
  38:	2462ffff 	addiu	v0,v1,-1
  3c:	e0820000 	sc	v0,0(a0)
  40:	10400034 	beqz	v0,114 <skb_release_head_state+0x114>
  44:	00000000 	nop
  48:	2462ffff 	addiu	v0,v1,-1
  4c:	10400024 	beqz	v0,e0 <skb_release_head_state+0xe0>
  50:	00000000 	nop
  54:	8e050068 	lw	a1,104(s0)
  58:	10a00007 	beqz	a1,78 <skb_release_head_state+0x78>
  5c:	3c0303ff 	lui	v1,0x3ff
  60:	8f820014 	lw	v0,20(gp)
  64:	00431024 	and	v0,v0,v1
  68:	14400025 	bnez	v0,100 <skb_release_head_state+0x100>
  6c:	3c040000 	lui	a0,0x0
			6c: R_MIPS_HI16	$LC3
  70:	00a0f809 	jalr	a1
  74:	02002021 	move	a0,s0
  78:	8e040074 	lw	a0,116(s0)
  7c:	10800009 	beqz	a0,a4 <skb_release_head_state+0xa4>
  80:	00000000 	nop
  84:	c0830000 	ll	v1,0(a0)
  88:	2462ffff 	addiu	v0,v1,-1
  8c:	e0820000 	sc	v0,0(a0)
  90:	10400022 	beqz	v0,11c <skb_release_head_state+0x11c>
  94:	00000000 	nop
  98:	2462ffff 	addiu	v0,v1,-1
  9c:	1040000c 	beqz	v0,d0 <skb_release_head_state+0xd0>
  a0:	00000000 	nop
  a4:	8e040078 	lw	a0,120(s0)
  a8:	10800003 	beqz	a0,b8 <skb_release_head_state+0xb8>
  ac:	00000000 	nop
  b0:	0c000000 	jal	0 <skb_release_head_state>
			b0: R_MIPS_26	kfree_skb
  b4:	00000000 	nop
  b8:	a6000082 	sh	zero,130(s0)
  bc:	a6000080 	sh	zero,128(s0)
  c0:	8fbf0014 	lw	ra,20(sp)
  c4:	8fb00010 	lw	s0,16(sp)
  c8:	03e00008 	jr	ra
  cc:	27bd0018 	addiu	sp,sp,24
  d0:	0c000000 	jal	0 <skb_release_head_state>
			d0: R_MIPS_26	nf_conntrack_destroy
  d4:	00000000 	nop
  d8:	0800002a 	j	a8 <skb_release_head_state+0xa8>
			d8: R_MIPS_26	.text.skb_release_head_state
  dc:	8e040078 	lw	a0,120(s0)
  e0:	0c000000 	jal	0 <skb_release_head_state>
			e0: R_MIPS_26	__secpath_destroy
  e4:	00000000 	nop
  e8:	08000016 	j	58 <skb_release_head_state+0x58>
			e8: R_MIPS_26	.text.skb_release_head_state
  ec:	8e050068 	lw	a1,104(s0)
  f0:	0c000000 	jal	0 <skb_release_head_state>
			f0: R_MIPS_26	dst_release
  f4:	00642024 	and	a0,v1,a0
  f8:	0800000a 	j	28 <skb_release_head_state+0x28>
			f8: R_MIPS_26	.text.skb_release_head_state
  fc:	ae000048 	sw	zero,72(s0)
 100:	240501b3 	li	a1,435
 104:	0c000000 	jal	0 <skb_release_head_state>
			104: R_MIPS_26	warn_slowpath_null
 108:	24840000 	addiu	a0,a0,0
			108: R_MIPS_LO16	$LC3
 10c:	0800001c 	j	70 <skb_release_head_state+0x70>
			10c: R_MIPS_26	.text.skb_release_head_state
 110:	8e050068 	lw	a1,104(s0)
 114:	1000ffc7 	b	34 <skb_release_head_state+0x34>
 118:	00000000 	nop
 11c:	1000ffd9 	b	84 <skb_release_head_state+0x84>
 120:	00000000 	nop

Disassembly of section .text.skb_release_all:

00000000 <skb_release_all>:
   0:	27bdffe8 	addiu	sp,sp,-24
   4:	afb00010 	sw	s0,16(sp)
   8:	afbf0014 	sw	ra,20(sp)
   c:	0c000000 	jal	0 <skb_release_all>
			c: R_MIPS_26	.text.skb_release_head_state
  10:	00808021 	move	s0,a0
  14:	8e030070 	lw	v1,112(s0)
  18:	24020001 	li	v0,1
  1c:	1062001a 	beq	v1,v0,88 <skb_release_all+0x88>
  20:	24020002 	li	v0,2
  24:	10620011 	beq	v1,v0,6c <skb_release_all+0x6c>
  28:	3c020000 	lui	v0,0x0
			28: R_MIPS_HI16	skbmgr_4k_alloc_no
  2c:	8e02006c 	lw	v0,108(s0)
  30:	10400005 	beqz	v0,48 <skb_release_all+0x48>
  34:	00000000 	nop
  38:	0040f809 	jalr	v0
  3c:	02002021 	move	a0,s0
  40:	14400007 	bnez	v0,60 <skb_release_all+0x60>
  44:	8fbf0014 	lw	ra,20(sp)
  48:	ae00006c 	sw	zero,108(s0)
  4c:	02002021 	move	a0,s0
  50:	8fbf0014 	lw	ra,20(sp)
  54:	8fb00010 	lw	s0,16(sp)
  58:	08000073 	j	1cc <$LC20>
			58: R_MIPS_26	.imem_text
  5c:	27bd0018 	addiu	sp,sp,24
  60:	8fb00010 	lw	s0,16(sp)
  64:	03e00008 	jr	ra
  68:	27bd0018 	addiu	sp,sp,24
  6c:	c0430000 	ll	v1,0(v0)
			6c: R_MIPS_LO16	skbmgr_4k_alloc_no
  70:	2463ffff 	addiu	v1,v1,-1
  74:	e0430000 	sc	v1,0(v0)
			74: R_MIPS_LO16	skbmgr_4k_alloc_no
  78:	1060000b 	beqz	v1,a8 <skb_release_all+0xa8>
  7c:	00000000 	nop
  80:	0800000b 	j	2c <skb_release_all+0x2c>
			80: R_MIPS_26	.text.skb_release_all
  84:	ae000070 	sw	zero,112(s0)
  88:	3c020000 	lui	v0,0x0
			88: R_MIPS_HI16	skbmgr_alloc_no
  8c:	c0430000 	ll	v1,0(v0)
			8c: R_MIPS_LO16	skbmgr_alloc_no
  90:	2463ffff 	addiu	v1,v1,-1
  94:	e0430000 	sc	v1,0(v0)
			94: R_MIPS_LO16	skbmgr_alloc_no
  98:	10600005 	beqz	v1,b0 <skb_release_all+0xb0>
  9c:	00000000 	nop
  a0:	0800000b 	j	2c <skb_release_all+0x2c>
			a0: R_MIPS_26	.text.skb_release_all
  a4:	ae000070 	sw	zero,112(s0)
  a8:	1000fff0 	b	6c <skb_release_all+0x6c>
  ac:	00000000 	nop
  b0:	1000fff6 	b	8c <skb_release_all+0x8c>
  b4:	00000000 	nop

Disassembly of section .text.skb_morph:

00000000 <skb_morph>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb10018 	sw	s1,24(sp)
   8:	afb00014 	sw	s0,20(sp)
   c:	00a08821 	move	s1,a1
  10:	afbf001c 	sw	ra,28(sp)
  14:	0c000000 	jal	0 <skb_morph>
			14: R_MIPS_26	.text.skb_release_all
  18:	00808021 	move	s0,a0
  1c:	02002021 	move	a0,s0
  20:	02202821 	move	a1,s1
  24:	8fbf001c 	lw	ra,28(sp)
  28:	8fb10018 	lw	s1,24(sp)
  2c:	8fb00014 	lw	s0,20(sp)
  30:	08000000 	j	0 <skb_morph>
			30: R_MIPS_26	.text.__skb_clone
  34:	27bd0020 	addiu	sp,sp,32

Disassembly of section .text.consume_skb:

00000000 <consume_skb>:
   0:	1080000f 	beqz	a0,40 <consume_skb+0x40>
   4:	00000000 	nop
   8:	8c8300b4 	lw	v1,180(a0)
   c:	24020001 	li	v0,1
  10:	14620003 	bne	v1,v0,20 <consume_skb+0x20>
  14:	248500b4 	addiu	a1,a0,180
  18:	08000000 	j	0 <consume_skb>
			18: R_MIPS_26	__kfree_skb
  1c:	00000000 	nop
  20:	c0a30000 	ll	v1,0(a1)
  24:	2462ffff 	addiu	v0,v1,-1
  28:	e0a20000 	sc	v0,0(a1)
  2c:	10400006 	beqz	v0,48 <consume_skb+0x48>
  30:	00000000 	nop
  34:	2462ffff 	addiu	v0,v1,-1
  38:	1040fff7 	beqz	v0,18 <consume_skb+0x18>
  3c:	00000000 	nop
  40:	03e00008 	jr	ra
  44:	00000000 	nop
  48:	1000fff5 	b	20 <consume_skb+0x20>
  4c:	00000000 	nop

Disassembly of section .text.skb_recycle_check:

00000000 <skb_recycle_check>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb10018 	sw	s1,24(sp)
   8:	afbf001c 	sw	ra,28(sp)
   c:	afb00014 	sw	s0,20(sp)
  10:	00808821 	move	s1,a0
  14:	40021001 	mfc0	v0,c0_tcstatus
  18:	30420400 	andi	v0,v0,0x400
  1c:	14400016 	bnez	v0,78 <skb_recycle_check+0x78>
  20:	00001021 	move	v0,zero
  24:	8c820054 	lw	v0,84(a0)
  28:	14400012 	bnez	v0,74 <skb_recycle_check+0x74>
  2c:	3c020018 	lui	v0,0x18
  30:	8c860064 	lw	a2,100(a0)
  34:	00c21024 	and	v0,a2,v0
  38:	1440000f 	bnez	v0,78 <skb_recycle_check+0x78>
  3c:	00001021 	move	v0,zero
  40:	8c8700a4 	lw	a3,164(a0)
  44:	8c8200a8 	lw	v0,168(a0)
  48:	24a3003f 	addiu	v1,a1,63
  4c:	2404ffe0 	li	a0,-32
  50:	00641824 	and	v1,v1,a0
  54:	00e21023 	subu	v0,a3,v0
  58:	0043182a 	slt	v1,v0,v1
  5c:	14600006 	bnez	v1,78 <skb_recycle_check+0x78>
  60:	00001021 	move	v0,zero
  64:	8e2300b4 	lw	v1,180(s1)
  68:	24020001 	li	v0,1
  6c:	10620007 	beq	v1,v0,8c <skb_recycle_check+0x8c>
  70:	7cc20780 	ext	v0,a2,0x1e,0x1
  74:	00001021 	move	v0,zero
  78:	8fbf001c 	lw	ra,28(sp)
  7c:	8fb10018 	lw	s1,24(sp)
  80:	8fb00014 	lw	s0,20(sp)
  84:	03e00008 	jr	ra
  88:	27bd0020 	addiu	sp,sp,32
  8c:	10400005 	beqz	v0,a4 <skb_recycle_check+0xa4>
  90:	00000000 	nop
  94:	8ce20028 	lw	v0,40(a3)
  98:	3042ffff 	andi	v0,v0,0xffff
  9c:	1443fff5 	bne	v0,v1,74 <skb_recycle_check+0x74>
  a0:	00000000 	nop
  a4:	0c000000 	jal	0 <skb_recycle_check>
			a4: R_MIPS_26	.text.skb_release_head_state
  a8:	02202021 	move	a0,s1
  ac:	8e3000a4 	lw	s0,164(s1)
  b0:	00002821 	move	a1,zero
  b4:	24060028 	li	a2,40
  b8:	0c000000 	jal	0 <skb_recycle_check>
			b8: R_MIPS_26	memset
  bc:	02002021 	move	a0,s0
  c0:	24030001 	li	v1,1
  c4:	ae030028 	sw	v1,40(s0)
  c8:	02202021 	move	a0,s1
  cc:	00002821 	move	a1,zero
  d0:	0c000000 	jal	0 <skb_recycle_check>
			d0: R_MIPS_26	memset
  d4:	240600a0 	li	a2,160
  d8:	8e2300a8 	lw	v1,168(s1)
  dc:	24020001 	li	v0,1
  e0:	24630020 	addiu	v1,v1,32
  e4:	ae2300a0 	sw	v1,160(s1)
  e8:	0800001e 	j	78 <skb_recycle_check+0x78>
			e8: R_MIPS_26	.text.skb_recycle_check
  ec:	ae2300ac 	sw	v1,172(s1)

Disassembly of section .text.skb_queue_purge:

00000000 <skb_queue_purge>:
   0:	27bdffe8 	addiu	sp,sp,-24
   4:	afb00010 	sw	s0,16(sp)
   8:	afbf0014 	sw	ra,20(sp)
   c:	08000007 	j	1c <skb_queue_purge+0x1c>
			c: R_MIPS_26	.text.skb_queue_purge
  10:	00808021 	move	s0,a0
  14:	0c000000 	jal	0 <skb_queue_purge>
			14: R_MIPS_26	kfree_skb
  18:	00000000 	nop
  1c:	0c000000 	jal	0 <skb_queue_purge>
			1c: R_MIPS_26	skb_dequeue
  20:	02002021 	move	a0,s0
  24:	1440fffb 	bnez	v0,14 <skb_queue_purge+0x14>
  28:	00402021 	move	a0,v0
  2c:	8fbf0014 	lw	ra,20(sp)
  30:	8fb00010 	lw	s0,16(sp)
  34:	03e00008 	jr	ra
  38:	27bd0018 	addiu	sp,sp,24

Disassembly of section .text.pskb_expand_head:

00000000 <pskb_expand_head>:
   0:	27bdffd0 	addiu	sp,sp,-48
   4:	afb40024 	sw	s4,36(sp)
   8:	afb00014 	sw	s0,20(sp)
   c:	afbf002c 	sw	ra,44(sp)
  10:	afb50028 	sw	s5,40(sp)
  14:	afb30020 	sw	s3,32(sp)
  18:	afb2001c 	sw	s2,28(sp)
  1c:	afb10018 	sw	s1,24(sp)
  20:	00a0a021 	move	s4,a1
  24:	00808021 	move	s0,a0
  28:	00e02821 	move	a1,a3
  2c:	8c8900a4 	lw	t1,164(a0)
  30:	8c8800a8 	lw	t0,168(a0)
  34:	001417c2 	srl	v0,s4,0x1f
  38:	00028036 	tne	zero,v0,0x200
  3c:	8c8300b4 	lw	v1,180(a0)
  40:	24020001 	li	v0,1
  44:	10620004 	beq	v1,v0,58 <pskb_expand_head+0x58>
  48:	3c110000 	lui	s1,0x0
			48: R_MIPS_HI16	g_used_skb_num
  4c:	0200000d 	break	0x200
  50:	08000014 	j	50 <pskb_expand_head+0x50>
			50: R_MIPS_26	.text.pskb_expand_head
  54:	00000000 	nop
  58:	3c020000 	lui	v0,0x0
			58: R_MIPS_HI16	g_max_skb_num
  5c:	8c440000 	lw	a0,0(v0)
			5c: R_MIPS_LO16	g_max_skb_num
  60:	8e230000 	lw	v1,0(s1)
			60: R_MIPS_LO16	g_used_skb_num
  64:	0083182a 	slt	v1,a0,v1
  68:	1060000b 	beqz	v1,98 <pskb_expand_head+0x98>
  6c:	2522001f 	addiu	v0,t1,31
  70:	2402fff4 	li	v0,-12
  74:	8fbf002c 	lw	ra,44(sp)
  78:	8fb50028 	lw	s5,40(sp)
  7c:	8fb40024 	lw	s4,36(sp)
  80:	8fb30020 	lw	s3,32(sp)
  84:	8fb2001c 	lw	s2,28(sp)
  88:	8fb10018 	lw	s1,24(sp)
  8c:	8fb00014 	lw	s0,20(sp)
  90:	03e00008 	jr	ra
  94:	27bd0030 	addiu	sp,sp,48
  98:	00481023 	subu	v0,v0,t0
  9c:	00541021 	addu	v0,v0,s4
  a0:	00461021 	addu	v0,v0,a2
  a4:	2403ffe0 	li	v1,-32
  a8:	00439824 	and	s3,v0,v1
  ac:	0c000000 	jal	0 <pskb_expand_head>
			ac: R_MIPS_26	__kmalloc
  b0:	26640108 	addiu	a0,s3,264
  b4:	1040ffee 	beqz	v0,70 <pskb_expand_head+0x70>
  b8:	00409021 	move	s2,v0
  bc:	c2220000 	ll	v0,0(s1)
			bc: R_MIPS_LO16	g_used_skb_num
  c0:	24420001 	addiu	v0,v0,1
  c4:	e2220000 	sc	v0,0(s1)
			c4: R_MIPS_LO16	g_used_skb_num
  c8:	1040005e 	beqz	v0,244 <pskb_expand_head+0x244>
  cc:	00000000 	nop
  d0:	8e0500a8 	lw	a1,168(s0)
  d4:	8e0600a0 	lw	a2,160(s0)
  d8:	0254a821 	addu	s5,s2,s4
  dc:	02a02021 	move	a0,s5
  e0:	0c000000 	jal	0 <pskb_expand_head>
			e0: R_MIPS_26	memcpy
  e4:	00c53023 	subu	a2,a2,a1
  e8:	8e0500a4 	lw	a1,164(s0)
  ec:	02538821 	addu	s1,s2,s3
  f0:	02202021 	move	a0,s1
  f4:	94a20000 	lhu	v0,0(a1)
  f8:	00023100 	sll	a2,v0,0x4
  fc:	00021080 	sll	v0,v0,0x2
 100:	00c23023 	subu	a2,a2,v0
 104:	0c000000 	jal	0 <pskb_expand_head>
			104: R_MIPS_26	memcpy
 108:	24c60030 	addiu	a2,a2,48
 10c:	8e0400a4 	lw	a0,164(s0)
 110:	94820000 	lhu	v0,0(a0)
 114:	10400018 	beqz	v0,178 <pskb_expand_head+0x178>
 118:	00000000 	nop
 11c:	00002821 	move	a1,zero
 120:	00051080 	sll	v0,a1,0x2
 124:	00051900 	sll	v1,a1,0x4
 128:	00621823 	subu	v1,v1,v0
 12c:	00831821 	addu	v1,a0,v1
 130:	8c630030 	lw	v1,48(v1)
 134:	8c620000 	lw	v0,0(v1)
 138:	30428000 	andi	v0,v0,0x8000
 13c:	10400002 	beqz	v0,148 <pskb_expand_head+0x148>
 140:	00000000 	nop
 144:	8c63000c 	lw	v1,12(v1)
 148:	8c620004 	lw	v0,4(v1)
 14c:	c0620004 	ll	v0,4(v1)
 150:	24420001 	addiu	v0,v0,1
 154:	e0620004 	sc	v0,4(v1)
 158:	1040003c 	beqz	v0,24c <pskb_expand_head+0x24c>
 15c:	00000000 	nop
 160:	8e0400a4 	lw	a0,164(s0)
 164:	24a50001 	addiu	a1,a1,1
 168:	94820000 	lhu	v0,0(a0)
 16c:	00a2102a 	slt	v0,a1,v0
 170:	1440ffec 	bnez	v0,124 <pskb_expand_head+0x124>
 174:	00051080 	sll	v0,a1,0x2
 178:	8c830010 	lw	v1,16(a0)
 17c:	10600009 	beqz	v1,1a4 <pskb_expand_head+0x1a4>
 180:	02002021 	move	a0,s0
 184:	c06200b4 	ll	v0,180(v1)
 188:	24420001 	addiu	v0,v0,1
 18c:	e06200b4 	sc	v0,180(v1)
 190:	10400030 	beqz	v0,254 <pskb_expand_head+0x254>
 194:	00000000 	nop
 198:	8c630000 	lw	v1,0(v1)
 19c:	1460fff9 	bnez	v1,184 <pskb_expand_head+0x184>
 1a0:	02002021 	move	a0,s0
 1a4:	0c000073 	jal	1cc <pskb_expand_head+0x1cc>
			1a4: R_MIPS_26	.imem_text
 1a8:	ae00006c 	sw	zero,108(s0)
 1ac:	8e0600a8 	lw	a2,168(s0)
 1b0:	8e0200ac 	lw	v0,172(s0)
 1b4:	8e0300a0 	lw	v1,160(s0)
 1b8:	8e040094 	lw	a0,148(s0)
 1bc:	8e050098 	lw	a1,152(s0)
 1c0:	8e07009c 	lw	a3,156(s0)
 1c4:	02a63023 	subu	a2,s5,a2
 1c8:	00461021 	addu	v0,v0,a2
 1cc:	00661821 	addu	v1,v1,a2
 1d0:	00862021 	addu	a0,a0,a2
 1d4:	00a62821 	addu	a1,a1,a2
 1d8:	ae1200a8 	sw	s2,168(s0)
 1dc:	ae0200ac 	sw	v0,172(s0)
 1e0:	ae1100a4 	sw	s1,164(s0)
 1e4:	ae0300a0 	sw	v1,160(s0)
 1e8:	ae040094 	sw	a0,148(s0)
 1ec:	10e00003 	beqz	a3,1fc <pskb_expand_head+0x1fc>
 1f0:	ae050098 	sw	a1,152(s0)
 1f4:	00e61021 	addu	v0,a3,a2
 1f8:	ae02009c 	sw	v0,156(s0)
 1fc:	8e040064 	lw	a0,100(s0)
 200:	3c033000 	lui	v1,0x3000
 204:	00831024 	and	v0,a0,v1
 208:	14430004 	bne	v0,v1,21c <pskb_expand_head+0x21c>
 20c:	00000000 	nop
 210:	9602005c 	lhu	v0,92(s0)
 214:	02821021 	addu	v0,s4,v0
 218:	a602005c 	sh	v0,92(s0)
 21c:	00801021 	move	v0,a0
 220:	7c02f784 	ins	v0,zero,0x1e,0x1
 224:	8e0300a4 	lw	v1,164(s0)
 228:	7c02dec4 	ins	v0,zero,0x1b,0x1
 22c:	ae020064 	sw	v0,100(s0)
 230:	24020001 	li	v0,1
 234:	a600005a 	sh	zero,90(s0)
 238:	ac620028 	sw	v0,40(v1)
 23c:	0800001d 	j	74 <pskb_expand_head+0x74>
			23c: R_MIPS_26	.text.pskb_expand_head
 240:	00001021 	move	v0,zero
 244:	1000ff9d 	b	bc <pskb_expand_head+0xbc>
 248:	00000000 	nop
 24c:	1000ffbf 	b	14c <pskb_expand_head+0x14c>
 250:	00000000 	nop
 254:	1000ffcb 	b	184 <pskb_expand_head+0x184>
 258:	00000000 	nop

Disassembly of section .text.skb_prepare_for_shift:

00000000 <skb_prepare_for_shift>:
   0:	27bdffe8 	addiu	sp,sp,-24
   4:	afbf0014 	sw	ra,20(sp)
   8:	8c820064 	lw	v0,100(a0)
   c:	7c420780 	ext	v0,v0,0x1e,0x1
  10:	1040000e 	beqz	v0,4c <skb_prepare_for_shift+0x4c>
  14:	8fbf0014 	lw	ra,20(sp)
  18:	8c8200a4 	lw	v0,164(a0)
  1c:	8c430028 	lw	v1,40(v0)
  20:	24020001 	li	v0,1
  24:	3063ffff 	andi	v1,v1,0xffff
  28:	10620008 	beq	v1,v0,4c <skb_prepare_for_shift+0x4c>
  2c:	00002821 	move	a1,zero
  30:	00003021 	move	a2,zero
  34:	0c000000 	jal	0 <skb_prepare_for_shift>
			34: R_MIPS_26	pskb_expand_head
  38:	24070020 	li	a3,32
  3c:	8fbf0014 	lw	ra,20(sp)
  40:	0002102b 	sltu	v0,zero,v0
  44:	03e00008 	jr	ra
  48:	27bd0018 	addiu	sp,sp,24
  4c:	00001021 	move	v0,zero
  50:	03e00008 	jr	ra
  54:	27bd0018 	addiu	sp,sp,24

Disassembly of section .text.skb_shift:

00000000 <skb_shift>:
   0:	27bdffc8 	addiu	sp,sp,-56
   4:	afb60028 	sw	s6,40(sp)
   8:	afb50024 	sw	s5,36(sp)
   c:	afb3001c 	sw	s3,28(sp)
  10:	afbf0034 	sw	ra,52(sp)
  14:	afbe0030 	sw	s8,48(sp)
  18:	afb7002c 	sw	s7,44(sp)
  1c:	afb40020 	sw	s4,32(sp)
  20:	afb20018 	sw	s2,24(sp)
  24:	afb10014 	sw	s1,20(sp)
  28:	afb00010 	sw	s0,16(sp)
  2c:	8ca80050 	lw	t0,80(a1)
  30:	00a0b021 	move	s6,a1
  34:	00c09821 	move	s3,a2
  38:	0080a821 	move	s5,a0
  3c:	0106182b 	sltu	v1,t0,a2
  40:	00038036 	tne	zero,v1,0x200
  44:	8ca20054 	lw	v0,84(a1)
  48:	01021023 	subu	v0,t0,v0
  4c:	00028036 	tne	zero,v0,0x200
  50:	8c8400a4 	lw	a0,164(a0)
  54:	8ca700a4 	lw	a3,164(a1)
  58:	94920000 	lhu	s2,0(a0)
  5c:	1240000a 	beqz	s2,88 <skb_shift+0x88>
  60:	0240a021 	move	s4,s2
  64:	2645ffff 	addiu	a1,s2,-1
  68:	00051880 	sll	v1,a1,0x2
  6c:	00051100 	sll	v0,a1,0x4
  70:	0043b823 	subu	s7,v0,v1
  74:	00972021 	addu	a0,a0,s7
  78:	8ce30030 	lw	v1,48(a3)
  7c:	8c820030 	lw	v0,48(a0)
  80:	106200ae 	beq	v1,v0,33c <skb_shift+0x33c>
  84:	8ce60034 	lw	a2,52(a3)
  88:	02608821 	move	s1,s3
  8c:	00008021 	move	s0,zero
  90:	241effff 	li	s8,-1
  94:	16680007 	bne	s3,t0,b4 <skb_shift+0xb4>
  98:	24020012 	li	v0,18
  9c:	94e30000 	lhu	v1,0(a3)
  a0:	00521023 	subu	v0,v0,s2
  a4:	00701823 	subu	v1,v1,s0
  a8:	0043182b 	sltu	v1,v0,v1
  ac:	14600005 	bnez	v1,c4 <skb_shift+0xc4>
  b0:	00000000 	nop
  b4:	0c000000 	jal	0 <skb_shift>
			b4: R_MIPS_26	.text.skb_prepare_for_shift
  b8:	02c02021 	move	a0,s6
  bc:	1040000f 	beqz	v0,fc <skb_shift+0xfc>
  c0:	00000000 	nop
  c4:	00009821 	move	s3,zero
  c8:	8fbf0034 	lw	ra,52(sp)
  cc:	02601021 	move	v0,s3
  d0:	8fbe0030 	lw	s8,48(sp)
  d4:	8fb7002c 	lw	s7,44(sp)
  d8:	8fb60028 	lw	s6,40(sp)
  dc:	8fb50024 	lw	s5,36(sp)
  e0:	8fb40020 	lw	s4,32(sp)
  e4:	8fb3001c 	lw	s3,28(sp)
  e8:	8fb20018 	lw	s2,24(sp)
  ec:	8fb10014 	lw	s1,20(sp)
  f0:	8fb00010 	lw	s0,16(sp)
  f4:	03e00008 	jr	ra
  f8:	27bd0038 	addiu	sp,sp,56
  fc:	0c000000 	jal	0 <skb_shift>
			fc: R_MIPS_26	.text.skb_prepare_for_shift
 100:	02a02021 	move	a0,s5
 104:	1440ffef 	bnez	v0,c4 <skb_shift+0xc4>
 108:	00000000 	nop
 10c:	1a200057 	blez	s1,26c <skb_shift+0x26c>
 110:	00000000 	nop
 114:	8ec500a4 	lw	a1,164(s6)
 118:	94a20000 	lhu	v0,0(a1)
 11c:	0202102a 	slt	v0,s0,v0
 120:	10400052 	beqz	v0,26c <skb_shift+0x26c>
 124:	24020012 	li	v0,18
 128:	1242ffe6 	beq	s2,v0,c4 <skb_shift+0xc4>
 12c:	00103100 	sll	a2,s0,0x4
 130:	00102080 	sll	a0,s0,0x2
 134:	00c41023 	subu	v0,a2,a0
 138:	00a21021 	addu	v0,a1,v0
 13c:	8c430038 	lw	v1,56(v0)
 140:	02204021 	move	t0,s1
 144:	02404821 	move	t1,s2
 148:	0223182b 	sltu	v1,s1,v1
 14c:	14600026 	bnez	v1,1e8 <skb_shift+0x1e8>
 150:	8eaa00a4 	lw	t2,164(s5)
 154:	01305823 	subu	t3,t1,s0
 158:	240c0012 	li	t4,18
 15c:	00c42023 	subu	a0,a2,a0
 160:	00a42021 	addu	a0,a1,a0
 164:	8c860030 	lw	a2,48(a0)
 168:	8c870034 	lw	a3,52(a0)
 16c:	8c850038 	lw	a1,56(a0)
 170:	00091880 	sll	v1,t1,0x2
 174:	00091100 	sll	v0,t1,0x4
 178:	00431023 	subu	v0,v0,v1
 17c:	01421021 	addu	v0,t2,v0
 180:	ac460030 	sw	a2,48(v0)
 184:	ac470034 	sw	a3,52(v0)
 188:	ac450038 	sw	a1,56(v0)
 18c:	8c830038 	lw	v1,56(a0)
 190:	26100001 	addiu	s0,s0,1
 194:	00102080 	sll	a0,s0,0x2
 198:	00103100 	sll	a2,s0,0x4
 19c:	01034023 	subu	t0,t0,v1
 1a0:	26940001 	addiu	s4,s4,1
 1a4:	00c41023 	subu	v0,a2,a0
 1a8:	01703821 	addu	a3,t3,s0
 1ac:	02804821 	move	t1,s4
 1b0:	1900002e 	blez	t0,26c <skb_shift+0x26c>
 1b4:	01008821 	move	s1,t0
 1b8:	8ec500a4 	lw	a1,164(s6)
 1bc:	00a21821 	addu	v1,a1,v0
 1c0:	94a20000 	lhu	v0,0(a1)
 1c4:	0202102a 	slt	v0,s0,v0
 1c8:	10400028 	beqz	v0,26c <skb_shift+0x26c>
 1cc:	00000000 	nop
 1d0:	10ecffbc 	beq	a3,t4,c4 <skb_shift+0xc4>
 1d4:	00000000 	nop
 1d8:	8c620038 	lw	v0,56(v1)
 1dc:	0102102b 	sltu	v0,t0,v0
 1e0:	1040ffde 	beqz	v0,15c <skb_shift+0x15c>
 1e4:	8eaa00a4 	lw	t2,164(s5)
 1e8:	00c41023 	subu	v0,a2,a0
 1ec:	00a21021 	addu	v0,a1,v0
 1f0:	8c420030 	lw	v0,48(v0)
 1f4:	8c430000 	lw	v1,0(v0)
 1f8:	30638000 	andi	v1,v1,0x8000
 1fc:	10600002 	beqz	v1,208 <skb_shift+0x208>
 200:	00000000 	nop
 204:	8c42000c 	lw	v0,12(v0)
 208:	8c430004 	lw	v1,4(v0)
 20c:	c0430004 	ll	v1,4(v0)
 210:	24630001 	addiu	v1,v1,1
 214:	e0430004 	sc	v1,4(v0)
 218:	10600080 	beqz	v1,41c <skb_shift+0x41c>
 21c:	00000000 	nop
 220:	00c42023 	subu	a0,a2,a0
 224:	00a42021 	addu	a0,a1,a0
 228:	8c850034 	lw	a1,52(a0)
 22c:	00091080 	sll	v0,t1,0x2
 230:	00091900 	sll	v1,t1,0x4
 234:	00621823 	subu	v1,v1,v0
 238:	01431821 	addu	v1,t2,v1
 23c:	ac650034 	sw	a1,52(v1)
 240:	ac680038 	sw	t0,56(v1)
 244:	8c850034 	lw	a1,52(a0)
 248:	8c820038 	lw	v0,56(a0)
 24c:	8c860030 	lw	a2,48(a0)
 250:	01052821 	addu	a1,t0,a1
 254:	00481023 	subu	v0,v0,t0
 258:	ac820038 	sw	v0,56(a0)
 25c:	ac660030 	sw	a2,48(v1)
 260:	ac850034 	sw	a1,52(a0)
 264:	26940001 	addiu	s4,s4,1
 268:	00008821 	move	s1,zero
 26c:	8ea200a4 	lw	v0,164(s5)
 270:	2403ffff 	li	v1,-1
 274:	13c3000d 	beq	s8,v1,2ac <skb_shift+0x2ac>
 278:	a4540000 	sh	s4,0(v0)
 27c:	8ea500a4 	lw	a1,164(s5)
 280:	8ec600a4 	lw	a2,164(s6)
 284:	001e1880 	sll	v1,s8,0x2
 288:	001e1100 	sll	v0,s8,0x4
 28c:	00431023 	subu	v0,v0,v1
 290:	00a22821 	addu	a1,a1,v0
 294:	8cc30038 	lw	v1,56(a2)
 298:	8ca20038 	lw	v0,56(a1)
 29c:	8cc40030 	lw	a0,48(a2)
 2a0:	00621821 	addu	v1,v1,v0
 2a4:	0c000000 	jal	0 <skb_shift>
			2a4: R_MIPS_26	put_page
 2a8:	aca30038 	sw	v1,56(a1)
 2ac:	8ec700a4 	lw	a3,164(s6)
 2b0:	00004021 	move	t0,zero
 2b4:	94e20000 	lhu	v0,0(a3)
 2b8:	0202102a 	slt	v0,s0,v0
 2bc:	10400016 	beqz	v0,318 <skb_shift+0x318>
 2c0:	00001821 	move	v1,zero
 2c4:	00101880 	sll	v1,s0,0x2
 2c8:	00101100 	sll	v0,s0,0x4
 2cc:	00431023 	subu	v0,v0,v1
 2d0:	00e21021 	addu	v0,a3,v0
 2d4:	8c440038 	lw	a0,56(v0)
 2d8:	8c450030 	lw	a1,48(v0)
 2dc:	8c460034 	lw	a2,52(v0)
 2e0:	00081880 	sll	v1,t0,0x2
 2e4:	00081100 	sll	v0,t0,0x4
 2e8:	00431023 	subu	v0,v0,v1
 2ec:	00e21021 	addu	v0,a3,v0
 2f0:	ac440038 	sw	a0,56(v0)
 2f4:	ac450030 	sw	a1,48(v0)
 2f8:	ac460034 	sw	a2,52(v0)
 2fc:	8ec700a4 	lw	a3,164(s6)
 300:	26100001 	addiu	s0,s0,1
 304:	94e20000 	lhu	v0,0(a3)
 308:	0202102a 	slt	v0,s0,v0
 30c:	1440ffed 	bnez	v0,2c4 <skb_shift+0x2c4>
 310:	25080001 	addiu	t0,t0,1
 314:	3103ffff 	andi	v1,t0,0xffff
 318:	a4e30000 	sh	v1,0(a3)
 31c:	1a200004 	blez	s1,330 <skb_shift+0x330>
 320:	00001821 	move	v1,zero
 324:	8ec200a4 	lw	v0,164(s6)
 328:	94430000 	lhu	v1,0(v0)
 32c:	2c630001 	sltiu	v1,v1,1
 330:	00038036 	tne	zero,v1,0x200
 334:	080000ee 	j	3b8 <skb_shift+0x3b8>
			334: R_MIPS_26	.text.skb_shift
 338:	8ea20064 	lw	v0,100(s5)
 33c:	8c830034 	lw	v1,52(a0)
 340:	8c820038 	lw	v0,56(a0)
 344:	00431021 	addu	v0,v0,v1
 348:	14c2ff50 	bne	a2,v0,8c <skb_shift+0x8c>
 34c:	02608821 	move	s1,s3
 350:	8ce20038 	lw	v0,56(a3)
 354:	00a0f021 	move	s8,a1
 358:	02628823 	subu	s1,s3,v0
 35c:	0621ff4d 	bgez	s1,94 <skb_shift+0x94>
 360:	24100001 	li	s0,1
 364:	0c000000 	jal	0 <skb_shift>
			364: R_MIPS_26	.text.skb_prepare_for_shift
 368:	02c02021 	move	a0,s6
 36c:	1440ff55 	bnez	v0,c4 <skb_shift+0xc4>
 370:	00000000 	nop
 374:	0c000000 	jal	0 <skb_shift>
			374: R_MIPS_26	.text.skb_prepare_for_shift
 378:	02a02021 	move	a0,s5
 37c:	1440ff51 	bnez	v0,c4 <skb_shift+0xc4>
 380:	00000000 	nop
 384:	8ea400a4 	lw	a0,164(s5)
 388:	8ec600a4 	lw	a2,164(s6)
 38c:	00972021 	addu	a0,a0,s7
 390:	8c820038 	lw	v0,56(a0)
 394:	8cc50034 	lw	a1,52(a2)
 398:	02621021 	addu	v0,s3,v0
 39c:	ac820038 	sw	v0,56(a0)
 3a0:	8cc30038 	lw	v1,56(a2)
 3a4:	00b32821 	addu	a1,a1,s3
 3a8:	acc50034 	sw	a1,52(a2)
 3ac:	00731823 	subu	v1,v1,s3
 3b0:	acc30038 	sw	v1,56(a2)
 3b4:	8ea20064 	lw	v0,100(s5)
 3b8:	24060003 	li	a2,3
 3bc:	7cc2ef04 	ins	v0,a2,0x1c,0x2
 3c0:	aea20064 	sw	v0,100(s5)
 3c4:	8ec30064 	lw	v1,100(s6)
 3c8:	8ec40050 	lw	a0,80(s6)
 3cc:	8ec50054 	lw	a1,84(s6)
 3d0:	8ec200b0 	lw	v0,176(s6)
 3d4:	7cc3ef04 	ins	v1,a2,0x1c,0x2
 3d8:	00932023 	subu	a0,a0,s3
 3dc:	00531023 	subu	v0,v0,s3
 3e0:	00b32823 	subu	a1,a1,s3
 3e4:	aec30064 	sw	v1,100(s6)
 3e8:	aec40050 	sw	a0,80(s6)
 3ec:	aec200b0 	sw	v0,176(s6)
 3f0:	aec50054 	sw	a1,84(s6)
 3f4:	8ea30050 	lw	v1,80(s5)
 3f8:	8ea40054 	lw	a0,84(s5)
 3fc:	8ea200b0 	lw	v0,176(s5)
 400:	00731821 	addu	v1,v1,s3
 404:	00932021 	addu	a0,a0,s3
 408:	00531021 	addu	v0,v0,s3
 40c:	aea200b0 	sw	v0,176(s5)
 410:	aea30050 	sw	v1,80(s5)
 414:	08000032 	j	c8 <skb_shift+0xc8>
			414: R_MIPS_26	.text.skb_shift
 418:	aea40054 	sw	a0,84(s5)
 41c:	1000ff7b 	b	20c <skb_shift+0x20c>
 420:	00000000 	nop

Disassembly of section .text.skb_clone:

00000000 <skb_clone>:
   0:	27bdffe8 	addiu	sp,sp,-24
   4:	afb00010 	sw	s0,16(sp)
   8:	afbf0014 	sw	ra,20(sp)
   c:	8c830064 	lw	v1,100(a0)
  10:	3c060018 	lui	a2,0x18
  14:	3c020008 	lui	v0,0x8
  18:	00661824 	and	v1,v1,a2
  1c:	14620014 	bne	v1,v0,70 <skb_clone+0x70>
  20:	00808021 	move	s0,a0
  24:	248400b8 	addiu	a0,a0,184
  28:	8c830064 	lw	v1,100(a0)
  2c:	00661024 	and	v0,v1,a2
  30:	14400010 	bnez	v0,74 <skb_clone+0x74>
  34:	3c020000 	lui	v0,0x0
			34: R_MIPS_HI16	.bss
  38:	00601021 	move	v0,v1
  3c:	24030002 	li	v1,2
  40:	7c62a4c4 	ins	v0,v1,0x13,0x2
  44:	ac820064 	sw	v0,100(a0)
  48:	c2020170 	ll	v0,368(s0)
  4c:	24420001 	addiu	v0,v0,1
  50:	e2020170 	sc	v0,368(s0)
  54:	10400017 	beqz	v0,b4 <skb_clone+0xb4>
  58:	00000000 	nop
  5c:	02002821 	move	a1,s0
  60:	8fbf0014 	lw	ra,20(sp)
  64:	8fb00010 	lw	s0,16(sp)
  68:	08000000 	j	0 <skb_clone>
			68: R_MIPS_26	.text.__skb_clone
  6c:	27bd0018 	addiu	sp,sp,24
  70:	3c020000 	lui	v0,0x0
			70: R_MIPS_HI16	.bss
  74:	0c000000 	jal	0 <skb_clone>
			74: R_MIPS_26	kmem_cache_alloc
  78:	8c440070 	lw	a0,112(v0)
			78: R_MIPS_LO16	.bss
  7c:	10400009 	beqz	v0,a4 <skb_clone+0xa4>
  80:	00402021 	move	a0,v0
  84:	8c420064 	lw	v0,100(v0)
  88:	02002821 	move	a1,s0
  8c:	7c02a4c4 	ins	v0,zero,0x13,0x2
  90:	ac820064 	sw	v0,100(a0)
  94:	8fbf0014 	lw	ra,20(sp)
  98:	8fb00010 	lw	s0,16(sp)
  9c:	08000000 	j	0 <skb_clone>
			9c: R_MIPS_26	.text.__skb_clone
  a0:	27bd0018 	addiu	sp,sp,24
  a4:	8fbf0014 	lw	ra,20(sp)
  a8:	8fb00010 	lw	s0,16(sp)
  ac:	03e00008 	jr	ra
  b0:	27bd0018 	addiu	sp,sp,24
  b4:	1000ffe4 	b	48 <skb_clone+0x48>
  b8:	00000000 	nop

Disassembly of section .text.skb_tstamp_tx:

00000000 <skb_tstamp_tx>:
   0:	27bdffd8 	addiu	sp,sp,-40
   4:	afb00018 	sw	s0,24(sp)
   8:	afbf0024 	sw	ra,36(sp)
   c:	afb20020 	sw	s2,32(sp)
  10:	afb1001c 	sw	s1,28(sp)
  14:	8c920010 	lw	s2,16(a0)
  18:	1240001e 	beqz	s2,94 <skb_tstamp_tx+0x94>
  1c:	00a08021 	move	s0,a1
  20:	0c000000 	jal	0 <skb_tstamp_tx>
			20: R_MIPS_26	skb_clone
  24:	24050020 	li	a1,32
  28:	1040001a 	beqz	v0,94 <skb_tstamp_tx+0x94>
  2c:	00408821 	move	s1,v0
  30:	12000024 	beqz	s0,c4 <skb_tstamp_tx+0xc4>
  34:	00000000 	nop
  38:	8e06000c 	lw	a2,12(s0)
  3c:	8c4200a4 	lw	v0,164(v0)
  40:	8e030000 	lw	v1,0(s0)
  44:	8e040004 	lw	a0,4(s0)
  48:	8e050008 	lw	a1,8(s0)
  4c:	ac460024 	sw	a2,36(v0)
  50:	ac430018 	sw	v1,24(v0)
  54:	ac44001c 	sw	a0,28(v0)
  58:	ac450020 	sw	a1,32(v0)
  5c:	26300018 	addiu	s0,s1,24
  60:	02002021 	move	a0,s0
  64:	00002821 	move	a1,zero
  68:	0c000000 	jal	0 <skb_tstamp_tx>
			68: R_MIPS_26	memset
  6c:	24060028 	li	a2,40
  70:	24030004 	li	v1,4
  74:	24020023 	li	v0,35
  78:	a2030018 	sb	v1,24(s0)
  7c:	ae020014 	sw	v0,20(s0)
  80:	02402021 	move	a0,s2
  84:	0c000000 	jal	0 <skb_tstamp_tx>
			84: R_MIPS_26	sock_queue_err_skb
  88:	02202821 	move	a1,s1
  8c:	14400007 	bnez	v0,ac <skb_tstamp_tx+0xac>
  90:	02202021 	move	a0,s1
  94:	8fbf0024 	lw	ra,36(sp)
  98:	8fb20020 	lw	s2,32(sp)
  9c:	8fb1001c 	lw	s1,28(sp)
  a0:	8fb00018 	lw	s0,24(sp)
  a4:	03e00008 	jr	ra
  a8:	27bd0028 	addiu	sp,sp,40
  ac:	8fbf0024 	lw	ra,36(sp)
  b0:	8fb20020 	lw	s2,32(sp)
  b4:	8fb1001c 	lw	s1,28(sp)
  b8:	8fb00018 	lw	s0,24(sp)
  bc:	08000000 	j	0 <skb_tstamp_tx>
			bc: R_MIPS_26	kfree_skb
  c0:	27bd0028 	addiu	sp,sp,40
  c4:	0c000000 	jal	0 <skb_tstamp_tx>
			c4: R_MIPS_26	ktime_get_real
  c8:	27a40010 	addiu	a0,sp,16
  cc:	8fa30014 	lw	v1,20(sp)
  d0:	8fa20010 	lw	v0,16(sp)
  d4:	ae23000c 	sw	v1,12(s1)
  d8:	08000017 	j	5c <skb_tstamp_tx+0x5c>
			d8: R_MIPS_26	.text.skb_tstamp_tx
  dc:	ae220008 	sw	v0,8(s1)

Disassembly of section .text.__pskb_pull_tail:

00000000 <__pskb_pull_tail>:
   0:	27bdffd0 	addiu	sp,sp,-48
   4:	afb50028 	sw	s5,40(sp)
   8:	afb40024 	sw	s4,36(sp)
   c:	afbf002c 	sw	ra,44(sp)
  10:	afb30020 	sw	s3,32(sp)
  14:	afb2001c 	sw	s2,28(sp)
  18:	afb10018 	sw	s1,24(sp)
  1c:	afb00014 	sw	s0,20(sp)
  20:	0080a021 	move	s4,a0
  24:	8c8400a0 	lw	a0,160(a0)
  28:	8e8300a4 	lw	v1,164(s4)
  2c:	00851021 	addu	v0,a0,a1
  30:	00431023 	subu	v0,v0,v1
  34:	1c40005d 	bgtz	v0,1ac <__pskb_pull_tail+0x1ac>
  38:	00a0a821 	move	s5,a1
  3c:	8e820064 	lw	v0,100(s4)
  40:	7c420780 	ext	v0,v0,0x1e,0x1
  44:	1040000d 	beqz	v0,7c <__pskb_pull_tail+0x7c>
  48:	00000000 	nop
  4c:	8c620028 	lw	v0,40(v1)
  50:	24030001 	li	v1,1
  54:	3042ffff 	andi	v0,v0,0xffff
  58:	10430008 	beq	v0,v1,7c <__pskb_pull_tail+0x7c>
  5c:	00003021 	move	a2,zero
  60:	02802021 	move	a0,s4
  64:	00002821 	move	a1,zero
  68:	0c000000 	jal	0 <__pskb_pull_tail>
			68: R_MIPS_26	pskb_expand_head
  6c:	24070020 	li	a3,32
  70:	14400051 	bnez	v0,1b8 <__pskb_pull_tail+0x1b8>
  74:	00001021 	move	v0,zero
  78:	8e8400a0 	lw	a0,160(s4)
  7c:	8e820050 	lw	v0,80(s4)
  80:	8e850054 	lw	a1,84(s4)
  84:	00803021 	move	a2,a0
  88:	02a03821 	move	a3,s5
  8c:	02802021 	move	a0,s4
  90:	0c000000 	jal	0 <__pskb_pull_tail>
			90: R_MIPS_26	skb_copy_bits
  94:	00452823 	subu	a1,v0,a1
  98:	10400004 	beqz	v0,ac <__pskb_pull_tail+0xac>
  9c:	00000000 	nop
  a0:	0200000d 	break	0x200
  a4:	08000029 	j	a4 <__pskb_pull_tail+0xa4>
			a4: R_MIPS_26	.text.__pskb_pull_tail
  a8:	00000000 	nop
  ac:	8e8500a4 	lw	a1,164(s4)
  b0:	8ca40010 	lw	a0,16(a1)
  b4:	1080004e 	beqz	a0,1f0 <__pskb_pull_tail+0x1f0>
  b8:	00a04821 	move	t1,a1
  bc:	94aa0000 	lhu	t2,0(a1)
  c0:	11400085 	beqz	t2,2d8 <__pskb_pull_tail+0x2d8>
  c4:	02a01021 	move	v0,s5
  c8:	8ca70038 	lw	a3,56(a1)
  cc:	00f5102b 	sltu	v0,a3,s5
  d0:	1040004a 	beqz	v0,1fc <__pskb_pull_tail+0x1fc>
  d4:	00a04021 	move	t0,a1
  d8:	02a03021 	move	a2,s5
  dc:	0800003d 	j	f4 <__pskb_pull_tail+0xf4>
			dc: R_MIPS_26	.text.__pskb_pull_tail
  e0:	00001821 	move	v1,zero
  e4:	8d070044 	lw	a3,68(t0)
  e8:	00e6102b 	sltu	v0,a3,a2
  ec:	10400043 	beqz	v0,1fc <__pskb_pull_tail+0x1fc>
  f0:	2508000c 	addiu	t0,t0,12
  f4:	24630001 	addiu	v1,v1,1
  f8:	006a102a 	slt	v0,v1,t2
  fc:	1440fff9 	bnez	v0,e4 <__pskb_pull_tail+0xe4>
 100:	00c73023 	subu	a2,a2,a3
 104:	00c01021 	move	v0,a2
 108:	00c09021 	move	s2,a2
 10c:	10400039 	beqz	v0,1f4 <__pskb_pull_tail+0x1f4>
 110:	00808021 	move	s0,a0
 114:	0800004a 	j	128 <__pskb_pull_tail+0x128>
			114: R_MIPS_26	.text.__pskb_pull_tail
 118:	2e020001 	sltiu	v0,s0,1
 11c:	12400070 	beqz	s2,2e0 <__pskb_pull_tail+0x2e0>
 120:	8e100000 	lw	s0,0(s0)
 124:	2e020001 	sltiu	v0,s0,1
 128:	00028036 	tne	zero,v0,0x200
 12c:	8e050050 	lw	a1,80(s0)
 130:	0245102b 	sltu	v0,s2,a1
 134:	1040fff9 	beqz	v0,11c <__pskb_pull_tail+0x11c>
 138:	02459023 	subu	s2,s2,a1
 13c:	02459021 	addu	s2,s2,a1
 140:	8e0300b4 	lw	v1,180(s0)
 144:	24020001 	li	v0,1
 148:	14620072 	bne	v1,v0,314 <__pskb_pull_tail+0x314>
 14c:	02009821 	move	s3,s0
 150:	00008821 	move	s1,zero
 154:	8e020054 	lw	v0,84(s0)
 158:	00a21023 	subu	v0,a1,v0
 15c:	0052182b 	sltu	v1,v0,s2
 160:	14600064 	bnez	v1,2f4 <__pskb_pull_tail+0x2f4>
 164:	02422823 	subu	a1,s2,v0
 168:	8e020050 	lw	v0,80(s0)
 16c:	8e0300ac 	lw	v1,172(s0)
 170:	00521023 	subu	v0,v0,s2
 174:	00721821 	addu	v1,v1,s2
 178:	ae020050 	sw	v0,80(s0)
 17c:	10600061 	beqz	v1,304 <__pskb_pull_tail+0x304>
 180:	ae0300ac 	sw	v1,172(s0)
 184:	8e8900a4 	lw	t1,164(s4)
 188:	8d240010 	lw	a0,16(t1)
 18c:	10930013 	beq	a0,s3,1dc <__pskb_pull_tail+0x1dc>
 190:	00000000 	nop
 194:	8c820000 	lw	v0,0(a0)
 198:	0c000000 	jal	0 <__pskb_pull_tail>
			198: R_MIPS_26	kfree_skb
 19c:	ad220010 	sw	v0,16(t1)
 1a0:	8e8900a4 	lw	t1,164(s4)
 1a4:	08000063 	j	18c <__pskb_pull_tail+0x18c>
			1a4: R_MIPS_26	.text.__pskb_pull_tail
 1a8:	8d240010 	lw	a0,16(t1)
 1ac:	08000018 	j	60 <__pskb_pull_tail+0x60>
			1ac: R_MIPS_26	.text.__pskb_pull_tail
 1b0:	24460080 	addiu	a2,v0,128
 1b4:	00001021 	move	v0,zero
 1b8:	8fbf002c 	lw	ra,44(sp)
 1bc:	8fb50028 	lw	s5,40(sp)
 1c0:	8fb40024 	lw	s4,36(sp)
 1c4:	8fb30020 	lw	s3,32(sp)
 1c8:	8fb2001c 	lw	s2,28(sp)
 1cc:	8fb10018 	lw	s1,24(sp)
 1d0:	8fb00014 	lw	s0,20(sp)
 1d4:	03e00008 	jr	ra
 1d8:	27bd0030 	addiu	sp,sp,48
 1dc:	12200043 	beqz	s1,2ec <__pskb_pull_tail+0x2ec>
 1e0:	01202821 	move	a1,t1
 1e4:	ae330000 	sw	s3,0(s1)
 1e8:	ad310010 	sw	s1,16(t1)
 1ec:	8e8500a4 	lw	a1,164(s4)
 1f0:	94aa0000 	lhu	t2,0(a1)
 1f4:	11400028 	beqz	t2,298 <__pskb_pull_tail+0x298>
 1f8:	00001021 	move	v0,zero
 1fc:	02a08021 	move	s0,s5
 200:	00009021 	move	s2,zero
 204:	00008821 	move	s1,zero
 208:	00121880 	sll	v1,s2,0x2
 20c:	00121100 	sll	v0,s2,0x4
 210:	00439823 	subu	s3,v0,v1
 214:	00b32021 	addu	a0,a1,s3
 218:	8c870038 	lw	a3,56(a0)
 21c:	00111100 	sll	v0,s1,0x4
 220:	00111880 	sll	v1,s1,0x2
 224:	00433023 	subu	a2,v0,v1
 228:	0207102b 	sltu	v0,s0,a3
 22c:	10400023 	beqz	v0,2bc <__pskb_pull_tail+0x2bc>
 230:	00a62821 	addu	a1,a1,a2
 234:	8c830034 	lw	v1,52(a0)
 238:	8c820030 	lw	v0,48(a0)
 23c:	26310001 	addiu	s1,s1,1
 240:	aca70038 	sw	a3,56(a1)
 244:	aca20030 	sw	v0,48(a1)
 248:	1200000b 	beqz	s0,278 <__pskb_pull_tail+0x278>
 24c:	aca30034 	sw	v1,52(a1)
 250:	8e8300a4 	lw	v1,164(s4)
 254:	00661821 	addu	v1,v1,a2
 258:	8c620034 	lw	v0,52(v1)
 25c:	02021021 	addu	v0,s0,v0
 260:	ac620034 	sw	v0,52(v1)
 264:	8e8400a4 	lw	a0,164(s4)
 268:	00862021 	addu	a0,a0,a2
 26c:	8c820038 	lw	v0,56(a0)
 270:	00501023 	subu	v0,v0,s0
 274:	ac820038 	sw	v0,56(a0)
 278:	8e8500a4 	lw	a1,164(s4)
 27c:	00008021 	move	s0,zero
 280:	94a20000 	lhu	v0,0(a1)
 284:	26520001 	addiu	s2,s2,1
 288:	0242102a 	slt	v0,s2,v0
 28c:	1440ffdf 	bnez	v0,20c <__pskb_pull_tail+0x20c>
 290:	00121880 	sll	v1,s2,0x2
 294:	3222ffff 	andi	v0,s1,0xffff
 298:	a4a20000 	sh	v0,0(a1)
 29c:	8e8300a0 	lw	v1,160(s4)
 2a0:	8e820054 	lw	v0,84(s4)
 2a4:	00751821 	addu	v1,v1,s5
 2a8:	00551023 	subu	v0,v0,s5
 2ac:	ae820054 	sw	v0,84(s4)
 2b0:	ae8300a0 	sw	v1,160(s4)
 2b4:	0800006e 	j	1b8 <__pskb_pull_tail+0x1b8>
			2b4: R_MIPS_26	.text.__pskb_pull_tail
 2b8:	00601021 	move	v0,v1
 2bc:	0c000000 	jal	0 <__pskb_pull_tail>
			2bc: R_MIPS_26	put_page
 2c0:	8c840030 	lw	a0,48(a0)
 2c4:	8e8500a4 	lw	a1,164(s4)
 2c8:	00b31021 	addu	v0,a1,s3
 2cc:	8c430038 	lw	v1,56(v0)
 2d0:	080000a0 	j	280 <__pskb_pull_tail+0x280>
			2d0: R_MIPS_26	.text.__pskb_pull_tail
 2d4:	02038023 	subu	s0,s0,v1
 2d8:	08000043 	j	10c <__pskb_pull_tail+0x10c>
			2d8: R_MIPS_26	.text.__pskb_pull_tail
 2dc:	02a09021 	move	s2,s5
 2e0:	02009821 	move	s3,s0
 2e4:	08000063 	j	18c <__pskb_pull_tail+0x18c>
			2e4: R_MIPS_26	.text.__pskb_pull_tail
 2e8:	00008821 	move	s1,zero
 2ec:	0800007d 	j	1f4 <__pskb_pull_tail+0x1f4>
			2ec: R_MIPS_26	.text.__pskb_pull_tail
 2f0:	952a0000 	lhu	t2,0(t1)
 2f4:	0c000000 	jal	0 <__pskb_pull_tail>
			2f4: R_MIPS_26	__pskb_pull_tail
 2f8:	02002021 	move	a0,s0
 2fc:	1440ff9a 	bnez	v0,168 <__pskb_pull_tail+0x168>
 300:	00000000 	nop
 304:	0c000000 	jal	0 <__pskb_pull_tail>
			304: R_MIPS_26	kfree_skb
 308:	02202021 	move	a0,s1
 30c:	0800006e 	j	1b8 <__pskb_pull_tail+0x1b8>
			30c: R_MIPS_26	.text.__pskb_pull_tail
 310:	00001021 	move	v0,zero
 314:	02002021 	move	a0,s0
 318:	0c000000 	jal	0 <__pskb_pull_tail>
			318: R_MIPS_26	skb_clone
 31c:	24050020 	li	a1,32
 320:	1040ffa4 	beqz	v0,1b4 <__pskb_pull_tail+0x1b4>
 324:	00408821 	move	s1,v0
 328:	8c450050 	lw	a1,80(v0)
 32c:	00b2102b 	sltu	v0,a1,s2
 330:	1440fff4 	bnez	v0,304 <__pskb_pull_tail+0x304>
 334:	8e130000 	lw	s3,0(s0)
 338:	08000055 	j	154 <__pskb_pull_tail+0x154>
			338: R_MIPS_26	.text.__pskb_pull_tail
 33c:	02208021 	move	s0,s1

Disassembly of section .text.skb_pad:

00000000 <skb_pad>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb20018 	sw	s2,24(sp)
   8:	afb10014 	sw	s1,20(sp)
   c:	afbf001c 	sw	ra,28(sp)
  10:	afb00010 	sw	s0,16(sp)
  14:	8c830064 	lw	v1,100(a0)
  18:	3c024000 	lui	v0,0x4000
  1c:	00808821 	move	s1,a0
  20:	00623824 	and	a3,v1,v0
  24:	10e00029 	beqz	a3,cc <skb_pad+0xcc>
  28:	00a09021 	move	s2,a1
  2c:	8c8400a4 	lw	a0,164(a0)
  30:	24030001 	li	v1,1
  34:	8c820028 	lw	v0,40(a0)
  38:	3042ffff 	andi	v0,v0,0xffff
  3c:	10430023 	beq	v0,v1,cc <skb_pad+0xcc>
  40:	24880028 	addiu	t0,a0,40
  44:	8e2200a0 	lw	v0,160(s1)
  48:	8e250054 	lw	a1,84(s1)
  4c:	00441023 	subu	v0,v0,a0
  50:	00451021 	addu	v0,v0,a1
  54:	00523021 	addu	a2,v0,s2
  58:	8d020000 	lw	v0,0(t0)
  5c:	24030001 	li	v1,1
  60:	3042ffff 	andi	v0,v0,0xffff
  64:	14430003 	bne	v0,v1,74 <skb_pad+0x74>
  68:	02202021 	move	a0,s1
  6c:	18c00007 	blez	a2,8c <skb_pad+0x8c>
  70:	02202021 	move	a0,s1
  74:	00002821 	move	a1,zero
  78:	0c000000 	jal	0 <skb_pad>
			78: R_MIPS_26	pskb_expand_head
  7c:	24070020 	li	a3,32
  80:	1440002c 	bnez	v0,134 <skb_pad+0x134>
  84:	00408021 	move	s0,v0
  88:	8e250054 	lw	a1,84(s1)
  8c:	14a00025 	bnez	a1,124 <skb_pad+0x124>
  90:	00000000 	nop
  94:	8e220050 	lw	v0,80(s1)
  98:	8e2400ac 	lw	a0,172(s1)
  9c:	02403021 	move	a2,s2
  a0:	00002821 	move	a1,zero
  a4:	0c000000 	jal	0 <skb_pad>
			a4: R_MIPS_26	memset
  a8:	00822021 	addu	a0,a0,v0
  ac:	00008021 	move	s0,zero
  b0:	8fbf001c 	lw	ra,28(sp)
  b4:	02001021 	move	v0,s0
  b8:	8fb20018 	lw	s2,24(sp)
  bc:	8fb10014 	lw	s1,20(sp)
  c0:	8fb00010 	lw	s0,16(sp)
  c4:	03e00008 	jr	ra
  c8:	27bd0020 	addiu	sp,sp,32
  cc:	8e250054 	lw	a1,84(s1)
  d0:	10a0000c 	beqz	a1,104 <skb_pad+0x104>
  d4:	00001821 	move	v1,zero
  d8:	0072102a 	slt	v0,v1,s2
  dc:	1040ffed 	beqz	v0,94 <skb_pad+0x94>
  e0:	00000000 	nop
  e4:	8e2300a4 	lw	v1,164(s1)
  e8:	8e2200a0 	lw	v0,160(s1)
  ec:	00431023 	subu	v0,v0,v1
  f0:	00451021 	addu	v0,v0,a1
  f4:	10e0ffdd 	beqz	a3,6c <skb_pad+0x6c>
  f8:	00523021 	addu	a2,v0,s2
  fc:	08000016 	j	58 <skb_pad+0x58>
			fc: R_MIPS_26	.text.skb_pad
 100:	24680028 	addiu	t0,v1,40
 104:	8e2200a0 	lw	v0,160(s1)
 108:	8e2300a4 	lw	v1,164(s1)
 10c:	00621823 	subu	v1,v1,v0
 110:	0072102a 	slt	v0,v1,s2
 114:	1440fff3 	bnez	v0,e4 <skb_pad+0xe4>
 118:	00000000 	nop
 11c:	08000026 	j	98 <skb_pad+0x98>
			11c: R_MIPS_26	.text.skb_pad
 120:	8e220050 	lw	v0,80(s1)
 124:	0c000000 	jal	0 <skb_pad>
			124: R_MIPS_26	__pskb_pull_tail
 128:	02202021 	move	a0,s1
 12c:	1440ffd9 	bnez	v0,94 <skb_pad+0x94>
 130:	2410fff4 	li	s0,-12
 134:	0c000000 	jal	0 <skb_pad>
			134: R_MIPS_26	kfree_skb
 138:	02202021 	move	a0,s1
 13c:	0800002d 	j	b4 <skb_pad+0xb4>
			13c: R_MIPS_26	.text.skb_pad
 140:	8fbf001c 	lw	ra,28(sp)

Disassembly of section .text.___pskb_trim:

00000000 <___pskb_trim>:
   0:	27bdffc8 	addiu	sp,sp,-56
   4:	afb7002c 	sw	s7,44(sp)
   8:	afb40020 	sw	s4,32(sp)
   c:	afbf0034 	sw	ra,52(sp)
  10:	afbe0030 	sw	s8,48(sp)
  14:	afb60028 	sw	s6,40(sp)
  18:	afb50024 	sw	s5,36(sp)
  1c:	afb3001c 	sw	s3,28(sp)
  20:	afb20018 	sw	s2,24(sp)
  24:	afb10014 	sw	s1,20(sp)
  28:	afb00010 	sw	s0,16(sp)
  2c:	8c820064 	lw	v0,100(a0)
  30:	8c8700a4 	lw	a3,164(a0)
  34:	0080a021 	move	s4,a0
  38:	7c420780 	ext	v0,v0,0x1e,0x1
  3c:	00a0b821 	move	s7,a1
  40:	8c920050 	lw	s2,80(a0)
  44:	8c900054 	lw	s0,84(a0)
  48:	1040000c 	beqz	v0,7c <___pskb_trim+0x7c>
  4c:	94f10000 	lhu	s1,0(a3)
  50:	8ce20028 	lw	v0,40(a3)
  54:	24030001 	li	v1,1
  58:	3042ffff 	andi	v0,v0,0xffff
  5c:	10430007 	beq	v0,v1,7c <___pskb_trim+0x7c>
  60:	00002821 	move	a1,zero
  64:	00003021 	move	a2,zero
  68:	0c000000 	jal	0 <___pskb_trim>
			68: R_MIPS_26	pskb_expand_head
  6c:	24070020 	li	a3,32
  70:	1440002b 	bnez	v0,120 <___pskb_trim+0x120>
  74:	8fbf0034 	lw	ra,52(sp)
  78:	8e8700a4 	lw	a3,164(s4)
  7c:	02501823 	subu	v1,s2,s0
  80:	0077102b 	sltu	v0,v1,s7
  84:	14400031 	bnez	v0,14c <___pskb_trim+0x14c>
  88:	00008021 	move	s0,zero
  8c:	00002821 	move	a1,zero
  90:	0211102a 	slt	v0,s0,s1
  94:	1040000c 	beqz	v0,c8 <___pskb_trim+0xc8>
  98:	a4e50000 	sh	a1,0(a3)
  9c:	8e8300a4 	lw	v1,164(s4)
  a0:	00102080 	sll	a0,s0,0x2
  a4:	00101100 	sll	v0,s0,0x4
  a8:	00441023 	subu	v0,v0,a0
  ac:	00621821 	addu	v1,v1,v0
  b0:	8c640030 	lw	a0,48(v1)
  b4:	0c000000 	jal	0 <___pskb_trim>
			b4: R_MIPS_26	put_page
  b8:	26100001 	addiu	s0,s0,1
  bc:	0211102a 	slt	v0,s0,s1
  c0:	1440fff6 	bnez	v0,9c <___pskb_trim+0x9c>
  c4:	00000000 	nop
  c8:	8e8200a4 	lw	v0,164(s4)
  cc:	8c440010 	lw	a0,16(v0)
  d0:	10800006 	beqz	a0,ec <___pskb_trim+0xec>
  d4:	00000000 	nop
  d8:	ac400010 	sw	zero,16(v0)
  dc:	0c000000 	jal	0 <___pskb_trim>
			dc: R_MIPS_26	kfree_skb
  e0:	8c900000 	lw	s0,0(a0)
  e4:	1600fffd 	bnez	s0,dc <___pskb_trim+0xdc>
  e8:	02002021 	move	a0,s0
  ec:	8e840050 	lw	a0,80(s4)
  f0:	8e830054 	lw	v1,84(s4)
  f4:	00831023 	subu	v0,a0,v1
  f8:	0057102b 	sltu	v0,v0,s7
  fc:	14400056 	bnez	v0,258 <___pskb_trim+0x258>
 100:	00641023 	subu	v0,v1,a0
 104:	8e8200ac 	lw	v0,172(s4)
 108:	ae970050 	sw	s7,80(s4)
 10c:	ae800054 	sw	zero,84(s4)
 110:	00571021 	addu	v0,v0,s7
 114:	ae8200a0 	sw	v0,160(s4)
 118:	00001021 	move	v0,zero
 11c:	8fbf0034 	lw	ra,52(sp)
 120:	8fbe0030 	lw	s8,48(sp)
 124:	8fb7002c 	lw	s7,44(sp)
 128:	8fb60028 	lw	s6,40(sp)
 12c:	8fb50024 	lw	s5,36(sp)
 130:	8fb40020 	lw	s4,32(sp)
 134:	8fb3001c 	lw	s3,28(sp)
 138:	8fb20018 	lw	s2,24(sp)
 13c:	8fb10014 	lw	s1,20(sp)
 140:	8fb00010 	lw	s0,16(sp)
 144:	03e00008 	jr	ra
 148:	27bd0038 	addiu	sp,sp,56
 14c:	12200013 	beqz	s1,19c <___pskb_trim+0x19c>
 150:	00609821 	move	s3,v1
 154:	8ce20038 	lw	v0,56(a3)
 158:	00621021 	addu	v0,v1,v0
 15c:	0057182b 	sltu	v1,v0,s7
 160:	10600064 	beqz	v1,2f4 <___pskb_trim+0x2f4>
 164:	00403021 	move	a2,v0
 168:	00e02821 	move	a1,a3
 16c:	08000063 	j	18c <___pskb_trim+0x18c>
			16c: R_MIPS_26	.text.___pskb_trim
 170:	00002021 	move	a0,zero
 174:	8ca30044 	lw	v1,68(a1)
 178:	00c31821 	addu	v1,a2,v1
 17c:	0077102b 	sltu	v0,v1,s7
 180:	10400045 	beqz	v0,298 <___pskb_trim+0x298>
 184:	24a5000c 	addiu	a1,a1,12
 188:	00603021 	move	a2,v1
 18c:	24840001 	addiu	a0,a0,1
 190:	0091102a 	slt	v0,a0,s1
 194:	1440fff7 	bnez	v0,174 <___pskb_trim+0x174>
 198:	00c09821 	move	s3,a2
 19c:	8cf00010 	lw	s0,16(a3)
 1a0:	1200ffd2 	beqz	s0,ec <___pskb_trim+0xec>
 1a4:	24f60010 	addiu	s6,a3,16
 1a8:	08000072 	j	1c8 <___pskb_trim+0x1c8>
			1a8: R_MIPS_26	.text.___pskb_trim
 1ac:	241e0001 	li	s8,1
 1b0:	0237102b 	sltu	v0,s1,s7
 1b4:	10400017 	beqz	v0,214 <___pskb_trim+0x214>
 1b8:	0240b021 	move	s6,s2
 1bc:	8e500000 	lw	s0,0(s2)
 1c0:	1200ffca 	beqz	s0,ec <___pskb_trim+0xec>
 1c4:	02209821 	move	s3,s1
 1c8:	8e020050 	lw	v0,80(s0)
 1cc:	8e0300b4 	lw	v1,180(s0)
 1d0:	02009021 	move	s2,s0
 1d4:	107efff6 	beq	v1,s8,1b0 <___pskb_trim+0x1b0>
 1d8:	02628821 	addu	s1,s3,v0
 1dc:	02002021 	move	a0,s0
 1e0:	0c000000 	jal	0 <___pskb_trim>
			1e0: R_MIPS_26	skb_clone
 1e4:	24050020 	li	a1,32
 1e8:	0040a821 	move	s5,v0
 1ec:	1040004b 	beqz	v0,31c <___pskb_trim+0x31c>
 1f0:	02002021 	move	a0,s0
 1f4:	8e020000 	lw	v0,0(s0)
 1f8:	02a09021 	move	s2,s5
 1fc:	0c000000 	jal	0 <___pskb_trim>
			1fc: R_MIPS_26	kfree_skb
 200:	aea20000 	sw	v0,0(s5)
 204:	0237102b 	sltu	v0,s1,s7
 208:	aed50000 	sw	s5,0(s6)
 20c:	1440ffeb 	bnez	v0,1bc <___pskb_trim+0x1bc>
 210:	0240b021 	move	s6,s2
 214:	02f1102b 	sltu	v0,s7,s1
 218:	1440002a 	bnez	v0,2c4 <___pskb_trim+0x2c4>
 21c:	02f32823 	subu	a1,s7,s3
 220:	8e440000 	lw	a0,0(s2)
 224:	1080ffb1 	beqz	a0,ec <___pskb_trim+0xec>
 228:	00000000 	nop
 22c:	ae400000 	sw	zero,0(s2)
 230:	0c000000 	jal	0 <___pskb_trim>
			230: R_MIPS_26	kfree_skb
 234:	8c900000 	lw	s0,0(a0)
 238:	1600fffd 	bnez	s0,230 <___pskb_trim+0x230>
 23c:	02002021 	move	a0,s0
 240:	8e840050 	lw	a0,80(s4)
 244:	8e830054 	lw	v1,84(s4)
 248:	00831023 	subu	v0,a0,v1
 24c:	0057102b 	sltu	v0,v0,s7
 250:	1040ffac 	beqz	v0,104 <___pskb_trim+0x104>
 254:	00641023 	subu	v0,v1,a0
 258:	00571021 	addu	v0,v0,s7
 25c:	ae820054 	sw	v0,84(s4)
 260:	ae970050 	sw	s7,80(s4)
 264:	8fbf0034 	lw	ra,52(sp)
 268:	00001021 	move	v0,zero
 26c:	8fbe0030 	lw	s8,48(sp)
 270:	8fb7002c 	lw	s7,44(sp)
 274:	8fb60028 	lw	s6,40(sp)
 278:	8fb50024 	lw	s5,36(sp)
 27c:	8fb40020 	lw	s4,32(sp)
 280:	8fb3001c 	lw	s3,28(sp)
 284:	8fb20018 	lw	s2,24(sp)
 288:	8fb10014 	lw	s1,20(sp)
 28c:	8fb00010 	lw	s0,16(sp)
 290:	03e00008 	jr	ra
 294:	27bd0038 	addiu	sp,sp,56
 298:	24900001 	addiu	s0,a0,1
 29c:	00c09821 	move	s3,a2
 2a0:	3205ffff 	andi	a1,s0,0xffff
 2a4:	00041880 	sll	v1,a0,0x2
 2a8:	00041100 	sll	v0,a0,0x4
 2ac:	00431023 	subu	v0,v0,v1
 2b0:	00e21021 	addu	v0,a3,v0
 2b4:	02f31823 	subu	v1,s7,s3
 2b8:	ac430038 	sw	v1,56(v0)
 2bc:	08000024 	j	90 <___pskb_trim+0x90>
			2bc: R_MIPS_26	.text.___pskb_trim
 2c0:	8e8700a4 	lw	a3,164(s4)
 2c4:	8e420050 	lw	v0,80(s2)
 2c8:	00a2102b 	sltu	v0,a1,v0
 2cc:	1040ffd4 	beqz	v0,220 <___pskb_trim+0x220>
 2d0:	00000000 	nop
 2d4:	8e420054 	lw	v0,84(s2)
 2d8:	1440000a 	bnez	v0,304 <___pskb_trim+0x304>
 2dc:	00000000 	nop
 2e0:	8e4200ac 	lw	v0,172(s2)
 2e4:	ae450050 	sw	a1,80(s2)
 2e8:	00451021 	addu	v0,v0,a1
 2ec:	08000088 	j	220 <___pskb_trim+0x220>
			2ec: R_MIPS_26	.text.___pskb_trim
 2f0:	ae4200a0 	sw	v0,160(s2)
 2f4:	00002021 	move	a0,zero
 2f8:	24100001 	li	s0,1
 2fc:	080000a9 	j	2a4 <___pskb_trim+0x2a4>
			2fc: R_MIPS_26	.text.___pskb_trim
 300:	24050001 	li	a1,1
 304:	0c000000 	jal	0 <___pskb_trim>
			304: R_MIPS_26	___pskb_trim
 308:	02402021 	move	a0,s2
 30c:	1040ffc4 	beqz	v0,220 <___pskb_trim+0x220>
 310:	8fbf0034 	lw	ra,52(sp)
 314:	08000049 	j	124 <___pskb_trim+0x124>
			314: R_MIPS_26	.text.___pskb_trim
 318:	8fbe0030 	lw	s8,48(sp)
 31c:	08000047 	j	11c <___pskb_trim+0x11c>
			31c: R_MIPS_26	.text.___pskb_trim
 320:	2402fff4 	li	v0,-12

Disassembly of section .text.skbmgr_alloc_skb4k:

00000000 <skbmgr_alloc_skb4k>:
   0:	27bdffd8 	addiu	sp,sp,-40
   4:	afb10014 	sw	s1,20(sp)
   8:	3c110000 	lui	s1,0x0
			8: R_MIPS_HI16	skbmgr_4k_pool
   c:	afb00010 	sw	s0,16(sp)
  10:	afbf0024 	sw	ra,36(sp)
  14:	afb40020 	sw	s4,32(sp)
  18:	afb3001c 	sw	s3,28(sp)
  1c:	afb20018 	sw	s2,24(sp)
  20:	26300000 	addiu	s0,s1,0
			20: R_MIPS_LO16	skbmgr_4k_pool
  24:	8e020008 	lw	v0,8(s0)
  28:	14400034 	bnez	v0,fc <skbmgr_alloc_skb4k+0xfc>
  2c:	3c120000 	lui	s2,0x0
			2c: R_MIPS_HI16	.bss
  30:	3c100000 	lui	s0,0x0
			30: R_MIPS_HI16	skbmgr_4k_alloc_no
  34:	8e020000 	lw	v0,0(s0)
			34: R_MIPS_LO16	skbmgr_4k_alloc_no
  38:	28420200 	slti	v0,v0,512
  3c:	1440000e 	bnez	v0,78 <skbmgr_alloc_skb4k+0x78>
  40:	3c030000 	lui	v1,0x0
			40: R_MIPS_HI16	skbmgr_4k_alloc_fail
  44:	8c620000 	lw	v0,0(v1)
			44: R_MIPS_LO16	skbmgr_4k_alloc_fail
  48:	0000a021 	move	s4,zero
  4c:	24420001 	addiu	v0,v0,1
  50:	ac620000 	sw	v0,0(v1)
			50: R_MIPS_LO16	skbmgr_4k_alloc_fail
  54:	8fbf0024 	lw	ra,36(sp)
  58:	02801021 	move	v0,s4
  5c:	8fb40020 	lw	s4,32(sp)
  60:	8fb3001c 	lw	s3,28(sp)
  64:	8fb20018 	lw	s2,24(sp)
  68:	8fb10014 	lw	s1,20(sp)
  6c:	8fb00010 	lw	s0,16(sp)
  70:	03e00008 	jr	ra
  74:	27bd0028 	addiu	sp,sp,40
  78:	24040ee0 	li	a0,3808
  7c:	24050220 	li	a1,544
  80:	00003021 	move	a2,zero
  84:	0c000000 	jal	0 <skbmgr_alloc_skb4k>
			84: R_MIPS_26	__alloc_skb
  88:	2407ffff 	li	a3,-1
  8c:	10400053 	beqz	v0,1dc <skbmgr_alloc_skb4k+0x1dc>
  90:	0040a021 	move	s4,v0
  94:	3c020000 	lui	v0,0x0
			94: R_MIPS_HI16	skbmgr_4k_recycling_callback
  98:	24420000 	addiu	v0,v0,0
			98: R_MIPS_LO16	skbmgr_4k_recycling_callback
  9c:	24030002 	li	v1,2
  a0:	ae82006c 	sw	v0,108(s4)
  a4:	ae830070 	sw	v1,112(s4)
  a8:	c2020000 	ll	v0,0(s0)
			a8: R_MIPS_LO16	skbmgr_4k_alloc_no
  ac:	24420001 	addiu	v0,v0,1
  b0:	e2020000 	sc	v0,0(s0)
			b0: R_MIPS_LO16	skbmgr_4k_alloc_no
  b4:	10400052 	beqz	v0,200 <skbmgr_alloc_skb4k+0x200>
  b8:	00000000 	nop
  bc:	3c040000 	lui	a0,0x0
			bc: R_MIPS_HI16	skbmgr_4k_max_alloc_no
  c0:	8e030000 	lw	v1,0(s0)
			c0: R_MIPS_LO16	skbmgr_4k_alloc_no
  c4:	8c820000 	lw	v0,0(a0)
			c4: R_MIPS_LO16	skbmgr_4k_max_alloc_no
  c8:	0043102a 	slt	v0,v0,v1
  cc:	1040ffe2 	beqz	v0,58 <skbmgr_alloc_skb4k+0x58>
  d0:	8fbf0024 	lw	ra,36(sp)
  d4:	ac830000 	sw	v1,0(a0)
			d4: R_MIPS_LO16	skbmgr_4k_max_alloc_no
  d8:	8fbf0024 	lw	ra,36(sp)
  dc:	02801021 	move	v0,s4
  e0:	8fb40020 	lw	s4,32(sp)
  e4:	8fb3001c 	lw	s3,28(sp)
  e8:	8fb20018 	lw	s2,24(sp)
  ec:	8fb10014 	lw	s1,20(sp)
  f0:	8fb00010 	lw	s0,16(sp)
  f4:	03e00008 	jr	ra
  f8:	27bd0028 	addiu	sp,sp,40
  fc:	0c000000 	jal	0 <skbmgr_alloc_skb4k>
			fc: R_MIPS_26	_raw_spin_lock_irqsave
 100:	26440068 	addiu	a0,s2,104
			100: R_MIPS_LO16	.bss
 104:	8e340000 	lw	s4,0(s1)
			104: R_MIPS_LO16	skbmgr_4k_pool
 108:	12140039 	beq	s0,s4,1f0 <skbmgr_alloc_skb4k+0x1f0>
 10c:	00402821 	move	a1,v0
 110:	12800037 	beqz	s4,1f0 <skbmgr_alloc_skb4k+0x1f0>
 114:	26440068 	addiu	a0,s2,104
			114: R_MIPS_LO16	.bss
 118:	8e020008 	lw	v0,8(s0)
 11c:	24130001 	li	s3,1
 120:	2442ffff 	addiu	v0,v0,-1
 124:	ae020008 	sw	v0,8(s0)
 128:	8e830000 	lw	v1,0(s4)
 12c:	8e820004 	lw	v0,4(s4)
 130:	ae800000 	sw	zero,0(s4)
 134:	ae800004 	sw	zero,4(s4)
 138:	ac430000 	sw	v1,0(v0)
 13c:	0c000000 	jal	0 <skbmgr_alloc_skb4k>
			13c: R_MIPS_26	_raw_spin_unlock_irqrestore
 140:	ac620004 	sw	v0,4(v1)
 144:	8e9200b0 	lw	s2,176(s4)
 148:	8e9100a8 	lw	s1,168(s4)
 14c:	02802021 	move	a0,s4
 150:	2650ff48 	addiu	s0,s2,-184
 154:	02308021 	addu	s0,s1,s0
 158:	00002821 	move	a1,zero
 15c:	0c000000 	jal	0 <skbmgr_alloc_skb4k>
			15c: R_MIPS_26	memset
 160:	240600a0 	li	a2,160
 164:	02002021 	move	a0,s0
 168:	ae9200b0 	sw	s2,176(s4)
 16c:	ae9300b4 	sw	s3,180(s4)
 170:	ae9100a8 	sw	s1,168(s4)
 174:	ae9100ac 	sw	s1,172(s4)
 178:	ae9100a0 	sw	s1,160(s4)
 17c:	ae9000a4 	sw	s0,164(s4)
 180:	00002821 	move	a1,zero
 184:	0c000000 	jal	0 <skbmgr_alloc_skb4k>
			184: R_MIPS_26	memset
 188:	24060028 	li	a2,40
 18c:	3c020000 	lui	v0,0x0
			18c: R_MIPS_HI16	skbmgr_4k_recycling_callback
 190:	24420000 	addiu	v0,v0,0
			190: R_MIPS_LO16	skbmgr_4k_recycling_callback
 194:	24040002 	li	a0,2
 198:	ae130028 	sw	s3,40(s0)
 19c:	3c030000 	lui	v1,0x0
			19c: R_MIPS_HI16	skbmgr_4k_alloc_no
 1a0:	ae82006c 	sw	v0,108(s4)
 1a4:	ae840070 	sw	a0,112(s4)
 1a8:	c0620000 	ll	v0,0(v1)
			1a8: R_MIPS_LO16	skbmgr_4k_alloc_no
 1ac:	24420001 	addiu	v0,v0,1
 1b0:	e0620000 	sc	v0,0(v1)
			1b0: R_MIPS_LO16	skbmgr_4k_alloc_no
 1b4:	10400014 	beqz	v0,208 <skbmgr_alloc_skb4k+0x208>
 1b8:	00000000 	nop
 1bc:	3c040000 	lui	a0,0x0
			1bc: R_MIPS_HI16	skbmgr_4k_max_alloc_no
 1c0:	8c630000 	lw	v1,0(v1)
			1c0: R_MIPS_LO16	skbmgr_4k_alloc_no
 1c4:	8c820000 	lw	v0,0(a0)
			1c4: R_MIPS_LO16	skbmgr_4k_max_alloc_no
 1c8:	0043102a 	slt	v0,v0,v1
 1cc:	1040ffa2 	beqz	v0,58 <skbmgr_alloc_skb4k+0x58>
 1d0:	8fbf0024 	lw	ra,36(sp)
 1d4:	08000036 	j	d8 <skbmgr_alloc_skb4k+0xd8>
			1d4: R_MIPS_26	.text.skbmgr_alloc_skb4k
 1d8:	ac830000 	sw	v1,0(a0)
			1d8: R_MIPS_LO16	skbmgr_4k_max_alloc_no
 1dc:	3c030000 	lui	v1,0x0
			1dc: R_MIPS_HI16	skbmgr_4k_alloc_fail
 1e0:	8c620000 	lw	v0,0(v1)
			1e0: R_MIPS_LO16	skbmgr_4k_alloc_fail
 1e4:	24420001 	addiu	v0,v0,1
 1e8:	08000015 	j	54 <skbmgr_alloc_skb4k+0x54>
			1e8: R_MIPS_26	.text.skbmgr_alloc_skb4k
 1ec:	ac620000 	sw	v0,0(v1)
			1ec: R_MIPS_LO16	skbmgr_4k_alloc_fail
 1f0:	0c000000 	jal	0 <skbmgr_alloc_skb4k>
			1f0: R_MIPS_26	_raw_spin_unlock_irqrestore
 1f4:	26440068 	addiu	a0,s2,104
			1f4: R_MIPS_LO16	.bss
 1f8:	0800000d 	j	34 <skbmgr_alloc_skb4k+0x34>
			1f8: R_MIPS_26	.text.skbmgr_alloc_skb4k
 1fc:	3c100000 	lui	s0,0x0
			1fc: R_MIPS_HI16	skbmgr_4k_alloc_no
 200:	1000ffa9 	b	a8 <skbmgr_alloc_skb4k+0xa8>
 204:	00000000 	nop
 208:	1000ffe7 	b	1a8 <skbmgr_alloc_skb4k+0x1a8>
 20c:	00000000 	nop

Disassembly of section .text.skb_gro_receive:

00000000 <skb_gro_receive>:
   0:	27bdffc0 	addiu	sp,sp,-64
   4:	afb5002c 	sw	s5,44(sp)
   8:	afbf003c 	sw	ra,60(sp)
   c:	afbe0038 	sw	s8,56(sp)
  10:	afb70034 	sw	s7,52(sp)
  14:	afb60030 	sw	s6,48(sp)
  18:	afb40028 	sw	s4,40(sp)
  1c:	afb30024 	sw	s3,36(sp)
  20:	afb20020 	sw	s2,32(sp)
  24:	afb1001c 	sw	s1,28(sp)
  28:	afb00018 	sw	s0,24(sp)
  2c:	afa40040 	sw	a0,64(sp)
  30:	8c910000 	lw	s1,0(a0)
  34:	24a20018 	addiu	v0,a1,24
  38:	afa20014 	sw	v0,20(sp)
  3c:	00a0a821 	move	s5,a1
  40:	8c570008 	lw	s7,8(v0)
  44:	8ca50050 	lw	a1,80(a1)
  48:	8e260050 	lw	a2,80(s1)
  4c:	3c020001 	lui	v0,0x1
  50:	00b71823 	subu	v1,a1,s7
  54:	afa30010 	sw	v1,16(sp)
  58:	00661821 	addu	v1,v1,a2
  5c:	0062182b 	sltu	v1,v1,v0
  60:	8eb600a4 	lw	s6,164(s5)
  64:	8e3400a4 	lw	s4,164(s1)
  68:	10600045 	beqz	v1,180 <skb_gro_receive+0x180>
  6c:	8ea40054 	lw	a0,84(s5)
  70:	8e820010 	lw	v0,16(s4)
  74:	1040004e 	beqz	v0,1b0 <skb_gro_receive+0x1b0>
  78:	00a4f023 	subu	s8,a1,a0
  7c:	03d7102b 	sltu	v0,s8,s7
  80:	14400041 	bnez	v0,188 <skb_gro_receive+0x188>
  84:	00000000 	nop
  88:	8ea20050 	lw	v0,80(s5)
  8c:	8ea30054 	lw	v1,84(s5)
  90:	00571023 	subu	v0,v0,s7
  94:	0043182b 	sltu	v1,v0,v1
  98:	aea20050 	sw	v0,80(s5)
  9c:	00038036 	tne	zero,v1,0x200
  a0:	8e240004 	lw	a0,4(s1)
  a4:	8ea200ac 	lw	v0,172(s5)
  a8:	ae350004 	sw	s5,4(s1)
  ac:	ac950000 	sw	s5,0(a0)
  b0:	8ea30064 	lw	v1,100(s5)
  b4:	00571021 	addu	v0,v0,s7
  b8:	aea200ac 	sw	v0,172(s5)
  bc:	7c6306c0 	ext	v1,v1,0x1b,0x1
  c0:	00038036 	tne	zero,v1,0x200
  c4:	8ea20064 	lw	v0,100(s5)
  c8:	24030001 	li	v1,1
  cc:	8ea400a4 	lw	a0,164(s5)
  d0:	7c62dec4 	ins	v0,v1,0x1b,0x1
  d4:	aea20064 	sw	v0,100(s5)
  d8:	3c030001 	lui	v1,0x1
  dc:	c0820028 	ll	v0,40(a0)
  e0:	00431021 	addu	v0,v0,v1
  e4:	e0820028 	sc	v0,40(a0)
  e8:	104000d7 	beqz	v0,448 <skb_gro_receive+0x448>
  ec:	00000000 	nop
  f0:	26240018 	addiu	a0,s1,24
  f4:	8c820014 	lw	v0,20(a0)
  f8:	00002821 	move	a1,zero
  fc:	24420001 	addiu	v0,v0,1
 100:	ac820014 	sw	v0,20(a0)
 104:	8fa60010 	lw	a2,16(sp)
 108:	8e230054 	lw	v1,84(s1)
 10c:	8e2400b0 	lw	a0,176(s1)
 110:	8e220050 	lw	v0,80(s1)
 114:	00661821 	addu	v1,v1,a2
 118:	00862021 	addu	a0,a0,a2
 11c:	00461021 	addu	v0,v0,a2
 120:	ae220050 	sw	v0,80(s1)
 124:	ae230054 	sw	v1,84(s1)
 128:	ae2400b0 	sw	a0,176(s1)
 12c:	8fa30014 	lw	v1,20(sp)
 130:	24020001 	li	v0,1
 134:	ac62000c 	sw	v0,12(v1)
 138:	8fbf003c 	lw	ra,60(sp)
 13c:	00a01021 	move	v0,a1
 140:	8fbe0038 	lw	s8,56(sp)
 144:	8fb70034 	lw	s7,52(sp)
 148:	8fb60030 	lw	s6,48(sp)
 14c:	8fb5002c 	lw	s5,44(sp)
 150:	8fb40028 	lw	s4,40(sp)
 154:	8fb30024 	lw	s3,36(sp)
 158:	8fb20020 	lw	s2,32(sp)
 15c:	8fb1001c 	lw	s1,28(sp)
 160:	8fb00018 	lw	s0,24(sp)
 164:	03e00008 	jr	ra
 168:	27bd0040 	addiu	sp,sp,64
 16c:	8e670008 	lw	a3,8(s3)
 170:	96830002 	lhu	v1,2(s4)
 174:	00c71023 	subu	v0,a2,a3
 178:	10620046 	beq	v1,v0,294 <skb_gro_receive+0x294>
 17c:	00003021 	move	a2,zero
 180:	0800004e 	j	138 <skb_gro_receive+0x138>
			180: R_MIPS_26	.text.skb_gro_receive
 184:	2405fff9 	li	a1,-7
 188:	8ec30034 	lw	v1,52(s6)
 18c:	8ec20038 	lw	v0,56(s6)
 190:	02e31821 	addu	v1,s7,v1
 194:	03c21021 	addu	v0,s8,v0
 198:	00571023 	subu	v0,v0,s7
 19c:	007e1823 	subu	v1,v1,s8
 1a0:	aec20038 	sw	v0,56(s6)
 1a4:	aec30034 	sw	v1,52(s6)
 1a8:	08000022 	j	88 <skb_gro_receive+0x88>
			1a8: R_MIPS_26	.text.skb_gro_receive
 1ac:	03c0b821 	move	s7,s8
 1b0:	02fe102b 	sltu	v0,s7,s8
 1b4:	1440ffed 	bnez	v0,16c <skb_gro_receive+0x16c>
 1b8:	26330018 	addiu	s3,s1,24
 1bc:	96c80000 	lhu	t0,0(s6)
 1c0:	96820000 	lhu	v0,0(s4)
 1c4:	00482821 	addu	a1,v0,t0
 1c8:	2ca30013 	sltiu	v1,a1,19
 1cc:	1060ffec 	beqz	v1,180 <skb_gro_receive+0x180>
 1d0:	00051080 	sll	v0,a1,0x2
 1d4:	00051900 	sll	v1,a1,0x4
 1d8:	00621823 	subu	v1,v1,v0
 1dc:	00082080 	sll	a0,t0,0x2
 1e0:	00081100 	sll	v0,t0,0x4
 1e4:	00441023 	subu	v0,v0,a0
 1e8:	24630030 	addiu	v1,v1,48
 1ec:	02834821 	addu	t1,s4,v1
 1f0:	24420030 	addiu	v0,v0,48
 1f4:	a6850000 	sh	a1,0(s4)
 1f8:	02c23021 	addu	a2,s6,v0
 1fc:	a6c00000 	sh	zero,0(s6)
 200:	01202821 	move	a1,t1
 204:	00003821 	move	a3,zero
 208:	24c6fff4 	addiu	a2,a2,-12
 20c:	8cc20000 	lw	v0,0(a2)
 210:	8cc30004 	lw	v1,4(a2)
 214:	8cc40008 	lw	a0,8(a2)
 218:	24a5fff4 	addiu	a1,a1,-12
 21c:	24e70001 	addiu	a3,a3,1
 220:	aca20000 	sw	v0,0(a1)
 224:	aca30004 	sw	v1,4(a1)
 228:	1507fff7 	bne	t0,a3,208 <skb_gro_receive+0x208>
 22c:	aca40008 	sw	a0,8(a1)
 230:	2502ffff 	addiu	v0,t0,-1
 234:	00021900 	sll	v1,v0,0x4
 238:	00021080 	sll	v0,v0,0x2
 23c:	00431023 	subu	v0,v0,v1
 240:	2442fff4 	addiu	v0,v0,-12
 244:	01221021 	addu	v0,t1,v0
 248:	8c450004 	lw	a1,4(v0)
 24c:	8c430008 	lw	v1,8(v0)
 250:	02fe2023 	subu	a0,s7,s8
 254:	00a42821 	addu	a1,a1,a0
 258:	00641823 	subu	v1,v1,a0
 25c:	ac430008 	sw	v1,8(v0)
 260:	ac450004 	sw	a1,4(v0)
 264:	8ea40054 	lw	a0,84(s5)
 268:	8ea200b0 	lw	v0,176(s5)
 26c:	8ea30050 	lw	v1,80(s5)
 270:	aea00054 	sw	zero,84(s5)
 274:	00441023 	subu	v0,v0,a0
 278:	00641823 	subu	v1,v1,a0
 27c:	aea200b0 	sw	v0,176(s5)
 280:	aea30050 	sw	v1,80(s5)
 284:	8fa60014 	lw	a2,20(sp)
 288:	24020001 	li	v0,1
 28c:	0800003c 	j	f0 <skb_gro_receive+0xf0>
			28c: R_MIPS_26	.text.skb_gro_receive
 290:	acc20018 	sw	v0,24(a2)
 294:	8e2300ac 	lw	v1,172(s1)
 298:	8e2200a8 	lw	v0,168(s1)
 29c:	24050020 	li	a1,32
 2a0:	00629023 	subu	s2,v1,v0
 2a4:	02472021 	addu	a0,s2,a3
 2a8:	0c000000 	jal	0 <skb_gro_receive>
			2a8: R_MIPS_26	__alloc_skb
 2ac:	2407ffff 	li	a3,-1
 2b0:	00408021 	move	s0,v0
 2b4:	1040ffa0 	beqz	v0,138 <skb_gro_receive+0x138>
 2b8:	2405fff4 	li	a1,-12
 2bc:	00402021 	move	a0,v0
 2c0:	0c000000 	jal	0 <skb_gro_receive>
			2c0: R_MIPS_26	.text.__copy_skb_header
 2c4:	02202821 	move	a1,s1
 2c8:	8e0200ac 	lw	v0,172(s0)
 2cc:	8e0800a0 	lw	t0,160(s0)
 2d0:	96230058 	lhu	v1,88(s1)
 2d4:	00521021 	addu	v0,v0,s2
 2d8:	01124021 	addu	t0,t0,s2
 2dc:	ae0200ac 	sw	v0,172(s0)
 2e0:	a6030058 	sh	v1,88(s0)
 2e4:	ae0800a0 	sw	t0,160(s0)
 2e8:	8e020054 	lw	v0,84(s0)
 2ec:	00028036 	tne	zero,v0,0x200
 2f0:	8e2300ac 	lw	v1,172(s1)
 2f4:	8e25009c 	lw	a1,156(s1)
 2f8:	8e260098 	lw	a2,152(s1)
 2fc:	8e270094 	lw	a3,148(s1)
 300:	8e690008 	lw	t1,8(s3)
 304:	8e040050 	lw	a0,80(s0)
 308:	8e0200ac 	lw	v0,172(s0)
 30c:	00c33023 	subu	a2,a2,v1
 310:	00e33823 	subu	a3,a3,v1
 314:	00a32823 	subu	a1,a1,v1
 318:	00473821 	addu	a3,v0,a3
 31c:	01094021 	addu	t0,t0,t1
 320:	00452821 	addu	a1,v0,a1
 324:	00892021 	addu	a0,a0,t1
 328:	00461021 	addu	v0,v0,a2
 32c:	ae040050 	sw	a0,80(s0)
 330:	ae020098 	sw	v0,152(s0)
 334:	ae0800a0 	sw	t0,160(s0)
 338:	ae05009c 	sw	a1,156(s0)
 33c:	ae070094 	sw	a3,148(s0)
 340:	8e680008 	lw	t0,8(s3)
 344:	8e220050 	lw	v0,80(s1)
 348:	8e230054 	lw	v1,84(s1)
 34c:	00481023 	subu	v0,v0,t0
 350:	0043182b 	sltu	v1,v0,v1
 354:	ae220050 	sw	v0,80(s1)
 358:	00038036 	tne	zero,v1,0x200
 35c:	8e2600ac 	lw	a2,172(s1)
 360:	8e25009c 	lw	a1,156(s1)
 364:	8e04009c 	lw	a0,156(s0)
 368:	00c83021 	addu	a2,a2,t0
 36c:	ae2600ac 	sw	a2,172(s1)
 370:	0c000000 	jal	0 <skb_gro_receive>
			370: R_MIPS_26	memcpy
 374:	00c53023 	subu	a2,a2,a1
 378:	8e620000 	lw	v0,0(s3)
 37c:	8e630004 	lw	v1,4(s3)
 380:	8e690018 	lw	t1,24(s3)
 384:	8e640008 	lw	a0,8(s3)
 388:	8e65000c 	lw	a1,12(s3)
 38c:	8e660010 	lw	a2,16(s3)
 390:	8e670014 	lw	a3,20(s3)
 394:	8e0800a4 	lw	t0,164(s0)
 398:	ae03001c 	sw	v1,28(s0)
 39c:	ae020018 	sw	v0,24(s0)
 3a0:	ae040020 	sw	a0,32(s0)
 3a4:	ae050024 	sw	a1,36(s0)
 3a8:	ae060028 	sw	a2,40(s0)
 3ac:	ae07002c 	sw	a3,44(s0)
 3b0:	ae090030 	sw	t1,48(s0)
 3b4:	ad110010 	sw	s1,16(t0)
 3b8:	96820002 	lhu	v0,2(s4)
 3bc:	8e0300a4 	lw	v1,164(s0)
 3c0:	a4620002 	sh	v0,2(v1)
 3c4:	a6800002 	sh	zero,2(s4)
 3c8:	8e220064 	lw	v0,100(s1)
 3cc:	7c4206c0 	ext	v0,v0,0x1b,0x1
 3d0:	00028036 	tne	zero,v0,0x200
 3d4:	8e230064 	lw	v1,100(s1)
 3d8:	24020001 	li	v0,1
 3dc:	8e2400a4 	lw	a0,164(s1)
 3e0:	7c43dec4 	ins	v1,v0,0x1b,0x1
 3e4:	ae230064 	sw	v1,100(s1)
 3e8:	3c020001 	lui	v0,0x1
 3ec:	c0830028 	ll	v1,40(a0)
 3f0:	00621821 	addu	v1,v1,v0
 3f4:	e0830028 	sc	v1,40(a0)
 3f8:	10600015 	beqz	v1,450 <skb_gro_receive+0x450>
 3fc:	00000000 	nop
 400:	8e230050 	lw	v1,80(s1)
 404:	8e020054 	lw	v0,84(s0)
 408:	8e0400b0 	lw	a0,176(s0)
 40c:	8e050050 	lw	a1,80(s0)
 410:	00431021 	addu	v0,v0,v1
 414:	00832021 	addu	a0,a0,v1
 418:	00a32821 	addu	a1,a1,v1
 41c:	ae110004 	sw	s1,4(s0)
 420:	ae020054 	sw	v0,84(s0)
 424:	ae0400b0 	sw	a0,176(s0)
 428:	ae050050 	sw	a1,80(s0)
 42c:	8fa20040 	lw	v0,64(sp)
 430:	ac500000 	sw	s0,0(v0)
 434:	8e220000 	lw	v0,0(s1)
 438:	ae020000 	sw	v0,0(s0)
 43c:	ae200000 	sw	zero,0(s1)
 440:	0800001f 	j	7c <skb_gro_receive+0x7c>
			440: R_MIPS_26	.text.skb_gro_receive
 444:	02008821 	move	s1,s0
 448:	1000ff24 	b	dc <skb_gro_receive+0xdc>
 44c:	00000000 	nop
 450:	1000ffe6 	b	3ec <skb_gro_receive+0x3ec>
 454:	00000000 	nop

Disassembly of section .text.skb_segment:

00000000 <skb_segment>:
   0:	27bdff90 	addiu	sp,sp,-112
   4:	afbe0068 	sw	s8,104(sp)
   8:	afb70064 	sw	s7,100(sp)
   c:	afb5005c 	sw	s5,92(sp)
  10:	afb40058 	sw	s4,88(sp)
  14:	afb30054 	sw	s3,84(sp)
  18:	afbf006c 	sw	ra,108(sp)
  1c:	afb60060 	sw	s6,96(sp)
  20:	afb20050 	sw	s2,80(sp)
  24:	afb1004c 	sw	s1,76(sp)
  28:	afb00048 	sw	s0,72(sp)
  2c:	0080a821 	move	s5,a0
  30:	8ea2009c 	lw	v0,156(s5)
  34:	8c8400ac 	lw	a0,172(a0)
  38:	8ea600a8 	lw	a2,168(s5)
  3c:	8ea70050 	lw	a3,80(s5)
  40:	00821023 	subu	v0,a0,v0
  44:	afa20030 	sw	v0,48(sp)
  48:	00021023 	negu	v0,v0
  4c:	00822021 	addu	a0,a0,v0
  50:	afa2001c 	sw	v0,28(sp)
  54:	00863023 	subu	a2,a0,a2
  58:	8ea20054 	lw	v0,84(s5)
  5c:	afa6002c 	sw	a2,44(sp)
  60:	8fa8002c 	lw	t0,44(sp)
  64:	8fa60030 	lw	a2,48(sp)
  68:	8ea300a4 	lw	v1,164(s5)
  6c:	24090020 	li	t1,32
  70:	01064021 	addu	t0,t0,a2
  74:	00c73821 	addu	a3,a2,a3
  78:	00e23023 	subu	a2,a3,v0
  7c:	2d020020 	sltiu	v0,t0,32
  80:	0102480a 	movz	t1,t0,v0
  84:	afa80040 	sw	t0,64(sp)
  88:	afa90044 	sw	t1,68(sp)
  8c:	94620000 	lhu	v0,0(v1)
  90:	30a50001 	andi	a1,a1,0x1
  94:	afa50028 	sw	a1,40(sp)
  98:	afa20024 	sw	v0,36(sp)
  9c:	8c760010 	lw	s6,16(v1)
  a0:	94630002 	lhu	v1,2(v1)
  a4:	0000b821 	move	s7,zero
  a8:	afa30034 	sw	v1,52(sp)
  ac:	aea400ac 	sw	a0,172(s5)
  b0:	aea70050 	sw	a3,80(s5)
  b4:	8fb40030 	lw	s4,48(sp)
  b8:	afa60020 	sw	a2,32(sp)
  bc:	afa0003c 	sw	zero,60(sp)
  c0:	8fa40034 	lw	a0,52(sp)
  c4:	00f41823 	subu	v1,a3,s4
  c8:	00d49823 	subu	s3,a2,s4
  cc:	0083102b 	sltu	v0,a0,v1
  d0:	0080f021 	move	s8,a0
  d4:	afa00038 	sw	zero,56(sp)
  d8:	06600050 	bltz	s3,21c <skb_segment+0x21c>
  dc:	0062f00a 	movz	s8,v1,v0
  e0:	03d3102b 	sltu	v0,s8,s3
  e4:	1040004f 	beqz	v0,224 <skb_segment+0x224>
  e8:	8fa50028 	lw	a1,40(sp)
  ec:	03c09821 	move	s3,s8
  f0:	16600004 	bnez	s3,104 <skb_segment+0x104>
  f4:	8fa60024 	lw	a2,36(sp)
  f8:	02e6102a 	slt	v0,s7,a2
  fc:	10400066 	beqz	v0,298 <skb_segment+0x298>
 100:	00000000 	nop
 104:	8fa90040 	lw	t1,64(sp)
 108:	24050020 	li	a1,32
 10c:	00003021 	move	a2,zero
 110:	01332021 	addu	a0,t1,s3
 114:	0c000000 	jal	0 <skb_segment>
			114: R_MIPS_26	__alloc_skb
 118:	2407ffff 	li	a3,-1
 11c:	10400097 	beqz	v0,37c <skb_segment+0x37c>
 120:	00408021 	move	s0,v0
 124:	8fa5002c 	lw	a1,44(sp)
 128:	8c4200ac 	lw	v0,172(v0)
 12c:	8e0300a0 	lw	v1,160(s0)
 130:	8e040054 	lw	a0,84(s0)
 134:	00451021 	addu	v0,v0,a1
 138:	00651821 	addu	v1,v1,a1
 13c:	ae0200ac 	sw	v0,172(s0)
 140:	ae0300a0 	sw	v1,160(s0)
 144:	00048036 	tne	zero,a0,0x200
 148:	8fa60030 	lw	a2,48(sp)
 14c:	8e020050 	lw	v0,80(s0)
 150:	00661821 	addu	v1,v1,a2
 154:	00461021 	addu	v0,v0,a2
 158:	ae0300a0 	sw	v1,160(s0)
 15c:	ae020050 	sw	v0,80(s0)
 160:	8fa8003c 	lw	t0,60(sp)
 164:	11000081 	beqz	t0,36c <skb_segment+0x36c>
 168:	8fa90038 	lw	t1,56(sp)
 16c:	ad300000 	sw	s0,0(t1)
 170:	02002021 	move	a0,s0
 174:	0c000000 	jal	0 <skb_segment>
			174: R_MIPS_26	.text.__copy_skb_header
 178:	02a02821 	move	a1,s5
 17c:	8e020064 	lw	v0,100(s0)
 180:	96a30058 	lhu	v1,88(s5)
 184:	3c043000 	lui	a0,0x3000
 188:	00441024 	and	v0,v0,a0
 18c:	10440039 	beq	v0,a0,274 <skb_segment+0x274>
 190:	a6030058 	sh	v1,88(s0)
 194:	8e0400ac 	lw	a0,172(s0)
 198:	96a20058 	lhu	v0,88(s5)
 19c:	8ea30094 	lw	v1,148(s5)
 1a0:	ae04009c 	sw	a0,156(s0)
 1a4:	00821021 	addu	v0,a0,v0
 1a8:	ae020098 	sw	v0,152(s0)
 1ac:	8ea60098 	lw	a2,152(s5)
 1b0:	8ea500ac 	lw	a1,172(s5)
 1b4:	00661823 	subu	v1,v1,a2
 1b8:	00431021 	addu	v0,v0,v1
 1bc:	ae020094 	sw	v0,148(s0)
 1c0:	0c000000 	jal	0 <skb_segment>
			1c0: R_MIPS_26	memcpy
 1c4:	8fa60030 	lw	a2,48(sp)
 1c8:	8ea300a4 	lw	v1,164(s5)
 1cc:	8c620010 	lw	v0,16(v1)
 1d0:	10560018 	beq	v0,s6,234 <skb_segment+0x234>
 1d4:	00000000 	nop
 1d8:	03d49021 	addu	s2,s8,s4
 1dc:	02c08821 	move	s1,s6
 1e0:	8ea70050 	lw	a3,80(s5)
 1e4:	0247102b 	sltu	v0,s2,a3
 1e8:	10400071 	beqz	v0,3b0 <skb_segment+0x3b0>
 1ec:	0240a021 	move	s4,s2
 1f0:	8ea20054 	lw	v0,84(s5)
 1f4:	8fa40034 	lw	a0,52(sp)
 1f8:	00e23023 	subu	a2,a3,v0
 1fc:	00f41823 	subu	v1,a3,s4
 200:	0083102b 	sltu	v0,a0,v1
 204:	0080f021 	move	s8,a0
 208:	00d49823 	subu	s3,a2,s4
 20c:	afb00038 	sw	s0,56(sp)
 210:	0220b021 	move	s6,s1
 214:	0661ffb2 	bgez	s3,e0 <skb_segment+0xe0>
 218:	0062f00a 	movz	s8,v1,v0
 21c:	00009821 	move	s3,zero
 220:	8fa50028 	lw	a1,40(sp)
 224:	14a0ffb2 	bnez	a1,f0 <skb_segment+0xf0>
 228:	00000000 	nop
 22c:	0800003c 	j	f0 <skb_segment+0xf0>
			22c: R_MIPS_26	.text.skb_segment
 230:	03c09821 	move	s3,s8
 234:	8fa60028 	lw	a2,40(sp)
 238:	14c0006a 	bnez	a2,3e4 <skb_segment+0x3e4>
 23c:	02002021 	move	a0,s0
 240:	8e020064 	lw	v0,100(s0)
 244:	03c02821 	move	a1,s8
 248:	7c02ef04 	ins	v0,zero,0x1c,0x2
 24c:	0c000000 	jal	0 <skb_segment>
			24c: R_MIPS_26	skb_put
 250:	ae020064 	sw	v0,100(s0)
 254:	00403021 	move	a2,v0
 258:	02a02021 	move	a0,s5
 25c:	02802821 	move	a1,s4
 260:	03c03821 	move	a3,s8
 264:	0c000000 	jal	0 <skb_segment>
			264: R_MIPS_26	skb_copy_and_csum_bits
 268:	afa00010 	sw	zero,16(sp)
 26c:	08000076 	j	1d8 <skb_segment+0x1d8>
			26c: R_MIPS_26	.text.skb_segment
 270:	ae02005c 	sw	v0,92(s0)
 274:	8e0400ac 	lw	a0,172(s0)
 278:	8e0200a8 	lw	v0,168(s0)
 27c:	9603005c 	lhu	v1,92(s0)
 280:	8fa5002c 	lw	a1,44(sp)
 284:	00821023 	subu	v0,a0,v0
 288:	00431021 	addu	v0,v0,v1
 28c:	00451023 	subu	v0,v0,a1
 290:	08000066 	j	198 <skb_segment+0x198>
			290: R_MIPS_26	.text.skb_segment
 294:	a602005c 	sh	v0,92(s0)
 298:	8ec20050 	lw	v0,80(s6)
 29c:	03c21026 	xor	v0,s8,v0
 2a0:	0002102b 	sltu	v0,zero,v0
 2a4:	00028036 	tne	zero,v0,0x200
 2a8:	24050020 	li	a1,32
 2ac:	0c000000 	jal	0 <skb_segment>
			2ac: R_MIPS_26	skb_clone
 2b0:	02c02021 	move	a0,s6
 2b4:	00408021 	move	s0,v0
 2b8:	10400030 	beqz	v0,37c <skb_segment+0x37c>
 2bc:	8ed60000 	lw	s6,0(s6)
 2c0:	8c420064 	lw	v0,100(v0)
 2c4:	8e0300a4 	lw	v1,164(s0)
 2c8:	8e0400a8 	lw	a0,168(s0)
 2cc:	3c084000 	lui	t0,0x4000
 2d0:	00481024 	and	v0,v0,t0
 2d4:	00003021 	move	a2,zero
 2d8:	10400007 	beqz	v0,2f8 <skb_segment+0x2f8>
 2dc:	00649823 	subu	s3,v1,a0
 2e0:	8c620028 	lw	v0,40(v1)
 2e4:	00021c03 	sra	v1,v0,0x10
 2e8:	3042ffff 	andi	v0,v0,0xffff
 2ec:	00431023 	subu	v0,v0,v1
 2f0:	38420001 	xori	v0,v0,0x1
 2f4:	0002302b 	sltu	a2,zero,v0
 2f8:	8e0200ac 	lw	v0,172(s0)
 2fc:	8fa90044 	lw	t1,68(sp)
 300:	00002821 	move	a1,zero
 304:	00441023 	subu	v0,v0,a0
 308:	01222023 	subu	a0,t1,v0
 30c:	0049102b 	sltu	v0,v0,t1
 310:	0082280b 	movn	a1,a0,v0
 314:	00a61825 	or	v1,a1,a2
 318:	14600087 	bnez	v1,538 <skb_segment+0x538>
 31c:	00003821 	move	a3,zero
 320:	8e0200b0 	lw	v0,176(s0)
 324:	8fa50020 	lw	a1,32(sp)
 328:	02002021 	move	a0,s0
 32c:	00471021 	addu	v0,v0,a3
 330:	03c52821 	addu	a1,s8,a1
 334:	afa50020 	sw	a1,32(sp)
 338:	0c000000 	jal	0 <skb_segment>
			338: R_MIPS_26	.text.skb_release_head_state
 33c:	ae0200b0 	sw	v0,176(s0)
 340:	8fa80030 	lw	t0,48(sp)
 344:	8fa6001c 	lw	a2,28(sp)
 348:	8e0200ac 	lw	v0,172(s0)
 34c:	8e030050 	lw	v1,80(s0)
 350:	00461021 	addu	v0,v0,a2
 354:	00681821 	addu	v1,v1,t0
 358:	ae0200ac 	sw	v0,172(s0)
 35c:	ae030050 	sw	v1,80(s0)
 360:	8fa8003c 	lw	t0,60(sp)
 364:	1500ff81 	bnez	t0,16c <skb_segment+0x16c>
 368:	8fa90038 	lw	t1,56(sp)
 36c:	0800005c 	j	170 <skb_segment+0x170>
			36c: R_MIPS_26	.text.skb_segment
 370:	afb0003c 	sw	s0,60(sp)
 374:	0c000000 	jal	0 <skb_segment>
			374: R_MIPS_26	kfree_skb
 378:	02002021 	move	a0,s0
 37c:	8fa3003c 	lw	v1,60(sp)
 380:	14600005 	bnez	v1,398 <skb_segment+0x398>
 384:	8fa8003c 	lw	t0,60(sp)
 388:	080000eb 	j	3ac <skb_segment+0x3ac>
			388: R_MIPS_26	.text.skb_segment
 38c:	2409fff4 	li	t1,-12
 390:	afb0003c 	sw	s0,60(sp)
 394:	8fa8003c 	lw	t0,60(sp)
 398:	8d100000 	lw	s0,0(t0)
 39c:	0c000000 	jal	0 <skb_segment>
			39c: R_MIPS_26	kfree_skb
 3a0:	01002021 	move	a0,t0
 3a4:	1600fffa 	bnez	s0,390 <skb_segment+0x390>
 3a8:	2409fff4 	li	t1,-12
 3ac:	afa9003c 	sw	t1,60(sp)
 3b0:	8fbf006c 	lw	ra,108(sp)
 3b4:	8fa2003c 	lw	v0,60(sp)
 3b8:	8fbe0068 	lw	s8,104(sp)
 3bc:	8fb70064 	lw	s7,100(sp)
 3c0:	8fb60060 	lw	s6,96(sp)
 3c4:	8fb5005c 	lw	s5,92(sp)
 3c8:	8fb40058 	lw	s4,88(sp)
 3cc:	8fb30054 	lw	s3,84(sp)
 3d0:	8fb20050 	lw	s2,80(sp)
 3d4:	8fb1004c 	lw	s1,76(sp)
 3d8:	8fb00048 	lw	s0,72(sp)
 3dc:	03e00008 	jr	ra
 3e0:	27bd0070 	addiu	sp,sp,112
 3e4:	8e0800a4 	lw	t0,164(s0)
 3e8:	02602821 	move	a1,s3
 3ec:	0c000000 	jal	0 <skb_segment>
			3ec: R_MIPS_26	skb_put
 3f0:	afa80018 	sw	t0,24(sp)
 3f4:	8ea500ac 	lw	a1,172(s5)
 3f8:	00402021 	move	a0,v0
 3fc:	02603021 	move	a2,s3
 400:	0c000000 	jal	0 <skb_segment>
			400: R_MIPS_26	memcpy
 404:	00b42821 	addu	a1,a1,s4
 408:	8fa90020 	lw	t1,32(sp)
 40c:	03d49021 	addu	s2,s8,s4
 410:	02c08821 	move	s1,s6
 414:	0132182b 	sltu	v1,t1,s2
 418:	1060003e 	beqz	v1,514 <skb_segment+0x514>
 41c:	01204021 	move	t0,t1
 420:	8fa50024 	lw	a1,36(sp)
 424:	8fa60018 	lw	a2,24(sp)
 428:	02e5102a 	slt	v0,s7,a1
 42c:	1440000b 	bnez	v0,45c <skb_segment+0x45c>
 430:	24c70030 	addiu	a3,a2,48
 434:	0800015d 	j	574 <skb_segment+0x574>
			434: R_MIPS_26	.text.skb_segment
 438:	8ec30050 	lw	v1,80(s6)
 43c:	8fa40024 	lw	a0,36(sp)
 440:	26f70001 	addiu	s7,s7,1
 444:	24e7000c 	addiu	a3,a3,12
 448:	afa80020 	sw	t0,32(sp)
 44c:	10a0005c 	beqz	a1,5c0 <skb_segment+0x5c0>
 450:	02e4102a 	slt	v0,s7,a0
 454:	10400046 	beqz	v0,570 <skb_segment+0x570>
 458:	00000000 	nop
 45c:	8ea300a4 	lw	v1,164(s5)
 460:	00172080 	sll	a0,s7,0x2
 464:	00171100 	sll	v0,s7,0x4
 468:	00441023 	subu	v0,v0,a0
 46c:	00621821 	addu	v1,v1,v0
 470:	8c660030 	lw	a2,48(v1)
 474:	8c640038 	lw	a0,56(v1)
 478:	8c650034 	lw	a1,52(v1)
 47c:	ace60000 	sw	a2,0(a3)
 480:	ace40008 	sw	a0,8(a3)
 484:	ace50004 	sw	a1,4(a3)
 488:	8cc20000 	lw	v0,0(a2)
 48c:	30428000 	andi	v0,v0,0x8000
 490:	10400002 	beqz	v0,49c <skb_segment+0x49c>
 494:	00c01821 	move	v1,a2
 498:	8cc3000c 	lw	v1,12(a2)
 49c:	8c620004 	lw	v0,4(v1)
 4a0:	c0620004 	ll	v0,4(v1)
 4a4:	24420001 	addiu	v0,v0,1
 4a8:	e0620004 	sc	v0,4(v1)
 4ac:	1040004d 	beqz	v0,5e4 <skb_segment+0x5e4>
 4b0:	00000000 	nop
 4b4:	0114102b 	sltu	v0,t0,s4
 4b8:	10400008 	beqz	v0,4dc <skb_segment+0x4dc>
 4bc:	8ce40008 	lw	a0,8(a3)
 4c0:	8ce20004 	lw	v0,4(a3)
 4c4:	00941823 	subu	v1,a0,s4
 4c8:	00681821 	addu	v1,v1,t0
 4cc:	02821021 	addu	v0,s4,v0
 4d0:	00481023 	subu	v0,v0,t0
 4d4:	ace20004 	sw	v0,4(a3)
 4d8:	ace30008 	sw	v1,8(a3)
 4dc:	8fa30020 	lw	v1,32(sp)
 4e0:	8e0200a4 	lw	v0,164(s0)
 4e4:	00644021 	addu	t0,v1,a0
 4e8:	94430000 	lhu	v1,0(v0)
 4ec:	0248202b 	sltu	a0,s2,t0
 4f0:	0112282b 	sltu	a1,t0,s2
 4f4:	24630001 	addiu	v1,v1,1
 4f8:	1080ffd0 	beqz	a0,43c <skb_segment+0x43c>
 4fc:	a4430000 	sh	v1,0(v0)
 500:	8ce20008 	lw	v0,8(a3)
 504:	02c08821 	move	s1,s6
 508:	02421021 	addu	v0,s2,v0
 50c:	00481023 	subu	v0,v0,t0
 510:	ace20008 	sw	v0,8(a3)
 514:	8e020050 	lw	v0,80(s0)
 518:	8e0300b0 	lw	v1,176(s0)
 51c:	03d32023 	subu	a0,s8,s3
 520:	00441021 	addu	v0,v0,a0
 524:	00641821 	addu	v1,v1,a0
 528:	ae020050 	sw	v0,80(s0)
 52c:	ae0300b0 	sw	v1,176(s0)
 530:	08000078 	j	1e0 <skb_segment+0x1e0>
			530: R_MIPS_26	.text.skb_segment
 534:	ae040054 	sw	a0,84(s0)
 538:	24a5001f 	addiu	a1,a1,31
 53c:	2402ffe0 	li	v0,-32
 540:	00a22824 	and	a1,a1,v0
 544:	02002021 	move	a0,s0
 548:	00003021 	move	a2,zero
 54c:	0c000000 	jal	0 <skb_segment>
			54c: R_MIPS_26	pskb_expand_head
 550:	24070020 	li	a3,32
 554:	1440ff87 	bnez	v0,374 <skb_segment+0x374>
 558:	00000000 	nop
 55c:	8e0300a8 	lw	v1,168(s0)
 560:	8e0200a4 	lw	v0,164(s0)
 564:	00431023 	subu	v0,v0,v1
 568:	080000c8 	j	320 <skb_segment+0x320>
			568: R_MIPS_26	.text.skb_segment
 56c:	00533823 	subu	a3,v0,s3
 570:	8ec30050 	lw	v1,80(s6)
 574:	0103a021 	addu	s4,t0,v1
 578:	02541026 	xor	v0,s2,s4
 57c:	0002102b 	sltu	v0,zero,v0
 580:	00028036 	tne	zero,v0,0x200
 584:	8ed10000 	lw	s1,0(s6)
 588:	1220000f 	beqz	s1,5c8 <skb_segment+0x5c8>
 58c:	00000000 	nop
 590:	02c02021 	move	a0,s6
 594:	0c000000 	jal	0 <skb_segment>
			594: R_MIPS_26	skb_clone
 598:	24050020 	li	a1,32
 59c:	1040ff77 	beqz	v0,37c <skb_segment+0x37c>
 5a0:	00402021 	move	a0,v0
 5a4:	8e0300a4 	lw	v1,164(s0)
 5a8:	8c620010 	lw	v0,16(v1)
 5ac:	0002102b 	sltu	v0,zero,v0
 5b0:	00028036 	tne	zero,v0,0x200
 5b4:	ac640010 	sw	a0,16(v1)
 5b8:	08000145 	j	514 <skb_segment+0x514>
			5b8: R_MIPS_26	.text.skb_segment
 5bc:	afb40020 	sw	s4,32(sp)
 5c0:	08000145 	j	514 <skb_segment+0x514>
			5c0: R_MIPS_26	.text.skb_segment
 5c4:	02c08821 	move	s1,s6
 5c8:	c2c200b4 	ll	v0,180(s6)
 5cc:	24420001 	addiu	v0,v0,1
 5d0:	e2c200b4 	sc	v0,180(s6)
 5d4:	10400005 	beqz	v0,5ec <skb_segment+0x5ec>
 5d8:	00000000 	nop
 5dc:	08000169 	j	5a4 <skb_segment+0x5a4>
			5dc: R_MIPS_26	.text.skb_segment
 5e0:	02c02021 	move	a0,s6
 5e4:	1000ffae 	b	4a0 <skb_segment+0x4a0>
 5e8:	00000000 	nop
 5ec:	1000fff6 	b	5c8 <skb_segment+0x5c8>
 5f0:	00000000 	nop

Disassembly of section .text.skb_copy_expand:

00000000 <skb_copy_expand>:
   0:	27bdffd8 	addiu	sp,sp,-40
   4:	afb40020 	sw	s4,32(sp)
   8:	afb3001c 	sw	s3,28(sp)
   c:	afb20018 	sw	s2,24(sp)
  10:	afb00010 	sw	s0,16(sp)
  14:	afbf0024 	sw	ra,36(sp)
  18:	afb10014 	sw	s1,20(sp)
  1c:	00809021 	move	s2,a0
  20:	8c840050 	lw	a0,80(a0)
  24:	00a09821 	move	s3,a1
  28:	00e02821 	move	a1,a3
  2c:	02642021 	addu	a0,s3,a0
  30:	00862021 	addu	a0,a0,a2
  34:	2407ffff 	li	a3,-1
  38:	0c000000 	jal	0 <skb_copy_expand>
			38: R_MIPS_26	__alloc_skb
  3c:	00003021 	move	a2,zero
  40:	00408021 	move	s0,v0
  44:	0260a021 	move	s4,s3
  48:	8e4400ac 	lw	a0,172(s2)
  4c:	1040002a 	beqz	v0,f8 <skb_copy_expand+0xf8>
  50:	8e4600a8 	lw	a2,168(s2)
  54:	8c4200ac 	lw	v0,172(v0)
  58:	8e0300a0 	lw	v1,160(s0)
  5c:	8e450050 	lw	a1,80(s2)
  60:	00531021 	addu	v0,v0,s3
  64:	00731821 	addu	v1,v1,s3
  68:	00868823 	subu	s1,a0,a2
  6c:	ae0300a0 	sw	v1,160(s0)
  70:	ae0200ac 	sw	v0,172(s0)
  74:	0c000000 	jal	0 <skb_copy_expand>
			74: R_MIPS_26	skb_put
  78:	02002021 	move	a0,s0
  7c:	0233182a 	slt	v1,s1,s3
  80:	1460000f 	bnez	v1,c0 <skb_copy_expand+0xc0>
  84:	02711023 	subu	v0,s3,s1
  88:	02602821 	move	a1,s3
  8c:	00001021 	move	v0,zero
  90:	8e0600a8 	lw	a2,168(s0)
  94:	8e470050 	lw	a3,80(s2)
  98:	00052823 	negu	a1,a1
  9c:	00c23021 	addu	a2,a2,v0
  a0:	02873821 	addu	a3,s4,a3
  a4:	0c000000 	jal	0 <skb_copy_expand>
			a4: R_MIPS_26	skb_copy_bits
  a8:	02402021 	move	a0,s2
  ac:	10400007 	beqz	v0,cc <skb_copy_expand+0xcc>
  b0:	02402821 	move	a1,s2
  b4:	0200000d 	break	0x200
  b8:	0800002e 	j	b8 <skb_copy_expand+0xb8>
			b8: R_MIPS_26	.text.skb_copy_expand
  bc:	00000000 	nop
  c0:	0220a021 	move	s4,s1
  c4:	08000024 	j	90 <skb_copy_expand+0x90>
			c4: R_MIPS_26	.text.skb_copy_expand
  c8:	02202821 	move	a1,s1
  cc:	0c000000 	jal	0 <skb_copy_expand>
			cc: R_MIPS_26	.text.copy_skb_header
  d0:	02002021 	move	a0,s0
  d4:	8e020064 	lw	v0,100(s0)
  d8:	3c033000 	lui	v1,0x3000
  dc:	00431024 	and	v0,v0,v1
  e0:	14430006 	bne	v0,v1,fc <skb_copy_expand+0xfc>
  e4:	8fbf0024 	lw	ra,36(sp)
  e8:	9603005c 	lhu	v1,92(s0)
  ec:	02711023 	subu	v0,s3,s1
  f0:	00431021 	addu	v0,v0,v1
  f4:	a602005c 	sh	v0,92(s0)
  f8:	8fbf0024 	lw	ra,36(sp)
  fc:	02001021 	move	v0,s0
 100:	8fb40020 	lw	s4,32(sp)
 104:	8fb3001c 	lw	s3,28(sp)
 108:	8fb20018 	lw	s2,24(sp)
 10c:	8fb10014 	lw	s1,20(sp)
 110:	8fb00010 	lw	s0,16(sp)
 114:	03e00008 	jr	ra
 118:	27bd0028 	addiu	sp,sp,40

Disassembly of section .text.pskb_copy:

00000000 <pskb_copy>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb10018 	sw	s1,24(sp)
   8:	afb00014 	sw	s0,20(sp)
   c:	afbf001c 	sw	ra,28(sp)
  10:	8c8200a4 	lw	v0,164(a0)
  14:	00808821 	move	s1,a0
  18:	8c8400a8 	lw	a0,168(a0)
  1c:	00003021 	move	a2,zero
  20:	2407ffff 	li	a3,-1
  24:	0c000000 	jal	0 <pskb_copy>
			24: R_MIPS_26	__alloc_skb
  28:	00442023 	subu	a0,v0,a0
  2c:	10400054 	beqz	v0,180 <pskb_copy+0x180>
  30:	00408021 	move	s0,v0
  34:	8e2200ac 	lw	v0,172(s1)
  38:	8e2600a8 	lw	a2,168(s1)
  3c:	8e0300ac 	lw	v1,172(s0)
  40:	8e0400a0 	lw	a0,160(s0)
  44:	8e270050 	lw	a3,80(s1)
  48:	8e250054 	lw	a1,84(s1)
  4c:	00461023 	subu	v0,v0,a2
  50:	00621821 	addu	v1,v1,v0
  54:	00822021 	addu	a0,a0,v0
  58:	00e52823 	subu	a1,a3,a1
  5c:	ae0300ac 	sw	v1,172(s0)
  60:	ae0400a0 	sw	a0,160(s0)
  64:	0c000000 	jal	0 <pskb_copy>
			64: R_MIPS_26	skb_put
  68:	02002021 	move	a0,s0
  6c:	8e0400ac 	lw	a0,172(s0)
  70:	8e2500ac 	lw	a1,172(s1)
  74:	0c000000 	jal	0 <pskb_copy>
			74: R_MIPS_26	memcpy
  78:	8e060050 	lw	a2,80(s0)
  7c:	8e220054 	lw	v0,84(s1)
  80:	8e0300b0 	lw	v1,176(s0)
  84:	8e240050 	lw	a0,80(s1)
  88:	8e2500a4 	lw	a1,164(s1)
  8c:	00621821 	addu	v1,v1,v0
  90:	ae0300b0 	sw	v1,176(s0)
  94:	ae020054 	sw	v0,84(s0)
  98:	ae040050 	sw	a0,80(s0)
  9c:	94a20000 	lhu	v0,0(a1)
  a0:	10400024 	beqz	v0,134 <pskb_copy+0x134>
  a4:	00004021 	move	t0,zero
  a8:	00081880 	sll	v1,t0,0x2
  ac:	00082100 	sll	a0,t0,0x4
  b0:	00832023 	subu	a0,a0,v1
  b4:	00a41021 	addu	v0,a1,a0
  b8:	8e0300a4 	lw	v1,164(s0)
  bc:	8c450038 	lw	a1,56(v0)
  c0:	8c460030 	lw	a2,48(v0)
  c4:	8c470034 	lw	a3,52(v0)
  c8:	00641821 	addu	v1,v1,a0
  cc:	ac650038 	sw	a1,56(v1)
  d0:	ac660030 	sw	a2,48(v1)
  d4:	ac670034 	sw	a3,52(v1)
  d8:	8e0200a4 	lw	v0,164(s0)
  dc:	00441021 	addu	v0,v0,a0
  e0:	8c420030 	lw	v0,48(v0)
  e4:	8c430000 	lw	v1,0(v0)
  e8:	30638000 	andi	v1,v1,0x8000
  ec:	10600002 	beqz	v1,f8 <pskb_copy+0xf8>
  f0:	00000000 	nop
  f4:	8c42000c 	lw	v0,12(v0)
  f8:	8c430004 	lw	v1,4(v0)
  fc:	c0430004 	ll	v1,4(v0)
 100:	24630001 	addiu	v1,v1,1
 104:	e0430004 	sc	v1,4(v0)
 108:	10600023 	beqz	v1,198 <pskb_copy+0x198>
 10c:	00000000 	nop
 110:	8e2500a4 	lw	a1,164(s1)
 114:	25080001 	addiu	t0,t0,1
 118:	94a20000 	lhu	v0,0(a1)
 11c:	0102102a 	slt	v0,t0,v0
 120:	1440ffe2 	bnez	v0,ac <pskb_copy+0xac>
 124:	00081880 	sll	v1,t0,0x2
 128:	8e0200a4 	lw	v0,164(s0)
 12c:	a4480000 	sh	t0,0(v0)
 130:	8e2500a4 	lw	a1,164(s1)
 134:	8ca30010 	lw	v1,16(a1)
 138:	1060000f 	beqz	v1,178 <pskb_copy+0x178>
 13c:	02202821 	move	a1,s1
 140:	8e0200a4 	lw	v0,164(s0)
 144:	ac430010 	sw	v1,16(v0)
 148:	8e0300a4 	lw	v1,164(s0)
 14c:	8c620010 	lw	v0,16(v1)
 150:	10400009 	beqz	v0,178 <pskb_copy+0x178>
 154:	00000000 	nop
 158:	c04300b4 	ll	v1,180(v0)
 15c:	24630001 	addiu	v1,v1,1
 160:	e04300b4 	sc	v1,180(v0)
 164:	1060000e 	beqz	v1,1a0 <pskb_copy+0x1a0>
 168:	00000000 	nop
 16c:	8c420000 	lw	v0,0(v0)
 170:	1440fff9 	bnez	v0,158 <pskb_copy+0x158>
 174:	02202821 	move	a1,s1
 178:	0c000000 	jal	0 <pskb_copy>
			178: R_MIPS_26	.text.copy_skb_header
 17c:	02002021 	move	a0,s0
 180:	8fbf001c 	lw	ra,28(sp)
 184:	02001021 	move	v0,s0
 188:	8fb10018 	lw	s1,24(sp)
 18c:	8fb00014 	lw	s0,20(sp)
 190:	03e00008 	jr	ra
 194:	27bd0020 	addiu	sp,sp,32
 198:	1000ffd8 	b	fc <pskb_copy+0xfc>
 19c:	00000000 	nop
 1a0:	1000ffed 	b	158 <pskb_copy+0x158>
 1a4:	00000000 	nop

Disassembly of section .text.skb_realloc_headroom:

00000000 <skb_realloc_headroom>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb10018 	sw	s1,24(sp)
   8:	afbf001c 	sw	ra,28(sp)
   c:	afb00014 	sw	s0,20(sp)
  10:	8c8600a8 	lw	a2,168(a0)
  14:	8c8300ac 	lw	v1,172(a0)
  18:	00661823 	subu	v1,v1,a2
  1c:	00a38823 	subu	s1,a1,v1
  20:	1a200014 	blez	s1,74 <skb_realloc_headroom+0x74>
  24:	8fbf001c 	lw	ra,28(sp)
  28:	0c000000 	jal	0 <skb_realloc_headroom>
			28: R_MIPS_26	skb_clone
  2c:	24050020 	li	a1,32
  30:	1040000a 	beqz	v0,5c <skb_realloc_headroom+0x5c>
  34:	00408021 	move	s0,v0
  38:	2622001f 	addiu	v0,s1,31
  3c:	2405ffe0 	li	a1,-32
  40:	00452824 	and	a1,v0,a1
  44:	02002021 	move	a0,s0
  48:	00003021 	move	a2,zero
  4c:	0c000000 	jal	0 <skb_realloc_headroom>
			4c: R_MIPS_26	pskb_expand_head
  50:	24070020 	li	a3,32
  54:	1440000c 	bnez	v0,88 <skb_realloc_headroom+0x88>
  58:	00000000 	nop
  5c:	8fbf001c 	lw	ra,28(sp)
  60:	02001021 	move	v0,s0
  64:	8fb10018 	lw	s1,24(sp)
  68:	8fb00014 	lw	s0,20(sp)
  6c:	03e00008 	jr	ra
  70:	27bd0020 	addiu	sp,sp,32
  74:	8fb10018 	lw	s1,24(sp)
  78:	8fb00014 	lw	s0,20(sp)
  7c:	24050020 	li	a1,32
  80:	08000000 	j	0 <skb_realloc_headroom>
			80: R_MIPS_26	pskb_copy
  84:	27bd0020 	addiu	sp,sp,32
  88:	0c000000 	jal	0 <skb_realloc_headroom>
			88: R_MIPS_26	kfree_skb
  8c:	02002021 	move	a0,s0
  90:	08000017 	j	5c <skb_realloc_headroom+0x5c>
			90: R_MIPS_26	.text.skb_realloc_headroom
  94:	00008021 	move	s0,zero

Disassembly of section .text.skb_copy:

00000000 <skb_copy>:
   0:	27bdffd8 	addiu	sp,sp,-40
   4:	afb2001c 	sw	s2,28(sp)
   8:	afb10018 	sw	s1,24(sp)
   c:	afbf0024 	sw	ra,36(sp)
  10:	afb30020 	sw	s3,32(sp)
  14:	afb00014 	sw	s0,20(sp)
  18:	00809021 	move	s2,a0
  1c:	8c9000a8 	lw	s0,168(a0)
  20:	8c8400a4 	lw	a0,164(a0)
  24:	8e420054 	lw	v0,84(s2)
  28:	00003021 	move	a2,zero
  2c:	00902023 	subu	a0,a0,s0
  30:	00822021 	addu	a0,a0,v0
  34:	2407ffff 	li	a3,-1
  38:	0c000000 	jal	0 <skb_copy>
			38: R_MIPS_26	__alloc_skb
  3c:	8e5300ac 	lw	s3,172(s2)
  40:	10400019 	beqz	v0,a8 <skb_copy+0xa8>
  44:	00408821 	move	s1,v0
  48:	8c4200ac 	lw	v0,172(v0)
  4c:	8e2300a0 	lw	v1,160(s1)
  50:	02708023 	subu	s0,s3,s0
  54:	8e450050 	lw	a1,80(s2)
  58:	00501021 	addu	v0,v0,s0
  5c:	00701821 	addu	v1,v1,s0
  60:	02202021 	move	a0,s1
  64:	ae2200ac 	sw	v0,172(s1)
  68:	0c000000 	jal	0 <skb_copy>
			68: R_MIPS_26	skb_put
  6c:	ae2300a0 	sw	v1,160(s1)
  70:	8e470050 	lw	a3,80(s2)
  74:	8e2600a8 	lw	a2,168(s1)
  78:	02402021 	move	a0,s2
  7c:	02073821 	addu	a3,s0,a3
  80:	0c000000 	jal	0 <skb_copy>
			80: R_MIPS_26	skb_copy_bits
  84:	00102823 	negu	a1,s0
  88:	10400004 	beqz	v0,9c <skb_copy+0x9c>
  8c:	00000000 	nop
  90:	0200000d 	break	0x200
  94:	08000025 	j	94 <skb_copy+0x94>
			94: R_MIPS_26	.text.skb_copy
  98:	00000000 	nop
  9c:	02402821 	move	a1,s2
  a0:	0c000000 	jal	0 <skb_copy>
			a0: R_MIPS_26	.text.copy_skb_header
  a4:	02202021 	move	a0,s1
  a8:	8fbf0024 	lw	ra,36(sp)
  ac:	02201021 	move	v0,s1
  b0:	8fb30020 	lw	s3,32(sp)
  b4:	8fb2001c 	lw	s2,28(sp)
  b8:	8fb10018 	lw	s1,24(sp)
  bc:	8fb00014 	lw	s0,20(sp)
  c0:	03e00008 	jr	ra
  c4:	27bd0028 	addiu	sp,sp,40

Disassembly of section .text.skb_cow_data:

00000000 <skb_cow_data>:
   0:	27bdffc0 	addiu	sp,sp,-64
   4:	afb00018 	sw	s0,24(sp)
   8:	afbf003c 	sw	ra,60(sp)
   c:	afbe0038 	sw	s8,56(sp)
  10:	afb70034 	sw	s7,52(sp)
  14:	afb60030 	sw	s6,48(sp)
  18:	afb5002c 	sw	s5,44(sp)
  1c:	afb40028 	sw	s4,40(sp)
  20:	afb30024 	sw	s3,36(sp)
  24:	afb20020 	sw	s2,32(sp)
  28:	afb1001c 	sw	s1,28(sp)
  2c:	8c820064 	lw	v0,100(a0)
  30:	00808021 	move	s0,a0
  34:	afa50044 	sw	a1,68(sp)
  38:	7c420780 	ext	v0,v0,0x1e,0x1
  3c:	1040006f 	beqz	v0,1fc <skb_cow_data+0x1fc>
  40:	afa60048 	sw	a2,72(sp)
  44:	8c8400a4 	lw	a0,164(a0)
  48:	24030001 	li	v1,1
  4c:	8c820028 	lw	v0,40(a0)
  50:	3042ffff 	andi	v0,v0,0xffff
  54:	1043006a 	beq	v0,v1,200 <skb_cow_data+0x200>
  58:	00002821 	move	a1,zero
  5c:	94820000 	lhu	v0,0(a0)
  60:	1040000f 	beqz	v0,a0 <skb_cow_data+0xa0>
  64:	2447ffff 	addiu	a3,v0,-1
  68:	00071880 	sll	v1,a3,0x2
  6c:	00071100 	sll	v0,a3,0x4
  70:	00431023 	subu	v0,v0,v1
  74:	24420038 	addiu	v0,v0,56
  78:	00823021 	addu	a2,a0,v0
  7c:	00002821 	move	a1,zero
  80:	00002021 	move	a0,zero
  84:	2408ffff 	li	t0,-1
  88:	8cc20000 	lw	v0,0(a2)
  8c:	24840001 	addiu	a0,a0,1
  90:	00e41823 	subu	v1,a3,a0
  94:	00a22821 	addu	a1,a1,v0
  98:	1468fffb 	bne	v1,t0,88 <skb_cow_data+0x88>
  9c:	24c6fff4 	addiu	a2,a2,-12
  a0:	0c000000 	jal	0 <skb_cow_data>
			a0: R_MIPS_26	__pskb_pull_tail
  a4:	02002021 	move	a0,s0
  a8:	10400080 	beqz	v0,2ac <skb_cow_data+0x2ac>
  ac:	2414fff4 	li	s4,-12
  b0:	8e0400a4 	lw	a0,164(s0)
  b4:	8c920010 	lw	s2,16(a0)
  b8:	12400092 	beqz	s2,304 <skb_cow_data+0x304>
  bc:	3c020000 	lui	v0,0x0
			bc: R_MIPS_HI16	sock_wfree
  c0:	245e0000 	addiu	s8,v0,0
			c0: R_MIPS_LO16	sock_wfree
  c4:	8fa20044 	lw	v0,68(sp)
  c8:	00009821 	move	s3,zero
  cc:	24160001 	li	s6,1
  d0:	24420080 	addiu	v0,v0,128
  d4:	afa20010 	sw	v0,16(sp)
  d8:	8e4200b4 	lw	v0,180(s2)
  dc:	8e430000 	lw	v1,0(s2)
  e0:	24950010 	addiu	s5,a0,16
  e4:	38420001 	xori	v0,v0,0x1
  e8:	24140001 	li	s4,1
  ec:	3c174000 	lui	s7,0x4000
  f0:	10600036 	beqz	v1,1cc <skb_cow_data+0x1cc>
  f4:	02c2980b 	movn	s3,s6,v0
  f8:	00003021 	move	a2,zero
  fc:	1660000a 	bnez	s3,128 <skb_cow_data+0x128>
 100:	00000000 	nop
 104:	8e420064 	lw	v0,100(s2)
 108:	00571024 	and	v0,v0,s7
 10c:	10400043 	beqz	v0,21c <skb_cow_data+0x21c>
 110:	00000000 	nop
 114:	8e4300a4 	lw	v1,164(s2)
 118:	8c620028 	lw	v0,40(v1)
 11c:	3042ffff 	andi	v0,v0,0xffff
 120:	1056003e 	beq	v0,s6,21c <skb_cow_data+0x21c>
 124:	00000000 	nop
 128:	14c00056 	bnez	a2,284 <skb_cow_data+0x284>
 12c:	02402021 	move	a0,s2
 130:	0c000000 	jal	0 <skb_cow_data>
			130: R_MIPS_26	skb_copy
 134:	24050020 	li	a1,32
 138:	00408021 	move	s0,v0
 13c:	1200005a 	beqz	s0,2a8 <skb_cow_data+0x2a8>
 140:	00000000 	nop
 144:	8e510010 	lw	s1,16(s2)
 148:	1220000e 	beqz	s1,184 <skb_cow_data+0x184>
 14c:	00000000 	nop
 150:	8e020068 	lw	v0,104(s0)
 154:	10400003 	beqz	v0,164 <skb_cow_data+0x164>
 158:	00000000 	nop
 15c:	0040f809 	jalr	v0
 160:	02002021 	move	a0,s0
 164:	ae110010 	sw	s1,16(s0)
 168:	ae1e0068 	sw	s8,104(s0)
 16c:	8e0200b0 	lw	v0,176(s0)
 170:	c2230068 	ll	v1,104(s1)
 174:	00621821 	addu	v1,v1,v0
 178:	e2230068 	sc	v1,104(s1)
 17c:	1060008c 	beqz	v1,3b0 <skb_cow_data+0x3b0>
 180:	00000000 	nop
 184:	8e420000 	lw	v0,0(s2)
 188:	02402021 	move	a0,s2
 18c:	02009021 	move	s2,s0
 190:	ae020000 	sw	v0,0(s0)
 194:	0c000000 	jal	0 <skb_cow_data>
			194: R_MIPS_26	kfree_skb
 198:	aeb00000 	sw	s0,0(s5)
 19c:	8fa20048 	lw	v0,72(sp)
 1a0:	ac520000 	sw	s2,0(v0)
 1a4:	8e420000 	lw	v0,0(s2)
 1a8:	10400029 	beqz	v0,250 <skb_cow_data+0x250>
 1ac:	26940001 	addiu	s4,s4,1
 1b0:	0240a821 	move	s5,s2
 1b4:	00409021 	move	s2,v0
 1b8:	8e4200b4 	lw	v0,180(s2)
 1bc:	8e430000 	lw	v1,0(s2)
 1c0:	38420001 	xori	v0,v0,0x1
 1c4:	1460ffcc 	bnez	v1,f8 <skb_cow_data+0xf8>
 1c8:	02c2980b 	movn	s3,s6,v0
 1cc:	8fa30044 	lw	v1,68(sp)
 1d0:	1060ffca 	beqz	v1,fc <skb_cow_data+0xfc>
 1d4:	00003021 	move	a2,zero
 1d8:	8e4300a4 	lw	v1,164(s2)
 1dc:	94620000 	lhu	v0,0(v1)
 1e0:	1440ffc6 	bnez	v0,fc <skb_cow_data+0xfc>
 1e4:	8fa60010 	lw	a2,16(sp)
 1e8:	8c620010 	lw	v0,16(v1)
 1ec:	1040003c 	beqz	v0,2e0 <skb_cow_data+0x2e0>
 1f0:	00000000 	nop
 1f4:	0800003f 	j	fc <skb_cow_data+0xfc>
			1f4: R_MIPS_26	.text.skb_cow_data
 1f8:	00000000 	nop
 1fc:	8c8400a4 	lw	a0,164(a0)
 200:	94820000 	lhu	v0,0(a0)
 204:	1040ffab 	beqz	v0,b4 <skb_cow_data+0xb4>
 208:	2447ffff 	addiu	a3,v0,-1
 20c:	1440ff96 	bnez	v0,68 <skb_cow_data+0x68>
 210:	00002821 	move	a1,zero
 214:	08000028 	j	a0 <skb_cow_data+0xa0>
			214: R_MIPS_26	.text.skb_cow_data
 218:	00000000 	nop
 21c:	14c00019 	bnez	a2,284 <skb_cow_data+0x284>
 220:	00000000 	nop
 224:	8e4300a4 	lw	v1,164(s2)
 228:	94620000 	lhu	v0,0(v1)
 22c:	1440ffc0 	bnez	v0,130 <skb_cow_data+0x130>
 230:	02402021 	move	a0,s2
 234:	8c620010 	lw	v0,16(v1)
 238:	1440ffbd 	bnez	v0,130 <skb_cow_data+0x130>
 23c:	8fa20048 	lw	v0,72(sp)
 240:	ac520000 	sw	s2,0(v0)
 244:	8e420000 	lw	v0,0(s2)
 248:	1440ffd9 	bnez	v0,1b0 <skb_cow_data+0x1b0>
 24c:	26940001 	addiu	s4,s4,1
 250:	8fbf003c 	lw	ra,60(sp)
 254:	02801021 	move	v0,s4
 258:	8fbe0038 	lw	s8,56(sp)
 25c:	8fb70034 	lw	s7,52(sp)
 260:	8fb60030 	lw	s6,48(sp)
 264:	8fb5002c 	lw	s5,44(sp)
 268:	8fb40028 	lw	s4,40(sp)
 26c:	8fb30024 	lw	s3,36(sp)
 270:	8fb20020 	lw	s2,32(sp)
 274:	8fb1001c 	lw	s1,28(sp)
 278:	8fb00018 	lw	s0,24(sp)
 27c:	03e00008 	jr	ra
 280:	27bd0040 	addiu	sp,sp,64
 284:	8e4200ac 	lw	v0,172(s2)
 288:	8e4500a8 	lw	a1,168(s2)
 28c:	02402021 	move	a0,s2
 290:	24070020 	li	a3,32
 294:	0c000000 	jal	0 <skb_cow_data>
			294: R_MIPS_26	skb_copy_expand
 298:	00452823 	subu	a1,v0,a1
 29c:	00408021 	move	s0,v0
 2a0:	1600ffa8 	bnez	s0,144 <skb_cow_data+0x144>
 2a4:	00000000 	nop
 2a8:	2414fff4 	li	s4,-12
 2ac:	8fbf003c 	lw	ra,60(sp)
 2b0:	02801021 	move	v0,s4
 2b4:	8fbe0038 	lw	s8,56(sp)
 2b8:	8fb70034 	lw	s7,52(sp)
 2bc:	8fb60030 	lw	s6,48(sp)
 2c0:	8fb5002c 	lw	s5,44(sp)
 2c4:	8fb40028 	lw	s4,40(sp)
 2c8:	8fb30024 	lw	s3,36(sp)
 2cc:	8fb20020 	lw	s2,32(sp)
 2d0:	8fb1001c 	lw	s1,28(sp)
 2d4:	8fb00018 	lw	s0,24(sp)
 2d8:	03e00008 	jr	ra
 2dc:	27bd0040 	addiu	sp,sp,64
 2e0:	8e420054 	lw	v0,84(s2)
 2e4:	10400020 	beqz	v0,368 <skb_cow_data+0x368>
 2e8:	00002021 	move	a0,zero
 2ec:	8fa50044 	lw	a1,68(sp)
 2f0:	0085102a 	slt	v0,a0,a1
 2f4:	1040ff80 	beqz	v0,f8 <skb_cow_data+0xf8>
 2f8:	8fa60010 	lw	a2,16(sp)
 2fc:	0800003f 	j	fc <skb_cow_data+0xfc>
			2fc: R_MIPS_26	.text.skb_cow_data
 300:	00000000 	nop
 304:	8e030054 	lw	v1,84(s0)
 308:	14600003 	bnez	v1,318 <skb_cow_data+0x318>
 30c:	00001021 	move	v0,zero
 310:	8e0200a0 	lw	v0,160(s0)
 314:	00821023 	subu	v0,a0,v0
 318:	8fa50044 	lw	a1,68(sp)
 31c:	0045102a 	slt	v0,v0,a1
 320:	14400014 	bnez	v0,374 <skb_cow_data+0x374>
 324:	00000000 	nop
 328:	8fa50048 	lw	a1,72(sp)
 32c:	24140001 	li	s4,1
 330:	02801021 	move	v0,s4
 334:	acb00000 	sw	s0,0(a1)
 338:	8fbf003c 	lw	ra,60(sp)
 33c:	8fbe0038 	lw	s8,56(sp)
 340:	8fb70034 	lw	s7,52(sp)
 344:	8fb60030 	lw	s6,48(sp)
 348:	8fb5002c 	lw	s5,44(sp)
 34c:	8fb40028 	lw	s4,40(sp)
 350:	8fb30024 	lw	s3,36(sp)
 354:	8fb20020 	lw	s2,32(sp)
 358:	8fb1001c 	lw	s1,28(sp)
 35c:	8fb00018 	lw	s0,24(sp)
 360:	03e00008 	jr	ra
 364:	27bd0040 	addiu	sp,sp,64
 368:	8e4200a0 	lw	v0,160(s2)
 36c:	080000bb 	j	2ec <skb_cow_data+0x2ec>
			36c: R_MIPS_26	.text.skb_cow_data
 370:	00622023 	subu	a0,v1,v0
 374:	14600003 	bnez	v1,384 <skb_cow_data+0x384>
 378:	00001021 	move	v0,zero
 37c:	8e0200a0 	lw	v0,160(s0)
 380:	00821023 	subu	v0,a0,v0
 384:	8fa30044 	lw	v1,68(sp)
 388:	02002021 	move	a0,s0
 38c:	00002821 	move	a1,zero
 390:	24660080 	addiu	a2,v1,128
 394:	00c23023 	subu	a2,a2,v0
 398:	0c000000 	jal	0 <skb_cow_data>
			398: R_MIPS_26	pskb_expand_head
 39c:	24070020 	li	a3,32
 3a0:	1040ffe1 	beqz	v0,328 <skb_cow_data+0x328>
 3a4:	2414fff4 	li	s4,-12
 3a8:	080000ac 	j	2b0 <skb_cow_data+0x2b0>
			3a8: R_MIPS_26	.text.skb_cow_data
 3ac:	8fbf003c 	lw	ra,60(sp)
 3b0:	1000ff6f 	b	170 <skb_cow_data+0x170>
 3b4:	00000000 	nop

Disassembly of section .text.dev_alloc_skb:

00000000 <dev_alloc_skb>:
   0:	27bdffe8 	addiu	sp,sp,-24
   4:	24840020 	addiu	a0,a0,32
   8:	24050220 	li	a1,544
   c:	00003021 	move	a2,zero
  10:	afbf0014 	sw	ra,20(sp)
  14:	0c000000 	jal	0 <dev_alloc_skb>
			14: R_MIPS_26	__alloc_skb
  18:	2407ffff 	li	a3,-1
  1c:	10400007 	beqz	v0,3c <dev_alloc_skb+0x3c>
  20:	00402021 	move	a0,v0
  24:	8c4200ac 	lw	v0,172(v0)
  28:	8c8300a0 	lw	v1,160(a0)
  2c:	24420020 	addiu	v0,v0,32
  30:	24630020 	addiu	v1,v1,32
  34:	ac8200ac 	sw	v0,172(a0)
  38:	ac8300a0 	sw	v1,160(a0)
  3c:	8fbf0014 	lw	ra,20(sp)
  40:	00801021 	move	v0,a0
  44:	03e00008 	jr	ra
  48:	27bd0018 	addiu	sp,sp,24

Disassembly of section .text.__netdev_alloc_skb:

00000000 <__netdev_alloc_skb>:
   0:	27bdffe8 	addiu	sp,sp,-24
   4:	afb00010 	sw	s0,16(sp)
   8:	2407ffff 	li	a3,-1
   c:	00808021 	move	s0,a0
  10:	24a40020 	addiu	a0,a1,32
  14:	00c02821 	move	a1,a2
  18:	afbf0014 	sw	ra,20(sp)
  1c:	0c000000 	jal	0 <__netdev_alloc_skb>
			1c: R_MIPS_26	__alloc_skb
  20:	00003021 	move	a2,zero
  24:	10400008 	beqz	v0,48 <__netdev_alloc_skb+0x48>
  28:	00402021 	move	a0,v0
  2c:	8c4200ac 	lw	v0,172(v0)
  30:	8c8300a0 	lw	v1,160(a0)
  34:	ac900014 	sw	s0,20(a0)
  38:	24420020 	addiu	v0,v0,32
  3c:	24630020 	addiu	v1,v1,32
  40:	ac8200ac 	sw	v0,172(a0)
  44:	ac8300a0 	sw	v1,160(a0)
  48:	8fbf0014 	lw	ra,20(sp)
  4c:	00801021 	move	v0,a0
  50:	8fb00010 	lw	s0,16(sp)
  54:	03e00008 	jr	ra
  58:	27bd0018 	addiu	sp,sp,24
