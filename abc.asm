	section .data
MsgA	db 	'enter A: ', 0xa, 0xd
MsgAL	equ $-MsgA
MsgB	db 	'enter B: ', 0xa, 0xd
MsgBL	equ $-MsgB
MsgC 	db 	'enter c: ', 0xa, 0xd
MsgCL	equ	$-MsgC
MsgAa	db 	'Its A', 0xa
MsgAaL	equ $-MsgAa
MsgBb	db 	'Its B', 0xa
MsgBbL	equ $-MsgBb
MsgCc	db 	'Its C', 0xa
MsgCcL	equ $-MsgCc
lenInp	equ 	12
	
	section .bss
A:	resb 	lenInp
B:	resb 	lenInp
C:	resb 	lenInp	

global	_start
	section	.text
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, MsgA
	mov edx, MsgAL
	int 0x80
	
	mov	eax, 3
	mov	ebx, 2
	mov ecx, A
	mov edx, lenInp
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, MsgB
	mov edx, MsgBL
	int 0x80
	
	mov	eax, 3
	mov	ebx, 2
	mov ecx, B
	mov edx, lenInp
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, MsgC
	mov edx, MsgCL
	int 0x80
	
	mov	eax, 3
	mov	ebx, 2
	mov ecx, C
	mov edx, lenInp
	int 0x80

	mov eax, [A] 
	cmp eax, [B]
	jg acc
	jl bcc
	jmp end
acc:
	cmp eax, [C]
	jg a
bcc:
	mov eax, [B]
	cmp eax, [C]
	jg b
ccc:
	jmp c

end:
	mov eax, 1
	mov ebx, 0
	int 0x80
	
a:
	mov eax, 4
	mov ebx, 1
	mov ecx, MsgAa
	mov edx, MsgAaL
	int 0x80
	jmp end

b:
	mov eax, 4
	mov ebx, 1
	mov ecx, MsgBb
	mov edx, MsgBbL
	int 0x80
	jmp end

c:
	mov eax, 4
	mov ebx, 1
	mov ecx, MsgCc
	mov edx, MsgCcL
	int 0x80
	jmp end