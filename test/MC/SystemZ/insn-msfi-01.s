# RUN: llvm-mc -triple s390x-linux-gnu -show-encoding %s | FileCheck %s

#CHECK: msfi	%r0, -2147483648        # encoding: [0xc2,0x01,0x80,0x00,0x00,0x00]
#CHECK: msfi	%r0, -1                 # encoding: [0xc2,0x01,0xff,0xff,0xff,0xff]
#CHECK: msfi	%r0, 0                  # encoding: [0xc2,0x01,0x00,0x00,0x00,0x00]
#CHECK: msfi	%r0, 1                  # encoding: [0xc2,0x01,0x00,0x00,0x00,0x01]
#CHECK: msfi	%r0, 2147483647         # encoding: [0xc2,0x01,0x7f,0xff,0xff,0xff]
#CHECK: msfi	%r15, 0                 # encoding: [0xc2,0xf1,0x00,0x00,0x00,0x00]

	msfi	%r0, -1 << 31
	msfi	%r0, -1
	msfi	%r0, 0
	msfi	%r0, 1
	msfi	%r0, (1 << 31) - 1
	msfi	%r15, 0