.586
	.model flat, stdcall
	includelib libucrt.lib
	includelib kernel32.lib
	includelib ../Debug/SAA-2025LIB.lib
	ExitProcess PROTO :DWORD


	GetDate PROTO
	GetTime PROTO
outputubyte PROTO :BYTE
outputchar PROTO :BYTE
outputstr PROTO :DWORD

outputbool PROTO :BYTE

.stack 4096
.const
divideOnZeroExeption BYTE "������� ������� �� ����.", 0  ;STR, ��� ������ ������ ��� ������� �� ����
	FindFactor_$LEX1 BYTE 1 ;UBYTE
	main$LEX4 BYTE 'Z' ;CHR
	main$LEX5 BYTE ' ' ;CHR
	main$LEX6 BYTE "'Z' - ' '(space)", 0  ;STR
	main$LEX7 BYTE 'A' ;CHR
	main$LEX8 BYTE '	' ;CHR
	main$LEX9 BYTE "'A' + '	'(tabulation)", 0  ;STR
	main$LEX10 BYTE 2 ;UBYTE
	main$LEX11 BYTE 4 ;UBYTE
	main$LEX12 BYTE "!2 + !5", 0  ;STR
	main$LEX13 BYTE 3 ;UBYTE
	main$LEX14 BYTE 240 ;UBYTE
	main$LEX15 BYTE 15 ;UBYTE
	main$LEX16 BYTE 127 ;UBYTE
	main$LEX17 BYTE 8 ;UBYTE
	main$LEX20 BYTE "~(240 | 15) + (127 & 8) : 3 = ", 0  ;STR
	main$LEX21 BYTE "condition that will not work", 0  ;STR
	main$LEX22 BYTE 1 ;BOOL
	main$LEX23 BYTE "condition that will work", 0  ;STR
	main$LEX24 BYTE 0 ;UBYTE
.data
	FindFactor_answer BYTE 0 ;UBYTE
	maindate DWORD 0 ;STR
	maintime DWORD 0 ;STR
	mainch BYTE 0 ;CHR
	mainresult BYTE 0 ;UBYTE
	mainfirst BYTE 0 ;UBYTE
	mainsecond BYTE 0 ;UBYTE
	maina BYTE 0 ;UBYTE
	mainbc BYTE 0 ;BOOL

.code
$FindFactor PROC uses ebx ecx edi esi ,	FindFactor_a: BYTE 
; String #4 :ivl
movzx eax, FindFactor_$LEX1
push eax 
pop eax
mov FindFactor_answer, al

DoWhile17Start: 

; String #7 :iviiv
movzx eax, FindFactor_answer
push eax 
movzx eax, FindFactor_a
push eax 
pop ebx
pop eax
mul ebx
push eax
pop eax
mov FindFactor_answer, al

; String #8 :ivilv
movzx eax, FindFactor_a
push eax 
movzx eax, FindFactor_$LEX1
push eax 
pop ebx
pop eax
sub eax, ebx
push eax
pop eax
mov FindFactor_a, al
push eax
movzx eax, FindFactor_a
push eax
CALL outputubyte
pop eax

movzx eax, FindFactor_a
movzx ebx, FindFactor_$LEX1
cmp eax, ebx
ja DoWhile17Start
DoWhile17End: 

movzx eax, FindFactor_answer
ret
$FindFactor ENDP

main PROC

; String #19 :ivi@0
invoke GetDate
push eax ;��������� �������
pop maindate

; String #20 :ivi@0
invoke GetTime
push eax ;��������� �������
pop maintime

push maindate
CALL outputstr

push maintime
CALL outputstr

; String #24 :ivllv
movzx eax, main$LEX4
push eax 
movzx eax, main$LEX5
push eax 
pop ebx
pop eax
sub eax, ebx
push eax
pop eax
mov mainch, al

push offset main$LEX6
CALL outputstr
push eax
movzx eax, mainch
push eax
CALL outputchar
pop eax


; String #27 :ivllv
movzx eax, main$LEX7
push eax 
movzx eax, main$LEX8
push eax 
pop ebx
pop eax
add eax, ebx 
push eax
pop eax
mov mainch, al

push offset main$LEX9
CALL outputstr
push eax
movzx eax, mainch
push eax
CALL outputchar
pop eax


; String #33 :ivl
movzx eax, main$LEX10
push eax 
pop eax
mov mainfirst, al

; String #34 :ivl
movzx eax, main$LEX11
push eax 
pop eax
mov mainsecond, al

; String #35 :ivii@1ii@1v
invoke $FindFactor, mainfirst
push eax ;��������� �������
invoke $FindFactor, mainsecond
push eax ;��������� �������
pop ebx
pop eax
add eax, ebx 
push eax
pop eax
mov mainresult, al

push offset main$LEX12
CALL outputstr
push eax
movzx eax, mainresult
push eax
CALL outputubyte
pop eax


; String #39 :ivl
movzx eax, main$LEX13
push eax 
pop eax
mov maina, al

; String #40 :ivllvvllvllvvv######
movzx eax, main$LEX14
push eax 
movzx eax, main$LEX15
push eax 
pop ebx
pop eax
or eax, ebx 
push eax
pop eax
not eax 
push eax
movzx eax, main$LEX16
push eax 
movzx eax, main$LEX17
push eax 
pop ebx
pop eax
and eax, ebx 
push eax
movzx eax, main$LEX10
push eax 
movzx eax, FindFactor_$LEX1
push eax 
pop ebx
pop eax
sub eax, ebx
push eax
pop ebx
pop eax
push edx ; ��������� ������ �������� edx
mov edx, 0
TEST  EBX, EBX
JZ    div_by_0
div ebx
pop edx
push eax
pop ebx
pop eax
add eax, ebx 
push eax
pop eax
mov mainresult, al

push offset main$LEX20
CALL outputstr
push eax
movzx eax, mainresult
push eax
CALL outputubyte
pop eax


If194Start: 
movzx eax, mainbc
mov ebx, 1
cmp eax, ebx
jnz If194End

push offset main$LEX21
CALL outputstr
If194End: 

; String #48 :ivl
movzx eax, main$LEX22
push eax 
pop eax
mov mainbc, al

If208Start: 
movzx eax, mainbc
mov ebx, 1
cmp eax, ebx
jnz If208End

push offset main$LEX23
CALL outputstr
If208End: 

movzx eax, main$LEX24
	jmp endPoint
	div_by_0:
	push offset divideOnZeroExeption
CALL outputstr
endPoint:
	invoke		ExitProcess, eax
main ENDP
end main