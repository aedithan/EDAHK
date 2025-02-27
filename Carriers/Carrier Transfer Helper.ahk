#Requires AutoHotkey v2.0

;#############################################################################
;							README
; 	This helper script will facilitate transferring commodites from your carrier
;   to your ship's cargo hold. The script will remember the last value used so you do
;   not have to keep typing in the same value if you are doing multiple loads of the same
;   commodity/
;
;   **SPECIAL NOTE**
;   The script will get close to your desired quantity, and you will need to manually
;   adjust the final quantities.
;
;	1. Highlight the item you want to transfer from your carrier to your ship in the
;   inventory window
;
;   2. Press F5
;   3. Enter the desired quantity you wish to transfer to your ship's cargo hold
;   4. Press Enter or click Ok
;   5. Wait for the script to complete then fine tune the remaining few quantity
;
;   When you are done transferring for the day, press F8 to exit the script.
;
;#############################################################################
; Default values
;#############################################################################

CargoToTransfer := 0
KeyLeft := "a"

;#############################################################################
; !Do not edit below this line
;#############################################################################

FillCargo(CargoHold) {

    Delay := (CargoHold / 20) * 1000

    Send('{' . KeyLeft . ' down}')
    Sleep(Delay)
    Send('{' . KeyLeft . ' up}')

    return
}

F5:: {
    global CargoToTransfer

    UserValue := InputBox("How much would you like to transfer?`n Last value used: " . CargoToTransfer).Value
    if (UserValue != "") {
        CargoToTransfer := Integer(UserValue) > 0 ? Integer(UserValue) : 1
    }

    Sleep(1000)
    FillCargo(CargoToTransfer)

    return
}

F8:: {
    ExitApp()
}
