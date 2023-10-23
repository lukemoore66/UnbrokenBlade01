ScriptName _arcBurnLetterActScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Form Property FXFire02 Auto
Form Property _arcNote01BloodHighPoly Auto
Form Property _arcArminahLetter Auto

ObjectReference LetterRef
ObjectReference FireRef

Event OnActivate(ObjectReference akActionRef)
	If akActionRef != PlayerRef
		Return
	EndIf
	
	DisableNoWait()
	
	PlayerRef.RemoveItem(_arcArminahLetter, abSilent = True)
	
	LetterRef = PlaceAtMe(_arcNote01BloodHighPoly)
	
	Utility.Wait(1.0)
	
	FireRef = PlaceAtMe(FXFire02)
EndEvent

Event OnCellDetach()
	LetterRef.Delete()
	FireRef.Delete()
EndEvent
