Scriptname DiamondCityAutoClose extends ObjectReference Const

Quest Property DialogueDiamondCityEntrance Auto Const

; Run on init aswell. Just in case the cell is already loaded when this script is first run.
Event OnInit()
	debug.trace("DiamondCityAutoClose - Event - OnInit")
	debug.trace("DiamondCityAutoClose - DialogueDiamondCityEntrance = " + DialogueDiamondCityEntrance.GetStage())

	; Only run when the DialogueDiamondCityEntrance is progressed far enough.
	If (DialogueDiamondCityEntrance.GetStage() >= 100)
		CloseGate()
		debug.trace("DiamondCityAutoClose - CloseGate OnInit")
	Endif
EndEvent

Event OnCellLoad()
	debug.trace("DiamondCityAutoClose Event OnCellLoad")
	debug.trace("DiamondCityAutoClose - DialogueDiamondCityEntrance = " + DialogueDiamondCityEntrance.GetStage())

	; Only run when the DialogueDiamondCityEntrance is progressed far enough.
	If (DialogueDiamondCityEntrance.GetStage() >= 100)
		CloseGate()
		debug.trace("DiamondCityAutoClose - CloseGate OnCellLoad")
	Endif
EndEvent

Function CloseGate()
	debug.trace("CloseGate")
	; DExtMainGateDoorAnim01 doesn't have a close anim so it has to be set as closed while its disabled
	Self.Disable()
	Self.Lock(false)
	; close gate
	Self.SetOpen(false)
	; enable again
	Self.Enable()
EndFunction