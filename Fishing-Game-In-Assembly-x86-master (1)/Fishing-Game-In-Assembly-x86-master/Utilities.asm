
TITLE Utilities

INCLUDE Irvine32.inc

.data
	Prompt_Choice BYTE "Enter your choice: ", 0
	Invalid_Input BYTE "Invalid choice. Enter Again: ", 0

	Fishing_Frame1 BYTE "          @@@#                                                          &@ %   / @.                   ", 13, 10
		BYTE "        @@    (@@#                                                    (@%          @@(                ", 13, 10
		BYTE "      @@           (@@@                                             #@@              *@@              ", 13, 10
		BYTE "    @@                *@@@@#                                      #@(                   #@@           ", 13, 10
		BYTE "  &@                    @@  @%             .@@.@@               (@. @@                   @@/@@        ", 13, 10
		BYTE " @#@@.               %@@.      *@@@@%    @@     &,@&          #@.   @&                   *@@( @@(     ", 13, 10
		BYTE "   @@               #@#               @@@@@         @@@@@@. @@      .@@@@@@                 #@@  @@   ", 13, 10
		BYTE "   /@@@               @@                         .@@@          %                            @@@    .@ ", 13, 10
		BYTE "                                               %@&@#@(                                     @,         ", 13, 10
		BYTE "                                             @@@@(   @@@@@                                            ", 13, 10
		BYTE "                                           @@@@       .&%                                             ", 13, 10
		BYTE "                                         @&@@@                                                        ", 13, 10
		BYTE "                                      .@%@@                                                           ", 13, 10
		BYTE "                                    ,@%@@                                                             ", 13, 10
		BYTE "                                  *@#@&                                                               ", 13, 10
		BYTE "                                &@#@%   @                                            .& .             ", 13, 10
		BYTE "                              &@&@%        ..,/(&@@@@@#,             .,,,,,,,,,,@@@&  .               ", 13, 10
		BYTE "                            &@%@&/.                        ,%@@@             (@,,,#@@@@@@@@@@@@@@@@@@ ", 13, 10
		BYTE "     *//,*##.*@@@@@#(/    @@@@&                                                                       ", 13, 10
		BYTE " @@@@@@@@.              @@%&@@@                                                                       ", 13, 10
		BYTE "                     .@@&@@%*% @/         %%%%.                        @@@@@@@@@@@@@@@@@(             ", 13, 10
		BYTE "                    @%,@&.@%@*%@                                                                      ", 13, 10
		BYTE "                  @#,@@  @@&@@@/                                                                      ", 13, 10
		BYTE "               *@(.@@.     .                                                                          ", 13, 10
		BYTE "             (@&,@@                            .@@@@@@@@@@@@@@                                        ", 13, 10
		BYTE "              @@@                                                                                     ", 13, 10, 0
	Fishing_Frame2 BYTE "          @@@#                                                          &@ %   / @.                   ", 13, 10
		BYTE "        @@    (@@#                                                    (@%          @@(                ", 13, 10
		BYTE "      @@           (@@@                                             #@@              *@@              ", 13, 10
		BYTE "    @@                *@@@@#                                      #@(                   #@@           ", 13, 10
		BYTE "  &@                    @@  @%             .@@.@@               (@. @@                   @@/@@        ", 13, 10
		BYTE " @#@@.               %@@.      *@@@@%    @@     &,@&          #@.   @&                   *@@( @@(     ", 13, 10
		BYTE "   @@               #@#               @@@@@         @@@@@@. @@      .@@@@@@                 #@@  @@   ", 13, 10
		BYTE "   /@@@               @@                                       %                            @@@    .@ ", 13, 10
		BYTE "                                                    @@@,                                   @,         ", 13, 10
		BYTE "                                                 @@@@@@@                                              ", 13, 10
		BYTE "                                              @@%@@/   @@                                             ", 13, 10
		BYTE "                                           &@%@@      .@@                                             ", 13, 10
		BYTE "                                         @&@@,,       (@%                                             ", 13, 10
		BYTE "                                      @@#@#            *@&                                            ", 13, 10
		BYTE "                                   &@%@@                 @@@@@.                                       ", 13, 10
		BYTE "                                #@@&@,  @                .@@@@@                      .& .             ", 13, 10
		BYTE "                              @@&@@        ..,/(&@@@@@#,    .        .,,,,,,,,,,@@@&  .               ", 13, 10
		BYTE "                           &@&@@*/.                        ,%@@@             (@,,,#@@@@@@@@@@@@@@@@@@ ", 13, 10
		BYTE "     *//,*##.*@@@@@#(/  %@&@@@                                                                        ", 13, 10
		BYTE " @@@@@@@@.           .@@@/&@@@                                                                        ", 13, 10
		BYTE "                   @@,#@@@%/@.@,          %%%%.                        @@@@@@@@@@@@@@@@@(             ", 13, 10
		BYTE "                #@#.@@. @%%&%@@                                                                       ", 13, 10
		BYTE "             .@@.*@%   *@%@@@.                                                                        ", 13, 10
		BYTE "           @@%.@@                                                                                     ", 13, 10
		BYTE "           @@@                                 .@@@@@@@@@@@@@@                                        ", 13, 10
		BYTE "                                                                                                      ", 13, 10, 0
	Fishing_Frame3 BYTE "          @@@#                                                          &@ %   / @.                   ", 13, 10
		BYTE "        @@    (@@#                                                    (@%          @@(                ", 13, 10
		BYTE "      @@           (@@@                                             #@@              *@@              ", 13, 10
		BYTE "    @@                *@@@@#                                      #@(                   #@@           ", 13, 10
		BYTE "  &@                    @@  @%             .@@.@@               (@. @@                   @@/@@        ", 13, 10
		BYTE " @#@@.               %@@.      *@@@@%    @@     &,@&          #@.   @&                   *@@( @@(     ", 13, 10
		BYTE "   @@               #@#               @@@@@         @@@@@@. @@      .@@@@@@                 #@@  @@   ", 13, 10
		BYTE "   /@@@               @@                                       %                            @@@    .@ ", 13, 10
		BYTE "                                                    @@@,                                   @,         ", 13, 10
		BYTE "                                                 @@@@# @@                                             ", 13, 10
		BYTE "                                              @@%@@/   @@                                             ", 13, 10
		BYTE "                                           &@%@@      .@%                                             ", 13, 10
		BYTE "                                         @&@@,,       @@                                              ", 13, 10
		BYTE "                                      @@#@#          @@                                               ", 13, 10
		BYTE "                                   &@%@@             @@                                               ", 13, 10
		BYTE "                                #@@&@,  @            *@@/                            .& .             ", 13, 10
		BYTE "                              @@&@@        ..,/(&@@@@@#@@            .,,,,,,,,,,@@@&  .               ", 13, 10
		BYTE "                           &@&@@*/.                    @@  ,%@@@             (@,,,#@@@@@@@@@@@@@@@@@@ ", 13, 10
		BYTE "     *//,*##.*@@@@@#(/  %@&@@@                         @@   .,                                        ", 13, 10
		BYTE " @@@@@@@@.           .@@@/&@@@                          @@  @@@@@@ .,                                 ", 13, 10
		BYTE "                   @@,#@@@%/@.@,          %%%%.      @@   @@@@@ %@@@(  @@@@@@@@@@@@@@@@@(             ", 13, 10
		BYTE "                #@#.@@. @%%&%@@                @@@@@@@@@@ @@@@@  @@@@@@@@                             ", 13, 10
		BYTE "             .@@.*@%   *@%@@@.                   (@@@@@% ,        &@@  .,                             ", 13, 10
		BYTE "           @@%.@@                                       ,@@@@@@@(                                     ", 13, 10
		BYTE "           @@@                                 .@@@@@@@@@@@@@@ *.                                     ", 13, 10
		BYTE "                                                                                                      ", 13, 10, 0
	Fishing_Frame4 BYTE "          @@@#                                                          &@ %   / @.                   ", 13, 10
		BYTE "        @@    (@@#                                                    (@%          @@(                ", 13, 10
		BYTE "      @@           (@@@                                             #@@              *@@              ", 13, 10
		BYTE "    @@                *@@@@#                                      #@(                   #@@           ", 13, 10
		BYTE "  &@                    @@  @%             .@@.@@               (@. @@                   @@/@@        ", 13, 10
		BYTE " @#@@.               %@@.      *@@@@%    @@     &,@&          #@.   @&                   *@@( @@(     ", 13, 10
		BYTE "   @@               #@#               @@@@@         @@@@@@. @@      .@@@@@@                 #@@  @@   ", 13, 10
		BYTE "   /@@@               @@                                       %                            @@@    .@ ", 13, 10
		BYTE "                                                    @@@,                                   @,         ", 13, 10
		BYTE "                                                 @@@@#@@                                              ", 13, 10
		BYTE "                                              @@%@@/   @@                                             ", 13, 10
		BYTE "                                           &@%@@       ,@(                                            ", 13, 10
		BYTE "                                         @&@@,,         @&                                            ", 13, 10
		BYTE "                                      @@#@#             @&                                            ", 13, 10
		BYTE "                                   &@%@@                @@                                            ", 13, 10
		BYTE "                                #@@&@,  @             .(@@@                          .& .             ", 13, 10
		BYTE "                              @@&@@        ..,/(&@@@@@@&@@           .,,,,,,,,,,@@@&  .               ", 13, 10
		BYTE "                           &@&@@*/.                 @@@&@@ ,%@@@             (@,,,#@@@@@@@@@@@@@@@@@@ ", 13, 10
		BYTE "     *//,*##.*@@@@@#(/  %@&@@@                          @@                                            ", 13, 10
		BYTE " @@@@@@@@.           .@@@/&@@@                          @@                                            ", 13, 10
		BYTE "                   @@,#@@@%/@.@,                        @@             @@@@@@@@@@@@@@@@@(             ", 13, 10
		BYTE "                #@#.@@. @%%&%@@                  /(     @@@@.                                         ", 13, 10
		BYTE "             .@@.*@%   *@%@@@.                  /@*  @@@&.     (@@                                    ", 13, 10
		BYTE "           @@%.@@                                         (&@&,                                       ", 13, 10
		BYTE "           @@@                                                                                        ", 13, 10
		BYTE "                                                                                                      ", 13, 10, 0
.code


;---------------------------------------------
getUserChoice PROC USES EDX,
	lowerRange:DWORD,
	upperRange:DWORD
; Receives: lowerRange (DWORD) - Lower range of the choice. Inclusive
;			upperRange (DWORD) - Upper range of the choice. Inclusive
; Returns:  EAX - User choice

	; Prompt
	MOV EDX, OFFSET Prompt_Choice
	CALL WriteString

	; Input
getUserChoice_input:
	CALL ReadInt

	; Validation
	CMP EAX, lowerRange
	JL getUserChoice_invalid
	CMP EAX, upperRange
	JG getUserChoice_invalid

	RET

getUserChoice_invalid:
	MOV EDX, OFFSET Invalid_Input
	CALL WriteString
	JMP getUserChoice_input
getUserChoice ENDP
;---------------------------------------------


;---------------------------------------------
getMin PROC,
	v1:DWORD,
	v2:DWORD
;
;	Receives: v1 - First value
;			  v2 - Second value
;	Returns:  EAX - minimum of the two
	MOV EAX, v1
	CMP EAX, v2
	JLE getMin_done_l
	MOV EAX, v2
getMin_done_l:
	RET
getMin ENDP



;---------------------------------------------
showFishingAnimation PROC USES EAX EDX
;
; Simply prints frames of fishing.
	CALL Clrscr
	MOV AX, yellow+(black*16)
	CALL SetTextColor

	MOV EDX, OFFSET Fishing_Frame1
	CALL WriteString
	MOV EAX, 300
	CALL Delay

	MOV DX, 0000h
	CALL Gotoxy
	MOV EDX, OFFSET Fishing_Frame2
	CALL WriteString
	MOV EAX, 300
	CALL Delay

	MOV DX, 0000h
	CALL Gotoxy
	MOV EDX, OFFSET Fishing_Frame3
	CALL WriteString
	MOV EAX, 300
	CALL Delay

	MOV DX, 0000h
	CALL Gotoxy
	MOV EDX, OFFSET Fishing_Frame4
	CALL WriteString
	MOV EAX, 300
	CALL Delay
	
	MOV AX, white+(black*16)
	CALL SetTextColor
	CALL Clrscr

	RET
showFishingAnimation ENDP
;---------------------------------------------

END