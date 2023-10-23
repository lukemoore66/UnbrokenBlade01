ScriptName _arcRuneDebrisScript Extends ObjectReference  

Spell Property _arcRuneSpell Auto
FormList Property _arcRuneMarkerList Auto

Event OnCellLoad()
	RegisterForSingleUpdate(Utility.RandomFloat(0.0, 10.0))
EndEvent

Event OnUpdate()
	;get the target marker
	ObjectReference RuneMarkerRef = _arcRuneMarkerList.GetAt(Utility.RandomInt(0, 5)) as ObjectReference
	
	;make sure buth the target marker and the rune debris are both loaded
	;before casting any spells
	If GetParentCell().IsAttached() && RuneMarkerRef.GetParentCell().IsAttached()
		_arcRuneSpell.Cast(Self, RuneMarkerRef)
		RampRumble()
	Else
		UnregisterForUpdate()
		Return
	EndIf
	
	RegisterForSingleUpdate(Utility.RandomFloat(5.0, 10.0))
EndEvent

Event OnUnload()
	UnregisterForUpdate()
EndEvent

Event OnCellDetach()
	UnregisterForUpdate()
EndEvent
