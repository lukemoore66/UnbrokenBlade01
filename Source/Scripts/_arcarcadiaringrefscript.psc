ScriptName _arcArcadiaRingRefScript Extends ObjectReference

ObjectReference Property TelishaLockboxRef Auto

Event OnInit()
	;we have to delay placing the ring in the lockbox when starting a new game
	;as it will not always work otherwise, possibly because persistent objects
	;are not instanced / created in the order you would want for this to happen
	RegisterForSingleUpdate(1.0)
EndEvent

Event OnUpdate()
	;put ring into telisha's lockbox
	TelishaLockboxRef.AddItem(Self)
	
	(TelishaLockboxRef as _arcTelishaLockboxRefScript).CurrentContainerRef = TelishaLockboxRef
EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	(TelishaLockboxRef as _arcTelishaLockboxRefScript).CurrentContainerRef = akNewContainer
EndEvent
