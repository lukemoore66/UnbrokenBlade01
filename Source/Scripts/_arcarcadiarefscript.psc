ScriptName _arcArcadiaRefScript Extends Actor

Event OnSit(ObjectReference akFurnitureRef)
	ObjectReference NocturnalMarkerRef = GetLinkedRef()
	
	If akFurnitureRef != NocturnalMarkerRef
		Return
	EndIf
	
	;enable BeamFX
	NocturnalMarkerRef.GetLinkedRef().EnableNoWait()
EndEvent

Event OnGetUp(ObjectReference akFurnitureRef)
	ObjectReference NocturnalMarkerRef = GetLinkedRef()
	
	If akFurnitureRef != NocturnalMarkerRef
		Return
	EndIf
	
	;disable BeamFX
	NocturnalMarkerRef.GetLinkedRef().DisableNoWait()
EndEvent
