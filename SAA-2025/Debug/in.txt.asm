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
	main$LEX5 BYTE "while:", 0  ;STR
	main$LEX6 BYTE 10 ;UBYTE
	main$LEX7 BYTE 0 ;UBYTE
	main$LEX10 BYTE "Factorial:", 0  ;STR
	main$LEX11 BYTE 3 ;UBYTE
	main$LEX12 BYTE 4 ;UBYTE
	main$LEX13 BYTE "!3 + !4", 0  ;STR
	main$LEX14 BYTE 1 ;BOOL
	main$LEX16 BYTE "bitwise operations in condition:", 0  ;STR
	main$LEX17 BYTE 66 ;UBYTE
	main$LEX18 BYTE 11 ;UBYTE
	main$LEX19 BYTE 72 ;UBYTE
	main$LEX20 BYTE 80 ;UBYTE
	main$LEX21 BYTE 2 ;UBYTE
	main$LEX23 BYTE "((66 | 11) + 72) & 80 : (2 - 1) = ", 0  ;STR
	main$LEX25 BYTE "Char operations:", 0  ;STR
	main$LEX26 BYTE 'Z' ;CHR
	main$LEX27 BYTE 'z' ;CHR
	main$LEX28 BYTE "'Z' - 'z':", 0  ;STR
	main$LEX29 BYTE 'a' ;CHR
	main$LEX30 BYTE 'b' ;CHR
	main$LEX31 BYTE "'a' + 'b':", 0  ;STR
	main$LEX32 BYTE 0 ;BOOL
	main$LEX33 BYTE 'A' ;CHR
	main$LEX34 BYTE 'B' ;CHR
	main$LEX35 BYTE "'A' + 'B':", 0  ;STR
	main$LEX37 BYTE "date:", 0  ;STR
	main$LEX38 BYTE "time:", 0  ;STR
	main$LEX39 BYTE 0 ;UBYTE
.data
	CalculateFac_result BYTE 0 ;UBYTE
	maina BYTE 0 ;UBYTE
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

; String #18 :ivl
movzx eax, main$LEX6
push eax 
pop eax
mov maina, al

While63Start: 
movzx eax, maina
movzx ebx, main$LEX7
cmp eax, ebx
jbe While63End
push eax
movzx eax, maina
push eax
CALL outputubyte
pop eax


; String #22 :ivilv
movzx eax, maina
push eax 
movzx eax, CalculateFac_$LEX1
push eax 
pop ebx
pop eax
sub eax, ebx
push eax
pop eax
mov maina, al
jmp While63Start
While63End: 

push offset main$LEX4
CALL outputstr

push offset main$LEX10
CALL outputstr

; String #28 :ivil@1il@1v
invoke $CalculateFac, main$LEX11
push eax ;результат функции
invoke $CalculateFac, main$LEX12
push eax ;результат функции
pop ebx
pop eax
add eax, ebx 
push eax
pop eax
mov mainresult, al

push offset main$LEX13
CALL outputstr
push eax
movzx eax, mainresult
push eax
CALL outputubyte
pop eax


; String #33 :ivl
movzx eax, main$LEX14
push eax 
pop eax
mov mainbValue, al

If117Start: 
movzx eax, mainbValue
mov ebx, 1
cmp eax, ebx
jnz If117End

push offset main$LEX4
CALL outputstr

push offset main$LEX16
CALL outputstr

; String #38 :ivllvlvlvllvv######
movzx eax, main$LEX17
push eax 
movzx eax, main$LEX18
push eax 
pop ebx
pop eax
or eax, ebx 
push eax
movzx eax, main$LEX19
push eax 
pop ebx
pop eax
add eax, ebx 
push eax
movzx eax, main$LEX20
push eax 
pop ebx
pop eax
and eax, ebx 
push eax
movzx eax, main$LEX21
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

push offset main$LEX23
CALL outputstr
push eax
movzx eax, mainresult
push eax
CALL outputubyte
pop eax

If117End: 

push offset main$LEX4
CALL outputstr

push offset main$LEX25
CALL outputstr

; String #46 :ivllv
movzx eax, main$LEX26
push eax 
movzx eax, main$LEX27
push eax 
pop ebx
pop eax
sub eax, ebx
push eax
pop eax
mov mainc, al

push offset main$LEX28
CALL outputstr
push eax
movzx eax, mainc
push eax
CALL outputchar
pop eax


; String #49 :ivllv
movzx eax, main$LEX29
push eax 
movzx eax, main$LEX30
push eax 
pop ebx
pop eax
add eax, ebx 
push eax
pop eax
mov mainc, al

push offset main$LEX31
CALL outputstr
push eax
movzx eax, mainc
push eax
CALL outputchar
pop eax


; String #52 :ivl
movzx eax, main$LEX32
push eax 
pop eax
mov mainbValue, al

If194Start: 
movzx eax, mainbValue
mov ebx, 1
cmp eax, ebx
jnz If194End

; String #55 :ivllv
movzx eax, main$LEX33
push eax 
movzx eax, main$LEX34
push eax 
pop ebx
pop eax
add eax, ebx 
push eax
pop eax
mov mainc, al

push offset main$LEX35
CALL outputstr
push eax
movzx eax, mainc
push eax
CALL outputchar
pop eax

If194End: 

push offset main$LEX4
CALL outputstr

; String #65 :ivi@0
invoke CurrentDate
push eax ;результат функции
pop maindateNow

; String #66 :ivi@0
invoke CurrentTime
push eax ;результат функции
pop maintimeNow

push offset main$LEX37
CALL outputstr

push maindateNow
CALL outputstr

push offset main$LEX38
CALL outputstr

push maintimeNow
CALL outputstr

movzx eax, main$LEX39
	jmp endPoint
	div_by_0:
	push offset divideOnZeroExeption
CALL outputstr
endPoint:
	invoke		ExitProcess, eax
main ENDP
end main