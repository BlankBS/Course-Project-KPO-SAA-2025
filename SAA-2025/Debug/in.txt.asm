.586
	.model flat, stdcall
	includelib libucrt.lib
	includelib kernel32.lib
	includelib ../Debug/SAA-2025LIB.lib
	ExitProcess PROTO :DWORD


	CurrentDate PROTO
	CurrentTime PROTO
outputubyte PROTO :BYTE
outputchar PROTO :BYTE
outputstr PROTO :DWORD

outputbool PROTO :BYTE

.stack 4096
.const
divideOnZeroExeption BYTE "Trying devide on zero", 0 
	CalculateFac_$LEX1 BYTE 1 ;UBYTE
	main$LEX4 BYTE "------", 0  ;STR
	main$LEX5 BYTE "Factorial:", 0  ;STR
	main$LEX6 BYTE 3 ;UBYTE
	main$LEX7 BYTE 4 ;UBYTE
	main$LEX8 BYTE "!3 + !4", 0  ;STR
	main$LEX9 BYTE 1 ;BOOL
	main$LEX11 BYTE "bitwise operations in condition:", 0  ;STR
	main$LEX12 BYTE 66 ;UBYTE
	main$LEX13 BYTE 11 ;UBYTE
	main$LEX14 BYTE 72 ;UBYTE
	main$LEX15 BYTE 80 ;UBYTE
	main$LEX16 BYTE 2 ;UBYTE
	main$LEX18 BYTE "((66 | 11) + 72) & 80 : (2 - 1) = ", 0  ;STR
	main$LEX20 BYTE "Char operations:", 0  ;STR
	main$LEX21 BYTE 'Z' ;CHR
	main$LEX22 BYTE 'z' ;CHR
	main$LEX23 BYTE "'Z' - 'z':", 0  ;STR
	main$LEX24 BYTE 'a' ;CHR
	main$LEX25 BYTE 'b' ;CHR
	main$LEX26 BYTE "'a' + 'b':", 0  ;STR
	main$LEX27 BYTE 0 ;BOOL
	main$LEX28 BYTE 'A' ;CHR
	main$LEX29 BYTE 'B' ;CHR
	main$LEX30 BYTE "'A' + 'B':", 0  ;STR
	main$LEX32 BYTE "date:", 0  ;STR
	main$LEX33 BYTE "time:", 0  ;STR
	main$LEX34 BYTE 0 ;UBYTE
.data
	CalculateFac_result BYTE 0 ;UBYTE
	mainresult BYTE 0 ;UBYTE
	mainbValue BYTE 0 ;BOOL
	mainc BYTE 0 ;CHR
	maindateNow DWORD 0 ;STR
	maintimeNow DWORD 0 ;STR

.code
$CalculateFac PROC uses ebx ecx edi esi ,	CalculateFac_number: BYTE 
; String #4 :ivl
movzx eax, CalculateFac_$LEX1
push eax 
pop eax
mov CalculateFac_result, al

DoWhile17Start: 

; String #7 :iviiv
movzx eax, CalculateFac_result
push eax 
movzx eax, CalculateFac_number
push eax 
pop ebx
pop eax
mul ebx
push eax
pop eax
mov CalculateFac_result, al

; String #8 :ivilv
movzx eax, CalculateFac_number
push eax 
movzx eax, CalculateFac_$LEX1
push eax 
pop ebx
pop eax
sub eax, ebx
push eax
pop eax
mov CalculateFac_number, al
push eax
movzx eax, CalculateFac_number
push eax
CALL outputubyte
pop eax

movzx eax, CalculateFac_number
movzx ebx, CalculateFac_$LEX1
cmp eax, ebx
ja DoWhile17Start
DoWhile17End: 

movzx eax, CalculateFac_result
ret
$CalculateFac ENDP

main PROC

push offset main$LEX4
CALL outputstr

push offset main$LEX5
CALL outputstr

; String #18 :ivil@1il@1v
invoke $CalculateFac, main$LEX6
push eax ;результат функции
invoke $CalculateFac, main$LEX7
push eax ;результат функции
pop ebx
pop eax
add eax, ebx 
push eax
pop eax
mov mainresult, al

push offset main$LEX8
CALL outputstr
push eax
movzx eax, mainresult
push eax
CALL outputubyte
pop eax


; String #23 :ivl
movzx eax, main$LEX9
push eax 
pop eax
mov mainbValue, al

If85Start: 
movzx eax, mainbValue
mov ebx, 1
cmp eax, ebx
jnz If85End

push offset main$LEX4
CALL outputstr

push offset main$LEX11
CALL outputstr

; String #28 :ivllvlvlvllvv######
movzx eax, main$LEX12
push eax 
movzx eax, main$LEX13
push eax 
pop ebx
pop eax
or eax, ebx 
push eax
movzx eax, main$LEX14
push eax 
pop ebx
pop eax
add eax, ebx 
push eax
movzx eax, main$LEX15
push eax 
pop ebx
pop eax
and eax, ebx 
push eax
movzx eax, main$LEX16
push eax 
movzx eax, CalculateFac_$LEX1
push eax 
pop ebx
pop eax
sub eax, ebx
push eax
pop ebx
pop eax
push edx ; сохраняем данные регистра edx
mov edx, 0
TEST  EBX, EBX
JZ    div_by_0
div ebx
pop edx
push eax
pop eax
mov mainresult, al

push offset main$LEX18
CALL outputstr
push eax
movzx eax, mainresult
push eax
CALL outputubyte
pop eax

If85End: 

push offset main$LEX4
CALL outputstr

push offset main$LEX20
CALL outputstr

; String #36 :ivllv
movzx eax, main$LEX21
push eax 
movzx eax, main$LEX22
push eax 
pop ebx
pop eax
sub eax, ebx
push eax
pop eax
mov mainc, al

push offset main$LEX23
CALL outputstr
push eax
movzx eax, mainc
push eax
CALL outputchar
pop eax


; String #39 :ivllv
movzx eax, main$LEX24
push eax 
movzx eax, main$LEX25
push eax 
pop ebx
pop eax
add eax, ebx 
push eax
pop eax
mov mainc, al

push offset main$LEX26
CALL outputstr
push eax
movzx eax, mainc
push eax
CALL outputchar
pop eax


; String #42 :ivl
movzx eax, main$LEX27
push eax 
pop eax
mov mainbValue, al

If162Start: 
movzx eax, mainbValue
mov ebx, 1
cmp eax, ebx
jnz If162End

; String #45 :ivllv
movzx eax, main$LEX28
push eax 
movzx eax, main$LEX29
push eax 
pop ebx
pop eax
add eax, ebx 
push eax
pop eax
mov mainc, al

push offset main$LEX30
CALL outputstr
push eax
movzx eax, mainc
push eax
CALL outputchar
pop eax

If162End: 

push offset main$LEX4
CALL outputstr

; String #55 :ivi@0
invoke CurrentDate
push eax ;результат функции
pop maindateNow

; String #56 :ivi@0
invoke CurrentTime
push eax ;результат функции
pop maintimeNow

push offset main$LEX32
CALL outputstr

push maindateNow
CALL outputstr

push offset main$LEX33
CALL outputstr

push maintimeNow
CALL outputstr

movzx eax, main$LEX34
	jmp endPoint
	div_by_0:
	push offset divideOnZeroExeption
CALL outputstr
endPoint:
	invoke		ExitProcess, eax
main ENDP
end main