ScriptName _arcDragonMoundExplosionActScript Extends ObjectReference
	
Explosion Property _arcDragonMoundExpDirtSml Auto

Auto State Active
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Inactive")
		
		PlaceAtMe(_arcDragonMoundExpDirtSml)
	EndEvent
EndState

State Inactive
	;do nothing
EndState
