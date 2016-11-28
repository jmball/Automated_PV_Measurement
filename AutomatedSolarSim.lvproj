<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="11008008">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Add dark EQE measurement to queue.vi" Type="VI" URL="../SubVIs/Add dark EQE measurement to queue.vi"/>
		<Item Name="Add Data to EQE Log File.vi" Type="VI" URL="../SubVIs/Add Data to EQE Log File.vi"/>
		<Item Name="Add light-dark J-t measurements to queue.vi" Type="VI" URL="../SubVIs/Add light-dark J-t measurements to queue.vi"/>
		<Item Name="Add light-dark measurements to queue.vi" Type="VI" URL="../SubVIs/Add light-dark measurements to queue.vi"/>
		<Item Name="Add repeat light measurements to queue.vi" Type="VI" URL="../SubVIs/Add repeat light measurements to queue.vi"/>
		<Item Name="Automated JV Measurement.vi" Type="VI" URL="../Automated JV Measurement.vi"/>
		<Item Name="Build meas status string.vi" Type="VI" URL="../SubVIs/Build meas status string.vi"/>
		<Item Name="Calculate scan rate.vi" Type="VI" URL="../SubVIs/Calculate scan rate.vi"/>
		<Item Name="Check Arduino is connected.vi" Type="VI" URL="../SubVIs/Check Arduino is connected.vi"/>
		<Item Name="Check Keithley is connected.vi" Type="VI" URL="../SubVIs/Check Keithley is connected.vi"/>
		<Item Name="Check pcb cont is connected.vi" Type="VI" URL="../SubVIs/Check pcb cont is connected.vi"/>
		<Item Name="Check stage contr is connected.vi" Type="VI" URL="../SubVIs/Check stage contr is connected.vi"/>
		<Item Name="Close EQE.vi" Type="VI" URL="../SubVIs/Close EQE.vi"/>
		<Item Name="Create Intensity Dep folder.vi" Type="VI" URL="../SubVIs/Create Intensity Dep folder.vi"/>
		<Item Name="Create JV folder.vi" Type="VI" URL="../SubVIs/Create JV folder.vi"/>
		<Item Name="Create Max Power Stab folder.vi" Type="VI" URL="../SubVIs/Create Max Power Stab folder.vi"/>
		<Item Name="Delete scan settings.vi" Type="VI" URL="../SubVIs/Delete scan settings.vi"/>
		<Item Name="Disable and grey out controls.vi" Type="VI" URL="../../Solar_Cell_Stability/VIs/subvis/Disable and grey out controls.vi"/>
		<Item Name="Disable stage.vi" Type="VI" URL="../SubVIs/Disable stage.vi"/>
		<Item Name="Disable-enable scan settgin controls.vi" Type="VI" URL="../../Solar_Cell_Stability/VIs/subvis/Disable-enable scan settgin controls.vi"/>
		<Item Name="Enable stage.vi" Type="VI" URL="../SubVIs/Enable stage.vi"/>
		<Item Name="Find best pixel from log file.vi" Type="VI" URL="../SubVIs/Find best pixel from log file.vi"/>
		<Item Name="Find max power voltage from log file.vi" Type="VI" URL="../SubVIs/Find max power voltage from log file.vi"/>
		<Item Name="Format Max P Stabil data for plot.vi" Type="VI" URL="../SubVIs/Format Max P Stabil data for plot.vi"/>
		<Item Name="Generate report control.ctl" Type="VI" URL="../SubVIs/Generate report control.ctl"/>
		<Item Name="Generate voltage lists.vi" Type="VI" URL="../../J-V Measurement/Subvi/Generate voltage lists.vi"/>
		<Item Name="Get filter wheel settings.vi" Type="VI" URL="../SubVIs/Get filter wheel settings.vi"/>
		<Item Name="JV Data analysis from master log file.vi" Type="VI" URL="../SubVIs/JV Data analysis from master log file.vi"/>
		<Item Name="Keithley 24XX.lvlib" Type="Library" URL="/&lt;instrlib&gt;/keithley_24xx/Keithley 24XX/Keithley 24XX.lvlib"/>
		<Item Name="Keithley J-t IIT_v2.vi" Type="VI" URL="../SubVIs/Keithley J-t IIT_v2.vi"/>
		<Item Name="Load saved scan settings_arbitray cluster elements.vi" Type="VI" URL="../SubVIs/Load saved scan settings_arbitray cluster elements.vi"/>
		<Item Name="Measure EQE.vi" Type="VI" URL="../SubVIs/Measure EQE.vi"/>
		<Item Name="Measure EQE_v2.vi" Type="VI" URL="../SubVIs/Measure EQE_v2.vi"/>
		<Item Name="Measure Intensity Dep.vi" Type="VI" URL="../SubVIs/Measure Intensity Dep.vi"/>
		<Item Name="Measure Jt curve.vi" Type="VI" URL="../SubVIs/Measure Jt curve.vi"/>
		<Item Name="Measure JV curve.vi" Type="VI" URL="../SubVIs/Measure JV curve.vi"/>
		<Item Name="Measure MaxPStabilisation.vi" Type="VI" URL="../SubVIs/Measure MaxPStabilisation.vi"/>
		<Item Name="MeasureFilterIntensities.vi" Type="VI" URL="../SubVIs/MeasureFilterIntensities.vi"/>
		<Item Name="NPLC for JV scan.ctl" Type="VI" URL="../TypeDefs/NPLC for JV scan.ctl"/>
		<Item Name="Remove_EQE_and_Indep_if_manual.vi" Type="VI" URL="../SubVIs/Remove_EQE_and_Indep_if_manual.vi"/>
		<Item Name="Save scan settings.vi" Type="VI" URL="../SubVIs/Save scan settings.vi"/>
		<Item Name="Save Stabilisation Data.vi" Type="VI" URL="../SubVIs/Save Stabilisation Data.vi"/>
		<Item Name="Scan settings.ctl" Type="VI" URL="../TypeDefs/Scan settings.ctl"/>
		<Item Name="Set pins on switch board.vi" Type="VI" URL="../SubVIs/Set pins on switch board.vi"/>
		<Item Name="Settings Boolean.ctl" Type="VI" URL="../TypeDefs/Settings Boolean.ctl"/>
		<Item Name="Setup EQE.vi" Type="VI" URL="../SubVIs/Setup EQE.vi"/>
		<Item Name="Sort scan settings.vi" Type="VI" URL="../SubVIs/Sort scan settings.vi"/>
		<Item Name="State Enumerate Ring.ctl" Type="VI" URL="../TypeDefs/State Enumerate Ring.ctl"/>
		<Item Name="Time left Calculator.vi" Type="VI" URL="../SubVIs/Time left Calculator.vi"/>
		<Item Name="Timing Calculator_v2.vi" Type="VI" URL="../SubVIs/Timing Calculator_v2.vi"/>
		<Item Name="Update Meas Type to Best EQE.vi" Type="VI" URL="../SubVIs/Update Meas Type to Best EQE.vi"/>
		<Item Name="Update Meas Type to Best Intensity.vi" Type="VI" URL="../SubVIs/Update Meas Type to Best Intensity.vi"/>
		<Item Name="Update Meas Type to Best J-t Scan.vi" Type="VI" URL="../SubVIs/Update Meas Type to Best J-t Scan.vi"/>
		<Item Name="Update Meas Type to Best MaxPowStab.vi" Type="VI" URL="../SubVIs/Update Meas Type to Best MaxPowStab.vi"/>
		<Item Name="Update Meas Type to EQE.vi" Type="VI" URL="../SubVIs/Update Meas Type to EQE.vi"/>
		<Item Name="Update Meas Type to Repeat JV Scan for best.vi" Type="VI" URL="../SubVIs/Update Meas Type to Repeat JV Scan for best.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="user.lib" Type="Folder">
				<Item Name="Search 1D Array (Boolean)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (Boolean)__ogtk.vi"/>
				<Item Name="Search 1D Array (CDB)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (CDB)__ogtk.vi"/>
				<Item Name="Search 1D Array (CSG)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (CSG)__ogtk.vi"/>
				<Item Name="Search 1D Array (CXT)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (CXT)__ogtk.vi"/>
				<Item Name="Search 1D Array (DBL)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (DBL)__ogtk.vi"/>
				<Item Name="Search 1D Array (EXT)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (EXT)__ogtk.vi"/>
				<Item Name="Search 1D Array (I8)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (I8)__ogtk.vi"/>
				<Item Name="Search 1D Array (I16)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (I16)__ogtk.vi"/>
				<Item Name="Search 1D Array (I32)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (I32)__ogtk.vi"/>
				<Item Name="Search 1D Array (I64)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (I64)__ogtk.vi"/>
				<Item Name="Search 1D Array (LVObject)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (LVObject)__ogtk.vi"/>
				<Item Name="Search 1D Array (Path)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (Path)__ogtk.vi"/>
				<Item Name="Search 1D Array (SGL)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (SGL)__ogtk.vi"/>
				<Item Name="Search 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (String)__ogtk.vi"/>
				<Item Name="Search 1D Array (U8)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (U8)__ogtk.vi"/>
				<Item Name="Search 1D Array (U16)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (U16)__ogtk.vi"/>
				<Item Name="Search 1D Array (U32)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (U32)__ogtk.vi"/>
				<Item Name="Search 1D Array (U64)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (U64)__ogtk.vi"/>
				<Item Name="Search 1D Array (Variant)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search 1D Array (Variant)__ogtk.vi"/>
				<Item Name="Search Array__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/Search Array__ogtk.vi"/>
			</Item>
			<Item Name="vi.lib" Type="Folder">
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check Color Table Size.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Color Table Size.vi"/>
				<Item Name="Check Data Size.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Data Size.vi"/>
				<Item Name="Check File Permissions.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check File Permissions.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Check Path.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Path.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Close File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Close File+.vi"/>
				<Item Name="compatReadText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatReadText.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Digital Size.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDT.llb/Digital Size.vi"/>
				<Item Name="Digital to Binary.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDT.llb/Digital to Binary.vi"/>
				<Item Name="Directory of Top Level VI.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Directory of Top Level VI.vi"/>
				<Item Name="DTbl Digital Size.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Digital Size.vi"/>
				<Item Name="DTbl Digital to Binary U8.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Digital to Binary U8.vi"/>
				<Item Name="DTbl Digital to Binary U16.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Digital to Binary U16.vi"/>
				<Item Name="DTbl Digital to Binary U32.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Digital to Binary U32.vi"/>
				<Item Name="DWDT Digital Size.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Digital Size.vi"/>
				<Item Name="DWDT Digital to Binary U8.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Digital to Binary U8.vi"/>
				<Item Name="DWDT Digital to Binary U16.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Digital to Binary U16.vi"/>
				<Item Name="DWDT Digital to Binary U32.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Digital to Binary U32.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="Find First Error.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find First Error.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="FormatTime String.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/ElapsedTimeBlock.llb/FormatTime String.vi"/>
				<Item Name="General Error Handler CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="imagedata.ctl" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/imagedata.ctl"/>
				<Item Name="List Directory and LLBs.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/List Directory and LLBs.vi"/>
				<Item Name="LMH-LINX.lvlib" Type="Library" URL="/&lt;vilib&gt;/MakerHub/LINX/LMH-LINX.lvlib"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="NI_AALPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALPro.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_Gmath.lvlib" Type="Library" URL="/&lt;vilib&gt;/gmath/NI_Gmath.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="null" Type="VI" URL="/&lt;vilib&gt;/ULx/null"/>
				<Item Name="Open File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Open File+.vi"/>
				<Item Name="Read File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read File+ (string).vi"/>
				<Item Name="Read From Spreadsheet File (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (DBL).vi"/>
				<Item Name="Read From Spreadsheet File (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (I64).vi"/>
				<Item Name="Read From Spreadsheet File (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (string).vi"/>
				<Item Name="Read From Spreadsheet File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File.vi"/>
				<Item Name="Read Lines From File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Lines From File.vi"/>
				<Item Name="Recursive File List.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Recursive File List.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set Duty Cycle and Frequency.vi" Type="VI" URL="/&lt;vilib&gt;/myRIO/Instrument Drivers/Onboard IO/PWM/vis/Set Duty Cycle and Frequency.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="Smart Open.vi" Type="VI" URL="/&lt;vilib&gt;/myRIO/Instrument Drivers/Onboard IO/DIO/vis/Smart Open.vi"/>
				<Item Name="Smart Open.vi" Type="VI" URL="/&lt;vilib&gt;/myRIO/Instrument Drivers/Onboard IO/PWM/vis/Smart Open.vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="subElapsedTime.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/ElapsedTimeBlock.llb/subElapsedTime.vi"/>
				<Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="ULx Clear Task.vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Task.llb/ULx Clear Task.vi"/>
				<Item Name="ULx Convert 1D Digital Waveform.vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Miscellaneous.llb/ULx Convert 1D Digital Waveform.vi"/>
				<Item Name="ULx Create Channel (AI-Current-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (AI-Current-Basic).vi"/>
				<Item Name="ULx Create Channel (AI-Temperature).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (AI-Temperature).vi"/>
				<Item Name="ULx Create Channel (AI-Voltage-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (AI-Voltage-Basic).vi"/>
				<Item Name="ULx Create Channel (AO-Current-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (AO-Current-Basic).vi"/>
				<Item Name="ULx Create Channel (AO-Voltage-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (AO-Voltage-Basic).vi"/>
				<Item Name="ULx Create Channel (CI-Count Edges).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (CI-Count Edges).vi"/>
				<Item Name="ULx Create Channel (CI-Frequency).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (CI-Frequency).vi"/>
				<Item Name="ULx Create Channel (CI-Period).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (CI-Period).vi"/>
				<Item Name="ULx Create Channel (CO-Pulse Generation-Frequency).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (CO-Pulse Generation-Frequency).vi"/>
				<Item Name="ULx Create Channel (CO-Pulse Generation-Ticks).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (CO-Pulse Generation-Ticks).vi"/>
				<Item Name="ULx Create Channel (CO-Pulse Generation-Time).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (CO-Pulse Generation-Time).vi"/>
				<Item Name="ULx Create Channel (CompI-Analog Input-Temperature).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (CompI-Analog Input-Temperature).vi"/>
				<Item Name="ULx Create Channel (CompI-Analog Input-Voltage).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (CompI-Analog Input-Voltage).vi"/>
				<Item Name="ULx Create Channel (CompI-Counter Input-Count Edges).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (CompI-Counter Input-Count Edges).vi"/>
				<Item Name="ULx Create Channel (CompI-Digital Input).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (CompI-Digital Input).vi"/>
				<Item Name="ULx Create Channel (CompO-Analog Output-Voltage).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (CompO-Analog Output-Voltage).vi"/>
				<Item Name="ULx Create Channel (CompO-Digital Output).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (CompO-Digital Output).vi"/>
				<Item Name="ULx Create Channel (DI-Digital Input).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (DI-Digital Input).vi"/>
				<Item Name="ULx Create Channel (DO-Digital Output).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Channel (DO-Digital Output).vi"/>
				<Item Name="ULx Create IOTask.vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create IOTask.vi"/>
				<Item Name="ULx Create Virtual Channel.vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Create Channel.llb/ULx Create Virtual Channel.vi"/>
				<Item Name="ULx Get Error Info.vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Miscellaneous.llb/ULx Get Error Info.vi"/>
				<Item Name="ULx Start Task.vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Task.llb/ULx Start Task.vi"/>
				<Item Name="ULx Write (Analog 1D DBL 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Analog 1D DBL 1Chan 1Samp).vi"/>
				<Item Name="ULx Write (Analog 1D DBL 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Analog 1D DBL 1Chan NSamp).vi"/>
				<Item Name="ULx Write (Analog 1D DBL NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Analog 1D DBL NChan 1Samp).vi"/>
				<Item Name="ULx Write (Analog 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Analog 1D Wfm NChan 1Samp).vi"/>
				<Item Name="ULx Write (Analog 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Analog 1D Wfm NChan NSamp).vi"/>
				<Item Name="ULx Write (Analog 2D DBL NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Analog 2D DBL NChan NSamp).vi"/>
				<Item Name="ULx Write (Analog Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Analog Wfm 1Chan 1Samp).vi"/>
				<Item Name="ULx Write (Analog Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Analog Wfm 1Chan NSamp).vi"/>
				<Item Name="ULx Write (Composite 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Composite 1D Wfm NChan NSamp).vi"/>
				<Item Name="ULx Write (Composite 2D  NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Composite 2D  NChan NSamp).vi"/>
				<Item Name="ULx Write (Counter 1D Frequency NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Counter 1D Frequency NChan 1Samp).vi"/>
				<Item Name="ULx Write (Counter 1D Ticks NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Counter 1D Ticks NChan 1Samp).vi"/>
				<Item Name="ULx Write (Counter 1D Time NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Counter 1D Time NChan 1Samp).vi"/>
				<Item Name="ULx Write (Counter Frequency 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Counter Frequency 1Chan 1Samp).vi"/>
				<Item Name="ULx Write (Counter Ticks 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Counter Ticks 1Chan 1Samp).vi"/>
				<Item Name="ULx Write (Counter Time 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Counter Time 1Chan 1Samp).vi"/>
				<Item Name="ULx Write (Digital 1D Bool 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital 1D Bool 1Chan 1Samp).vi"/>
				<Item Name="ULx Write (Digital 1D Bool NChan 1Samp 1Line).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital 1D Bool NChan 1Samp 1Line).vi"/>
				<Item Name="ULx Write (Digital 1D U8 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital 1D U8 1Chan NSamp).vi"/>
				<Item Name="ULx Write (Digital 1D U8 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital 1D U8 NChan 1Samp).vi"/>
				<Item Name="ULx Write (Digital 1D U16 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital 1D U16 1Chan NSamp).vi"/>
				<Item Name="ULx Write (Digital 1D U16 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital 1D U16 NChan 1Samp).vi"/>
				<Item Name="ULx Write (Digital 1D U32 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital 1D U32 1Chan NSamp).vi"/>
				<Item Name="ULx Write (Digital 1D U32 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital 1D U32 NChan 1Samp).vi"/>
				<Item Name="ULx Write (Digital 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital 1D Wfm NChan 1Samp).vi"/>
				<Item Name="ULx Write (Digital 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital 1D Wfm NChan NSamp).vi"/>
				<Item Name="ULx Write (Digital 2D Bool NChan 1Samp NLine).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital 2D Bool NChan 1Samp NLine).vi"/>
				<Item Name="ULx Write (Digital 2D U8 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital 2D U8 NChan NSamp).vi"/>
				<Item Name="ULx Write (Digital 2D U16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital 2D U16 NChan NSamp).vi"/>
				<Item Name="ULx Write (Digital 2D U32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital 2D U32 NChan NSamp).vi"/>
				<Item Name="ULx Write (Digital Bool 1Line 1Point).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital Bool 1Line 1Point).vi"/>
				<Item Name="ULx Write (Digital U8 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital U8 1Chan 1Samp).vi"/>
				<Item Name="ULx Write (Digital U16 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital U16 1Chan 1Samp).vi"/>
				<Item Name="ULx Write (Digital U32 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital U32 1Chan 1Samp).vi"/>
				<Item Name="ULx Write (Digital Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital Wfm 1Chan 1Samp).vi"/>
				<Item Name="ULx Write (Digital Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write (Digital Wfm 1Chan NSamp).vi"/>
				<Item Name="ULx Write.vi" Type="VI" URL="/&lt;vilib&gt;/ULx/Write.llb/ULx Write.vi"/>
				<Item Name="ULx_LV.dll" Type="Document" URL="/&lt;vilib&gt;/ULx/ULx_LV.dll"/>
				<Item Name="VISA Configure Serial Port" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port"/>
				<Item Name="VISA Configure Serial Port (Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Instr).vi"/>
				<Item Name="VISA Configure Serial Port (Serial Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Serial Instr).vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Write JPEG File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Write JPEG File.vi"/>
				<Item Name="Write Spreadsheet String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Spreadsheet String.vi"/>
				<Item Name="Write To Spreadsheet File (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (DBL).vi"/>
				<Item Name="Write To Spreadsheet File (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (I64).vi"/>
				<Item Name="Write To Spreadsheet File (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (string).vi"/>
				<Item Name="Write To Spreadsheet File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File.vi"/>
				<Item Name="Write.vi" Type="VI" URL="/&lt;vilib&gt;/myRIO/Instrument Drivers/Onboard IO/DIO/vis/Write.vi"/>
			</Item>
			<Item Name="Add light MaxPowStab measurement to queue.vi" Type="VI" URL="../SubVIs/Add light MaxPowStab measurement to queue.vi"/>
			<Item Name="Build queue.vi" Type="VI" URL="../SubVIs/Build queue.vi"/>
			<Item Name="CalculateEQEandJsc.vi" Type="VI" URL="../SubVIs/CalculateEQEandJsc.vi"/>
			<Item Name="Calibrate filter wheel.vi" Type="VI" URL="../SubVIs/Calibrate filter wheel.vi"/>
			<Item Name="closeDeviceReference.vi" Type="VI" URL="../../../../../../../Program Files (x86)/NSC-A2L/Libraries-Source-Code/Sample Source Code/USB/USB Terminal Labview - 103 - LV version 8.5/PerformaxLV_v103.llb/closeDeviceReference.vi"/>
			<Item Name="Create Data Folders_IIT.vi" Type="VI" URL="../../J-V Measurement/Subvi/Create Data Folders_IIT.vi"/>
			<Item Name="Create EQE Data Folder and File Path.vi" Type="VI" URL="../SubVIs/Create EQE Data Folder and File Path.vi"/>
			<Item Name="Create Jt folder.vi" Type="VI" URL="../../J-V Measurement/Subvi/Create Jt folder.vi"/>
			<Item Name="Disable Motor.vi" Type="VI" URL="../SubVIs/Disable Motor.vi"/>
			<Item Name="errors.vi" Type="VI" URL="../../../../../../../Program Files (x86)/NSC-A2L/Libraries-Source-Code/Sample Source Code/USB/USB Terminal Labview - 103 - LV version 8.5/PerformaxLV_v103.llb/errors.vi"/>
			<Item Name="errors_actions.ctl" Type="VI" URL="../../../../../../../Program Files (x86)/NSC-A2L/Libraries-Source-Code/Sample Source Code/USB/USB Terminal Labview - 103 - LV version 8.5/PerformaxLV_v103.llb/errors_actions.ctl"/>
			<Item Name="Find highest intensity filter position.vi" Type="VI" URL="../SubVIs/Find highest intensity filter position.vi"/>
			<Item Name="Format data to plot Jt_IIT.vi" Type="VI" URL="../../J-V Measurement/Subvi/Format data to plot Jt_IIT.vi"/>
			<Item Name="Format data to plot_IIT.vi" Type="VI" URL="../../J-V Measurement/Subvi/Format data to plot_IIT.vi"/>
			<Item Name="Format log file to display data.vi" Type="VI" URL="../SubVIs/Format log file to display data.vi"/>
			<Item Name="Get new anlge to rotate filter wheel by.vi" Type="VI" URL="../SubVIs/Get new anlge to rotate filter wheel by.vi"/>
			<Item Name="Get pixel X-Y position.vi" Type="VI" URL="../SubVIs/Get pixel X-Y position.vi"/>
			<Item Name="Keithley J-t List_IIT.vi" Type="VI" URL="../SubVIs/Keithley J-t List_IIT.vi"/>
			<Item Name="Keithley Max_P List_IIT.vi" Type="VI" URL="../../J-V Measurement/Subvi/Keithley Max_P List_IIT.vi"/>
			<Item Name="Keithley Sweep_IIT.vi" Type="VI" URL="../../J-V Measurement/Subvi/Keithley Sweep_IIT.vi"/>
			<Item Name="lvanlys.dll" Type="Document" URL="../../../../../../../Program Files (x86)/National Instruments/LabVIEW 2011/resource/lvanlys.dll"/>
			<Item Name="Measure current now.vi" Type="VI" URL="../SubVIs/Measure current now.vi"/>
			<Item Name="Measure number of suns.vi" Type="VI" URL="../SubVIs/Measure number of suns.vi"/>
			<Item Name="Move stage to diode position.vi" Type="VI" URL="../SubVIs/Move stage to diode position.vi"/>
			<Item Name="Move to filter position.vi" Type="VI" URL="../SubVIs/Move to filter position.vi"/>
			<Item Name="Move X-Y to L-.vi" Type="VI" URL="../SubVIs/Move X-Y to L-.vi"/>
			<Item Name="Move X-Y to specific position.vi" Type="VI" URL="../SubVIs/Move X-Y to specific position.vi"/>
			<Item Name="mscorlib" Type="VI" URL="mscorlib">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="openDeviceReference.vi" Type="VI" URL="../../../../../../../Program Files (x86)/NSC-A2L/Libraries-Source-Code/Sample Source Code/USB/USB Terminal Labview - 103 - LV version 8.5/PerformaxLV_v103.llb/openDeviceReference.vi"/>
			<Item Name="PerformaxCom.dll" Type="Document" URL="PerformaxCom.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Remove duplicates by column.vi" Type="VI" URL="../SubVIs/Remove duplicates by column.vi"/>
			<Item Name="Save Data_IIT.vi" Type="VI" URL="../../J-V Measurement/Subvi/Save Data_IIT.vi"/>
			<Item Name="Save info to spreadsheet.vi" Type="VI" URL="../SubVIs/Save info to spreadsheet.vi"/>
			<Item Name="Save Intensity Dep Data.vi" Type="VI" URL="../SubVIs/Save Intensity Dep Data.vi"/>
			<Item Name="Save J-t Data_IIT.vi" Type="VI" URL="../../J-V Measurement/Subvi/Save J-t Data_IIT.vi"/>
			<Item Name="Select pin on PCB.vi" Type="VI" URL="../SubVIs/Select pin on PCB.vi"/>
			<Item Name="sendReceiveCommand.vi" Type="VI" URL="../../../../../../../Program Files (x86)/NSC-A2L/Libraries-Source-Code/Sample Source Code/USB/USB Terminal Labview - 103 - LV version 8.5/PerformaxLV_v103.llb/sendReceiveCommand.vi"/>
			<Item Name="setTimeOuts.vi" Type="VI" URL="../../../../../../../Program Files (x86)/NSC-A2L/Libraries-Source-Code/Sample Source Code/USB/USB Terminal Labview - 103 - LV version 8.5/PerformaxLV_v103.llb/setTimeOuts.vi"/>
			<Item Name="Sort 2D Cell details Array.vi" Type="VI" URL="../SubVIs/Sort 2D Cell details Array.vi"/>
			<Item Name="strByteArrayConvert.vi" Type="VI" URL="../../../../../../../Program Files (x86)/NSC-A2L/Libraries-Source-Code/Sample Source Code/USB/USB Terminal Labview - 103 - LV version 8.5/PerformaxLV_v103.llb/strByteArrayConvert.vi"/>
			<Item Name="Turn filter wheel by angle.vi" Type="VI" URL="../SubVIs/Turn filter wheel by angle.vi"/>
			<Item Name="Update Meas Type to Intensity.vi" Type="VI" URL="../SubVIs/Update Meas Type to Intensity.vi"/>
			<Item Name="Update Meas Type to J-t Scan.vi" Type="VI" URL="../SubVIs/Update Meas Type to J-t Scan.vi"/>
			<Item Name="Update Meas Type to JV Scan.vi" Type="VI" URL="../SubVIs/Update Meas Type to JV Scan.vi"/>
			<Item Name="Update Meas Type to MaxPowStab.vi" Type="VI" URL="../SubVIs/Update Meas Type to MaxPowStab.vi"/>
			<Item Name="Upload info from spreadsheet.vi" Type="VI" URL="../SubVIs/Upload info from spreadsheet.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="Automated PV Measurement" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{F52AF132-3EF5-4D47-891B-7683AD0EFAB7}</Property>
				<Property Name="App_INI_GUID" Type="Str">{371BE36C-DA84-4831-8722-351A6426FAD3}</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{3D0434C3-655D-4307-995F-6691C099E444}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Automated PV Measurement</Property>
				<Property Name="Bld_compilerOptLevel" Type="Int">0</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/Automated PV Measurement</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{65218141-FB31-4B09-A2F6-E5C08397FD8D}</Property>
				<Property Name="Destination[0].destName" Type="Str">Automated PV Measurement_v2.0.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated PV Measurement/Automated PV Measurement_v2.0.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated PV Measurement/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{C99FC351-ECED-4B43-90C1-3B81C958B188}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Automated JV Measurement.vi</Property>
				<Property Name="Source[1].properties[0].type" Type="Str">Window has title bar</Property>
				<Property Name="Source[1].properties[0].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[1].type" Type="Str">Show menu bar</Property>
				<Property Name="Source[1].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[10].type" Type="Str">Allow debugging</Property>
				<Property Name="Source[1].properties[10].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[11].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[1].properties[11].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[12].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[1].properties[12].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[2].type" Type="Str">Show vertical scroll bar</Property>
				<Property Name="Source[1].properties[2].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[3].type" Type="Str">Show horizontal scroll bar</Property>
				<Property Name="Source[1].properties[3].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[4].type" Type="Str">Show toolbar</Property>
				<Property Name="Source[1].properties[4].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[5].type" Type="Str">Show Abort button</Property>
				<Property Name="Source[1].properties[5].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[6].type" Type="Str">Show fp when called</Property>
				<Property Name="Source[1].properties[6].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[7].type" Type="Str">Window behavior</Property>
				<Property Name="Source[1].properties[7].value" Type="Str">Modal</Property>
				<Property Name="Source[1].properties[8].type" Type="Str">Allow user to close window</Property>
				<Property Name="Source[1].properties[8].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[9].type" Type="Str">Window run-time position</Property>
				<Property Name="Source[1].properties[9].value" Type="Str">Maximized</Property>
				<Property Name="Source[1].propertiesCount" Type="Int">13</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/Add dark EQE measurement to queue.vi</Property>
				<Property Name="Source[2].properties[0].type" Type="Str">Show vertical scroll bar</Property>
				<Property Name="Source[2].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[1].type" Type="Str">Show horizontal scroll bar</Property>
				<Property Name="Source[2].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[10].type" Type="Str">Show fp when called</Property>
				<Property Name="Source[2].properties[10].value" Type="Bool">true</Property>
				<Property Name="Source[2].properties[11].type" Type="Str">Window behavior</Property>
				<Property Name="Source[2].properties[11].value" Type="Str">Default</Property>
				<Property Name="Source[2].properties[12].type" Type="Str">Allow user to close window</Property>
				<Property Name="Source[2].properties[12].value" Type="Bool">true</Property>
				<Property Name="Source[2].properties[13].type" Type="Str">Allow debugging</Property>
				<Property Name="Source[2].properties[13].value" Type="Bool">true</Property>
				<Property Name="Source[2].properties[2].type" Type="Str">Show menu bar</Property>
				<Property Name="Source[2].properties[2].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[3].type" Type="Str">Show toolbar</Property>
				<Property Name="Source[2].properties[3].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[4].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[2].properties[4].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[5].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[2].properties[5].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[6].type" Type="Str">Window has title bar</Property>
				<Property Name="Source[2].properties[6].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[7].type" Type="Str">Show Abort button</Property>
				<Property Name="Source[2].properties[7].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[8].type" Type="Str">Window run-time position</Property>
				<Property Name="Source[2].properties[8].value" Type="Str">Maximized</Property>
				<Property Name="Source[2].properties[9].type" Type="Str">Run when opened</Property>
				<Property Name="Source[2].properties[9].value" Type="Bool">true</Property>
				<Property Name="Source[2].propertiesCount" Type="Int">14</Property>
				<Property Name="Source[2].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
				<Property Name="TgtF_companyName" Type="Str">Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Automated PV Measurement</Property>
				<Property Name="TgtF_fileVersion.major" Type="Int">2</Property>
				<Property Name="TgtF_internalName" Type="Str">Automated PV Measurement</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2016 Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_productName" Type="Str">Automated PV Measurement</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{1554B717-9B6C-4835-B385-35C66BDF09D2}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Automated PV Measurement_v2.0.exe</Property>
			</Item>
			<Item Name="Automated PV Measurement v2.1.4" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{05D4B823-5183-494D-A4B6-4194B1A3FBD5}</Property>
				<Property Name="App_INI_GUID" Type="Str">{83079F92-76F1-4213-8422-CD470FEE9F49}</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{B0D3DA73-393F-4BEC-B4E4-932AF229A9C4}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Automated PV Measurement v2.1.4</Property>
				<Property Name="Bld_compilerOptLevel" Type="Int">0</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../Automated_PV_Measurement/builds/Automated PV Measurement v2.1.4</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{CE5D3E30-9F6B-4248-BD9A-2F8A1285AFCC}</Property>
				<Property Name="Destination[0].destName" Type="Str">Automated PV Measurement v2.1.4.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../Automated_PV_Measurement/builds/Automated PV Measurement v2.1.4/Automated PV Measurement v2.1.4.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../Automated_PV_Measurement/builds/Automated PV Measurement v2.1.4/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{740729B2-DE33-471A-932B-A84BEBBB65DC}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Automated JV Measurement.vi</Property>
				<Property Name="Source[1].properties[0].type" Type="Str">Window has title bar</Property>
				<Property Name="Source[1].properties[0].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[1].type" Type="Str">Show menu bar</Property>
				<Property Name="Source[1].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[10].type" Type="Str">Allow debugging</Property>
				<Property Name="Source[1].properties[10].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[11].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[1].properties[11].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[12].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[1].properties[12].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[2].type" Type="Str">Show vertical scroll bar</Property>
				<Property Name="Source[1].properties[2].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[3].type" Type="Str">Show horizontal scroll bar</Property>
				<Property Name="Source[1].properties[3].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[4].type" Type="Str">Show toolbar</Property>
				<Property Name="Source[1].properties[4].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[5].type" Type="Str">Show Abort button</Property>
				<Property Name="Source[1].properties[5].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[6].type" Type="Str">Show fp when called</Property>
				<Property Name="Source[1].properties[6].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[7].type" Type="Str">Window behavior</Property>
				<Property Name="Source[1].properties[7].value" Type="Str">Modal</Property>
				<Property Name="Source[1].properties[8].type" Type="Str">Allow user to close window</Property>
				<Property Name="Source[1].properties[8].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[9].type" Type="Str">Window run-time position</Property>
				<Property Name="Source[1].properties[9].value" Type="Str">Maximized</Property>
				<Property Name="Source[1].propertiesCount" Type="Int">13</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/Add dark EQE measurement to queue.vi</Property>
				<Property Name="Source[2].properties[0].type" Type="Str">Show vertical scroll bar</Property>
				<Property Name="Source[2].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[1].type" Type="Str">Show horizontal scroll bar</Property>
				<Property Name="Source[2].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[10].type" Type="Str">Show fp when called</Property>
				<Property Name="Source[2].properties[10].value" Type="Bool">true</Property>
				<Property Name="Source[2].properties[11].type" Type="Str">Window behavior</Property>
				<Property Name="Source[2].properties[11].value" Type="Str">Default</Property>
				<Property Name="Source[2].properties[12].type" Type="Str">Allow user to close window</Property>
				<Property Name="Source[2].properties[12].value" Type="Bool">true</Property>
				<Property Name="Source[2].properties[13].type" Type="Str">Allow debugging</Property>
				<Property Name="Source[2].properties[13].value" Type="Bool">true</Property>
				<Property Name="Source[2].properties[2].type" Type="Str">Show menu bar</Property>
				<Property Name="Source[2].properties[2].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[3].type" Type="Str">Show toolbar</Property>
				<Property Name="Source[2].properties[3].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[4].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[2].properties[4].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[5].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[2].properties[5].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[6].type" Type="Str">Window has title bar</Property>
				<Property Name="Source[2].properties[6].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[7].type" Type="Str">Show Abort button</Property>
				<Property Name="Source[2].properties[7].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[8].type" Type="Str">Window run-time position</Property>
				<Property Name="Source[2].properties[8].value" Type="Str">Maximized</Property>
				<Property Name="Source[2].properties[9].type" Type="Str">Run when opened</Property>
				<Property Name="Source[2].properties[9].value" Type="Bool">true</Property>
				<Property Name="Source[2].propertiesCount" Type="Int">14</Property>
				<Property Name="Source[2].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
				<Property Name="TgtF_companyName" Type="Str">Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Automated PV Measurement</Property>
				<Property Name="TgtF_fileVersion.major" Type="Int">2</Property>
				<Property Name="TgtF_fileVersion.minor" Type="Int">1</Property>
				<Property Name="TgtF_fileVersion.patch" Type="Int">4</Property>
				<Property Name="TgtF_internalName" Type="Str">Automated PV Measurement</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2016 Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_productName" Type="Str">Automated PV Measurement</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{DE62D59D-FAD5-4EBB-9D75-1653E941F304}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Automated PV Measurement v2.1.4.exe</Property>
			</Item>
			<Item Name="Automated Solar Sim" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{B8150494-913C-4D51-885F-D3483375CF1B}</Property>
				<Property Name="App_INI_GUID" Type="Str">{43C1B416-7713-41D8-8AFC-3FBE413564A6}</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{8489497E-5325-49D3-9CA3-B3E37E31F930}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Automated Solar Sim</Property>
				<Property Name="Bld_compilerOptLevel" Type="Int">0</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{75D126E7-439B-43E0-8F8B-7363456712BB}</Property>
				<Property Name="Destination[0].destName" Type="Str">Automated Solar Sim.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim/Automated Solar Sim.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{27926DCE-D054-44FC-A30D-3F41E082CC28}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Automated JV Measurement.vi</Property>
				<Property Name="Source[1].properties[0].type" Type="Str">Show menu bar</Property>
				<Property Name="Source[1].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[1].type" Type="Str">Window has title bar</Property>
				<Property Name="Source[1].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[2].type" Type="Str">Show toolbar</Property>
				<Property Name="Source[1].properties[2].value" Type="Bool">false</Property>
				<Property Name="Source[1].propertiesCount" Type="Int">3</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_companyName" Type="Str">Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Automated Solar Sim</Property>
				<Property Name="TgtF_fileVersion.major" Type="Int">1</Property>
				<Property Name="TgtF_internalName" Type="Str">Automated Solar Sim</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2015 Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_productName" Type="Str">Automated Solar Sim</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{A031AABF-B034-46B0-9368-66B5EBBC29FA}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Automated Solar Sim.exe</Property>
			</Item>
			<Item Name="Automated Solar Sim 1.1" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{AD8A8572-438C-46E7-AF4E-B765CAE84F26}</Property>
				<Property Name="App_INI_GUID" Type="Str">{3CD989B2-CBB8-4682-A7F3-BB5F44EB359E}</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{2B3E0964-0582-467E-84D8-5C2A2E7808E9}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Automated Solar Sim 1.1</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim 1.1</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{A6124AE2-E8E0-488B-9165-52ACF237962F}</Property>
				<Property Name="Destination[0].destName" Type="Str">Automated Solar Sim 1.1.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim 1.1/Automated Solar Sim 1.1.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim 1.1/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{3BD19F4B-D097-457A-BE5C-8588C86098B4}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Automated JV Measurement.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_companyName" Type="Str">Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Automated Solar Sim 1.1</Property>
				<Property Name="TgtF_fileVersion.major" Type="Int">1</Property>
				<Property Name="TgtF_fileVersion.minor" Type="Int">1</Property>
				<Property Name="TgtF_internalName" Type="Str">Automated Solar Sim 1.1</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2015 Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_productName" Type="Str">Automated Solar Sim 1.1</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{C13F47FD-8B8F-4318-8F1F-30A0097665BD}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Automated Solar Sim 1.1.exe</Property>
			</Item>
			<Item Name="Automated Solar Sim 1.2" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{0BBF2728-809A-4410-A39C-B2D61639C448}</Property>
				<Property Name="App_INI_GUID" Type="Str">{96E6E1A1-18E4-4DAC-9DE0-99AB041BB7B6}</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{130B1B2B-278C-4B65-8ADD-AEC071521AFC}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Automated Solar Sim 1.2</Property>
				<Property Name="Bld_compilerOptLevel" Type="Int">0</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim 1.2</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{EEC1CB5F-9482-4DA1-A2C0-F1A5FB66FE87}</Property>
				<Property Name="Destination[0].destName" Type="Str">Automated Solar Sim 1.2.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim 1.2/Automated Solar Sim 1.2.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim 1.2/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{22D43BD4-EF80-4E29-BCD7-9ACF93477A5C}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Automated JV Measurement.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_companyName" Type="Str">Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Automated Solar Sim 1.2</Property>
				<Property Name="TgtF_fileVersion.major" Type="Int">1</Property>
				<Property Name="TgtF_fileVersion.minor" Type="Int">2</Property>
				<Property Name="TgtF_internalName" Type="Str">Automated Solar Sim 1.2</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2015 Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_productName" Type="Str">Automated Solar Sim 1.2</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{27375F8B-DEFB-4A7C-A3E7-7BF242E4EC68}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Automated Solar Sim 1.2.exe</Property>
			</Item>
		</Item>
	</Item>
</Project>
