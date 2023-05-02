^+t:: 									; Ctrl + Shift + T
Old_Clipboard := Clipboard 						; copy old clipboard data
Clipboard := "" 							; clear the clipboard
Send, ^c 								; copy the selected text or the text under the cursor to the clipboard
text := Clipboard 							; get the text from the clipboard
new_text := ""
if (text ~= "[A-Za-z]+") { 						; check if the text contains only letters
    loop, parse, text 
    {
        char := A_LoopField
        if (Asc(char) >= Asc("a") and Asc(char) <= Asc("z")) {
            char := chr(Asc(char) - 32) 				; convert lowercase to uppercase
        }
        else if (Asc(char) >= Asc("A") and Asc(char) <= Asc("Z")) {
            char := chr(Asc(char) + 32) 				; convert uppercase to lowercase
        }
        new_text .= char
    }
    Send {Backspace StrLen(%text%)}					; delete old text
    Clipboard := new_text 						; paste the modified text
    Send ^v
}
Clipboard = %Old_Clipboard% 						; set back old state
return