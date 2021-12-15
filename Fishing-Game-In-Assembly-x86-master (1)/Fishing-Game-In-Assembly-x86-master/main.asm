
INCLUDE Irvine32.inc
INCLUDE include.inc

; Next Level Sequence: 0, 10, 25, 50, 75, 100, 150, 200, 350, 500, 750, 900, 1250, 2500, 5000, 8000

.data
	;Player Stats
	Money DWORD 0
	Level DWORD 1
	Experience DWORD 0
	NextLevel DWORD 0, 10, 25, 50, 75, 100, 150, 200, 350, 500, 750, 900, 1250, 2500, 5000, 8000
	Bait DWORD 0
	CurrFishRodAddr DWORD ?
	CurrFishRodIdx DWORD 0
	Buff DWORD 0

	; Fishing Rods
	Shop_Prices DWORD 0, 10, 100, 250, 700, 1000, 3000, 0
	Wood_FR BYTE "Wooden Fishing Rod", 0
	Iron_FR BYTE "Iron Fishing Rod", 0
	Rein_FR BYTE "Reinforced Fishing Rod", 0
	Silver_FR BYTE "Silver Fishing Rod", 0
	Carbon_FR BYTE "Carbon Fiber Fishing Rod", 0
	Gold_FR BYTE "Golden Fishing Rod", 0

	; Menu Interfaces
	Main_Menu BYTE "==============================", 13, 10
		BYTE "	MAIN MENU		", 13, 10
		BYTE "==============================", 13, 10
		BYTE "1 - Go Fishing", 13, 10
		BYTE "2 - Shop", 13, 10
		BYTE "3 - Display Stats", 13, 10
		BYTE "4 - Exit Game", 13, 10, 0
	Shop_Menu BYTE "==============================", 13, 10
		BYTE "		Shop		", 13, 10
		BYTE "==============================", 13, 10
		BYTE "1 - Bait ($10) - One time use only, Power+1", 13, 10
		BYTE "2 - Iron Fishing Rod ($100) - Power+1", 13, 10
		BYTE "3 - Reinforced Fishing Rod ($250) - Power+2", 13, 10
		BYTE "4 - Silver Fishing Rod ($700) - Power+3", 13, 10
		BYTE "5 - Carbon Fiber Fishing Rod ($1000) - Power+4", 13, 10
		BYTE "6 - Golden Fishing Rod ($3000) - Power+5", 13, 10
		BYTE "7 - Exit Shop", 13, 10, 13, 10
		BYTE "You currently have $", 0
	Already_Bought BYTE "You already have ", 0
	Already_Bought2 BYTE " Equipped!", 13, 10, 13, 10, 0
	Insufficient_Fund BYTE "You do not have enough fund to buy this item!", 13, 10, 13, 10, 0
	Transaction_Successful BYTE "Transaction Successful! Have a nice day!", 13, 10, 13, 10, 0
	Exit_Shop BYTE "Bye! Hope to see you again~", 13, 10, 13, 10, 0
	
	Stats_1 BYTE "=================<Your Stats>=================", 13, 10
		BYTE "> Money: ", 0
	Stats_2 BYTE 13, 10, "> Level: ", 0
	Stats_3 BYTE 13, 10, "> Experience: ", 0
	Stats_4 BYTE 13, 10, "> Bait Remaining: ", 0
	Stats_5 BYTE 13, 10, "> Fishing Rod: ", 0
	Max_Str BYTE "MAX", 0

	Levelled_up BYTE "-----------------------------------------------------", 13, 10
		BYTE "===================CONGRATULATIONS===================", 13, 10
		BYTE "-----------------------------------------------------", 13, 10, 13, 10
		BYTE "You had leveled up! A new kind of fish is unlocked!", 13, 10
		BYTE "Continue the fishing spirit! >_<", 13, 10, 13, 10
		BYTE "Your level is now now: Lvl ", 0

.code
;-----------------------------------------------
displayStats PROC USES EAX EDX
;
;	Print the stats of the player
	MOV EDX, OFFSET Stats_1
	CALL WriteString
	MOV EAX, [Money]
	CALL WriteDec

	MOV EDX, OFFSET Stats_2
	CALL WriteString
	MOV EAX, [Level]
	CALL WriteDec

	MOV EDX, OFFSET Stats_3
	CALL WriteString
	MOV EAX, [Experience]
	CALL WriteDec
	MOV AL, '/'
	CALL WriteChar

	CMP Level, 15
	JL under_lvl_15
	MOV EDX, OFFSET Max_Str
	CALL WriteString
	JMP done_print_experience

under_lvl_15:
	MOV EDX, [Level]
	MOV EAX, [NextLevel + EDX * TYPE NextLevel]
	CALL WriteDec

done_print_experience:

	MOV EDX, OFFSET Stats_4
	CALL WriteString
	MOV EAX, [Bait]
	CALL WriteDec

	MOV EDX, OFFSET Stats_5
	CALL WriteString
	MOV EDX, CurrFishRodAddr
	CALL WriteString

	CALL Crlf
	CALL Crlf
	CALL WaitMsg

	RET
displayStats ENDP
;---------------------------------------------------


;--------------------------------------------------
displayMainMenu PROC
;
;======================================
;	Displays Main Menu
;======================================
displayMainMenu_l:
	CALL Clrscr
	
	MOV AX, yellow+(black*16)
	CALL SetTextColor

	MOV EDX, OFFSET Main_Menu	;Prompt input
	CALL WriteString

	INVOKE getUserChoice, 1, 4	;Obtain user choice

	CMP EAX, 1
	JE go_fishing_l			;Choice 1
	CMP EAX, 2
	JE visit_shop_l			;Choice 2
	CMP EAX, 3
	JE check_stats_l		;Choice 3
	RET						;Choice is 4. Exit game

;======================================
;		Fishing Procedure
;======================================
go_fishing_l:
	;	Generate random number for the catch
	CALL Randomize
	MOV EAX, Level
	CALL RandomRange
	INC EAX				;Since is [0 - N-1[, we increment to get level 1-N
	
	;	Check for bait that player had bought
	CMP [Bait], 0
	JE checked_bait_l	;Jump if player has no bait
	DEC Bait			;Player has a bait. Increase power level while decrement bait count
	INC Level

checked_bait_l:
	;	Check for fishing rod, which the buffed value is stored in BUFF
	ADD EAX, Buff

	;	Animation for fishing plays
	CALL showFishingAnimation	

	; Fishing Mechanism
	INVOKE FishingMechanism, EAX

	; Show the fish that are caught, or nothing if player fails
	INVOKE Fish_Show, EAX

	; EBX is the money gained and ECX is the experience gained. Add them
	ADD Money, EBX
	ADD Experience, ECX

	; Check if the  player leveled up!
	CMP [Level], 15
	JGE level_up_checked_l
	MOV EAX, [Level]
	MOV EDX, [NextLevel+EAX*TYPE NextLevel]
	CMP Experience, EDX
	JL level_up_checked_l					;No level up occur. Skip the section

	; Player levelled up!
	INC Level
	MOV Experience, 0

	CALL WaitMsg
	CALL Clrscr

	MOV AX, lightGreen+(black*16)
	CALL SetTextColor

	MOV EDX, OFFSET Levelled_up
	CALL WriteString
	MOV EAX, Level
	CALL WriteDec
	CALL Crlf
	CALL Crlf

	MOV AX, white+(black*16)
	CALL SetTextColor

level_up_checked_l:
	CALL WaitMsg
	JMP displayMainMenu_l


;======================================
;		Shopping Procedure
;======================================
visit_shop_l:
	CALL Clrscr
	
	MOV AX, lightCyan+(black*16)
	CALL SetTextColor

	;Display the shop menu
	MOV EDX, OFFSET Shop_Menu
	CALL WriteString
	MOV EAX, Money
	CALL WriteDec
	CALL Crlf
	CALL Crlf
	
visit_shop_input_l:
	;Obtain the user choice
	INVOKE getUserChoice, 1, 7

	;Check if the user chooses to buy the already equipped fishing rod
	CMP EAX, CurrFishRodIdx
	JNE visit_shop_checkedequipped_l
	
	;The one chosen by user is a already bought fishing rod!
	MOV EDX, OFFSET Already_Bought
	CALL WriteString
	MOV EDX, CurrFishRodAddr
	CALL WriteString
	MOV EDX, OFFSET Already_Bought2
	CALL WriteString
	JMP visit_shop_input_l
	
visit_shop_checkedequipped_l:
	;Check if the user has sufficient fund
	MOV EBX, [Shop_Prices+EAX*TYPE Shop_Prices]
	CMP EBX, Money
	JLE visit_shop_checkedfund_l

	;The user has insufficient fund!
	MOV EDX, OFFSET Insufficient_Fund
	CALL WriteString
	JMP visit_shop_input_l

visit_shop_checkedfund_l:
	;User has enough fund. Decrease the player's fund
	SUB Money, EBX

	;Evaluate user choice and make corresponding move.
	CMP EAX, 7
	JE exit_shop_l
	CMP EAX, 1
	JE shopping_c1
	CMP EAX, 2
	JE shopping_c2
	CMP EAX, 3
	JE shopping_c3
	CMP EAX, 4
	JE shopping_c4
	CMP EAX, 5
	JE shopping_c5
	CMP EAX, 6
	JE shopping_c6
shopping_c1:
	INC Bait
	JMP transaction_successful_l
shopping_c2:
	MOV Buff, 1
	MOV [CurrFishRodAddr], OFFSET Iron_FR
	MOV [CurrFishRodIdx], 2
	JMP transaction_successful_l
shopping_c3:
	MOV Buff, 2
	MOV [CurrFishRodAddr], OFFSET Rein_FR
	MOV [CurrFishRodIdx], 3
	JMP transaction_successful_l
shopping_c4:
	MOV Buff, 3
	MOV [CurrFishRodAddr], OFFSET Silver_FR
	MOV [CurrFishRodIdx], 4
	JMP transaction_successful_l
shopping_c5:
	MOV Buff, 4
	MOV [CurrFishRodAddr], OFFSET Carbon_FR
	MOV [CurrFishRodIdx], 5
	JMP transaction_successful_l
shopping_c6:
	MOV Buff, 5
	MOV [CurrFishRodAddr], OFFSET Gold_FR
	MOV [CurrFishRodIdx], 6

	;Transaction Successful. Print message and redirect back to main menu after that
transaction_successful_l:
	MOV AX, lightGreen+(black*16)
	CALL SetTextColor
	MOV EDX, OFFSET Transaction_Successful
	CALL WriteString
	MOV EAX, 1000
	CALL Delay

	JMP visit_shop_l

exit_shop_l:
	MOV AX, yellow+(black*16)
	CALL SetTextColor
	MOV EDX, OFFSET Exit_Shop
	CALL WriteString
	MOV EAX, 1000
	CALL Delay

	JMP displayMainMenu_l


;======================================
;		Checking Stats Procedure
;======================================
check_stats_l:
	CALL Clrscr
	CALL displayStats
	JMP displayMainMenu_l
displayMainMenu ENDP
;---------------------------------------------------



main PROC
	;Initialize Fishing Rod Equipped
	MOV CurrFishRodAddr, OFFSET Wood_FR

  ; Menu
	CALL displayMainMenu	

  exit
main ENDP

END main        ;specify the program's entry point