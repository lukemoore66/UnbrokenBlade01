ScriptName _arcCheckForLoadRefScript Extends ObjectReference

Bool Property HasLoaded = False Auto

;the cell will reset on reset anyway
;when this script resets, so no need for
;anything else
State NotLoaded
	;check on cell detach as this is when
	;the game's reset timer starts
	Event OnCellDetach()
		GoToState("Loaded")
		HasLoaded = True
	EndEvent
EndState

State Loaded
	;do nothing
EndState
