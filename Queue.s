 AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		 

		MOV R1, #0x20000000 ; R1 represents the head of the queue
		MOV R2, #0x20000000 ; R2 represents the tail of the queue
		MOV R3, #12			; size of the queue
		MOV R4, #14 		; random value
		MOV R5, #0xFF 		; number to be stored in memory when dequeued
							; R6 shows the values that are dequeued
							
		
INSERT1	CMP R3, #0			; Inserting the data into queue
		STR R4, [R2]		; Storing random value in memory pointed by tail
		ADD R2, #0x4 		; Increasing tail pointer
		EOR R4, #7 			; Random number generation using exor
		SUBGT R3, R3, #1
		BGT INSERT1
		
		MOV R3, #4
DEQUEUE	CMP R3, #0			; Dequeueing
		LDR R6, [R1]
		STR R5, [R1]
		ADD R1, #0x4 		; Increasing head pointer
		SUBGT R3, R3, #1
		BGT DEQUEUE
		
		MOV R2, #0x20000000
		MOV R3, #4
INSERT2	CMP R3, #0			; Inserting data into queue
		STR R4, [R2]		; Storing random value in memory pointed by tail
		ADD R2, #0x4		; Increasing tail pointer
		EOR R4, #7 			; Random number generation using exor
		SUBGT R3, R3, #1
		BGT INSERT2
		
		MOV R1, #0x20000000
		MOV R3, #12
EMPTY	CMP R3, #0			; Empty queue
		LDR R6, [R1]
		STR R5, [R1]
		ADD R1, #0x4 		; increasing head pointer
		SUBGT R3, R3, #1
		BGT EMPTY
stop B stop ; stop program
     ENDFUNC
     END
