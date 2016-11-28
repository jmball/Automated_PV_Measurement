;Start scan
MouseClick("primary", 50, 35, 1); click "Scan"
Sleep(100)
MouseClick("primary", 60, 80, 1); click "Take a simple wavelength scan"
Sleep(240000)

;Save data
MouseClick("primary", 15, 35, 1); click "File"
Sleep(100)
MouseClick("primary", 30, 75, 1); click "Save scan data"
WinWaitActive("Choose file to write.")
Send("C:\Documents and Settings\PC\Desktop\TESTAUTOITDATA.txt")
MouseClick("primary", 880, 700, 1); click "OK"
WinWaitActive("Newport Oriel Tracq Basic Version 6.2")

;Clear Graph
MouseClick("primary", 1060, 115, 1); click "Clear Graph"
WinWaitActive("Newport Oriel Tracq Basic Version 6.2")