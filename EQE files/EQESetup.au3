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