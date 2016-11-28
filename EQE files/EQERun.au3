;Make Tracq active window
WinActivate("Newport Oriel Tracq Basic Version 6.2")
WinWaitActive("Newport Oriel Tracq Basic Version 6.2")

;Set lock-in parameters
MouseClick("primary", 250, 40, 1); click "Detector"
Sleep(100)
MouseClick("primary", 290, 90, 1); click "Setup Parameters"
WinWaitActive("Merlin Setup")
MouseClick("primary", 450, 70, 1); click "Channel Setup" dropdown box
Sleep(100)
MouseClick("primary", 365, 140, 1); click "CHANNEL 2"
Sleep(100)
MouseClick("primary", 865, 310, 1); click "Time Constant" dropdown box
Sleep(100)
MouseClick("primary", 865, 290, 1); click ".100s"
Sleep(100)
MouseClickDrag("primary", 870, 370, 825, 370); highlight "Frequency"
Send("120"); set frequency to 120 Hz
Sleep(100)
MouseClick("primary", 910, 695, 1); click "Ref Type" dropdown box
Sleep(100)
MouseClick("primary", 830, 740, 1); click "AC"
Sleep(100)
MouseClick("primary", 1125, 75, 1); click "OK"
WinWaitActive("Newport Oriel Tracq Basic Version 6.2")

;Set wavelength range
MouseClick("primary", 50, 35, 1); click "Scan"
Sleep(100)
MouseClick("primary", 45, 55, 1); click "Setup Scan Wavelength Parameters"
WinWaitActive("Enter Scan Parameters")
MouseClickDrag("primary", 675, 470, 600, 470); highlight "Start wavelength"
Send("300")
MouseClickDrag("primary", 675, 515, 600, 515); highlight "End wavelength"
Send("900")
MouseClickDrag("primary", 675, 560, 600, 560); highlight "Interval wavelength"
Send("5")
MouseClickDrag("primary", 675, 600, 600, 600); highlight "Wait"
Send("200")
MouseClick("primary", 801, 425, 1); click "OK"
WinWaitActive("Newport Oriel Tracq Basic Version 6.2")

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

;Make Automated PV Meas active
WinActivate("Automated JV Measurement.vi")
WinWaitActive("Automated JV Measurement.vi")