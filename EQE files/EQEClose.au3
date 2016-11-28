;Make Tracq active window
WinActivate("Newport Oriel Tracq Basic Version 6.2")
WinWaitActive("Newport Oriel Tracq Basic Version 6.2")

;Close Tracq
MouseClick("primary", 15, 40, 1); click "File"
Sleep(100)
MouseClick("primary", 30, 260, 1); click "Exit"
WinWaitActive("Save Tracq32 Setup")
MouseClick("primary", 815, 510, 1); click "No"