	global 	_start
	section .text
_start:
	mov edx, len
    	mov ecx, msg
    	mov ebx, 1
    	mov eax, 4
    	int 0x80

	mov eax, 3
	mov ebx, 2
	mov ecx, inp
	mov edx, inpb
	int 0x80 

	mov eax, 4
	mov ebx, 1
	mov ecx, inp
	mov edx, inpb
	int 0x80

    	mov eax, 1
	mov ebx, 77
    	int 0x80

	section .data
msg: 	db 'Hello hi', 0xa
len: 	equ $ - msg
num1: 	dd 0x97
inpb: 	equ 256
	section .bss
sum: resb 1
inp: resb inpb
