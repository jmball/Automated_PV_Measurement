;Start Program
Run("C:\Program Files\TRACQ BASIC.exe")
Sleep(19000)
WinWaitActive("Newport Oriel Tracq Basic Version 6.2")

;Set detector calibration file
;MouseClick("primary", 250, 40, 1); click "Detector"
;Sleep(100)
;MouseClick("primary", 260, 55, 1); click "Select Detector Calibration File"
;WinWaitActive("Go to the Detector VI Directory and Select Cur Dir")
;Sleep(100)
;MouseClick("primary", 875, 725, 1); click "Current Folder"
;WinWaitActive("Newport Oriel Tracq Basic Version 6.2")

;Select Oriel detector calibration file
;MouseClick("primary", 15, 35, 1); click "File"
;Sleep(100)
;MouseClick("primary", 65, 190, 1); click "Select Oriel Detector Calibration File"
;WinWaitActive("Select Detector Calibration File")
;Send("C:\Documents and Settings\PC\Desktop\Oriel Calibration Files from CD\71675_71580_344.txt")
;MouseClick("primary", 880, 700, 1); click "OK"
;WinWaitActive("Newport Oriel Tracq Basic Version 6.2")

;Set preamp settings
MouseClick("primary", 250, 40, 1); click "Detector"
Sleep(100)
MouseClick("primary", 275, 125, 1); click "QE setup"
WinWaitActive("Merlin Setup")
MouseClickDrag("primary", 770, 410, 725, 410); highlight "G preamp"
Send("10000"); set to 10000
MouseClickDrag("primary", 770, 485, 725, 485); highlight "G ref"
Send("10000"); set to 10000
MouseClick("primary", 1015, 395, 1); click "Save new parameters"
WinWaitActive("Newport Oriel Tracq Basic Version 6.2")

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

;Make Tracq active window
WinActivate("Newport Oriel Tracq Basic Version 6.2")
WinWaitActive("Newport Oriel Tracq Basic Version 6.2")

;Close Tracq
MouseClick("primary", 15, 40, 1); click "File"
Sleep(100)
MouseClick("primary", 30, 260, 1); click "Exit"
WinWaitActive("Save Tracq32 Setup")
MouseClick("primary", 815, 510, 1); click "No"
Sleep(100)

;Make Automated PV Meas active
WinActivate("Automated JV Measurement.vi")
WinWaitActive("Automated JV Measurement.vi")