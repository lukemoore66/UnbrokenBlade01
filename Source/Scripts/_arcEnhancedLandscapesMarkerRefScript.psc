ScriptName _arcEnhancedLandscapesMarkerRefScript Extends ObjectReference

Auto State Active
	Event OnCellAttach()
		Form ConflictingForm = Game.GetFormFromFile(0x000036CA, "Enhanced Landscapes.esp")
		
		If !ConflictingForm
			Return
		EndIf
		
		ObjectReference ConflictingRef = ConflictingForm as ObjectReference
		
		If ConflictingRef.IsDisabled()
			Return
		EndIf
		
		GoToState("Inactive")
		
		ConflictingRef.DisableNoWait()
	EndEvent
EndState

State Inactive
	;do nothing
EndState
