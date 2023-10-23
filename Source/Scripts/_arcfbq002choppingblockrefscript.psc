ScriptName _arcFBQ002ChoppingBlockRefScript Extends ObjectReference

Idle Property IdleHeadChop Auto
Keyword property isExecutioner Auto
Keyword property isExecutionerGuard Auto

ObjectReference kExecutionerActor
ObjectReference kExecutioneeActor
ObjectReference kExecutionGuardActor

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		If (akActionRef.HasKeyword(isExecutioner))
			kExecutionerActor = akActionRef
		ElseIf (akActionRef.HasKeyword(isExecutionerGuard))
			kExecutionGuardActor = akActionRef
		Else
			kExecutioneeActor = akActionRef
		EndIf
		
		If (kExecutioneeActor && kExecutionGuardActor && kExecutionerActor)
			GoToState("Ready")
		EndIf
	EndEvent
EndState

State Ready
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Running")
		RegisterForSingleUpdate(0.5)
	EndEvent
EndState

State Running
	;do nothing
EndState

Event OnUpdate()
	If (kExecutioneeActor && kExecutionerActor)		
		Utility.Wait(0.5)
		
		kExecutioneeActor.AddDependentAnimatedObjectReference(kExecutionerActor)
		kExecutioneeActor.AddDependentAnimatedObjectReference(kExecutionGuardActor)
		
		(kExecutioneeActor as Actor).PlayIdle(IdleHeadChop)
		Utility.Wait(2.0)
		
		kExecutioneeActor.RemoveDependentAnimatedObjectReference(kExecutionerActor)
		kExecutioneeActor.RemoveDependentAnimatedObjectReference(kExecutionGuardActor)
		
		kExecutioneeActor = None
		kExecutionerActor = None
		kExecutionGuardActor = None
		
		GoToState("Waiting")
	EndIf
EndEvent
