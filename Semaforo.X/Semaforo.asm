#include "p16F628a.inc"
__CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF

RES_VECT CODE 0x0000 ; processor reset vector
GOTO START ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE ; let linker place main program
 
i equ 0x30
j equ 0x31
k equ 0x32
l equ 0x33
m equ 0x34

START
 
    MOVLW 0x07
    MOVWF CMCON
    BCF STATUS, RP1
    BSF STATUS, RP0
    MOVLW b'00000000'
    MOVWF TRISB
    BCF STATUS, RP0
    
inicio:
	MOVLW b'00100001'
	MOVWF PORTB
	CALL tmp5
	MOVLW b'00100010'
	MOVWF PORTB
	CALL tmp1
	nop
	nop
	MOVLW b'00001100'
	MOVWF PORTB
	CALL tmp5
	MOVLW b'00010100'
	MOVWF PORTB
	CALL tmp1
	GOTO inicio
	
tmp1:	MOVLW d'2'
	MOVWF l
	CALL tmp
	DECFSZ l
	GOTO $-2
	nop
	RETURN
    
tmp5:	MOVLW d'10'
	MOVWF m
	nop
	nop
	nop
	nop
	CALL tmp
	DECFSZ m
	GOTO $-6
	nop
	nop
	nop
	RETURN
    
tmp:	MOVLW d'54'
	MOVWF i
loopj:	MOVLW d'50'
	MOVWF j
loopk:  MOVLW d'60'
	MOVWF k
	nop
	DECFSZ k
	GOTO $-1
	DECFSZ j
	GOTO loopk
	nop
	nop
	nop
	nop
	nop
	DECFSZ i
	GOTO loopj
	nop
	return
END
    