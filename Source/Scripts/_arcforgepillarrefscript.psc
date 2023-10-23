ScriptName _arcForgePillarRefScript Extends ObjectReference

Int Property InitialState Auto
;1 = Position 1 (owl), 2 = Position 2 (snake), 3 = Position 3 (whale)

Int Property SolveState Auto
;1 = Position 1 (owl), 2 = Position 2 (snake), 3 = Position 3 (whale)

Bool PillarSolved = False

_arcForgePullbarRefScript PullBarRef


Auto State Init
	Event OnCellLoad()
		PullBarRef = GetLinkedRef() as _arcForgePullbarRefScript
		
		If InitialState == SolveState
			PullBarRef.NumPillarsSolved += 1
			
			PillarSolved = True
		EndIf
		
		GoToState("Position0" + InitialState)
		
		PlayAnimation("StartState0" + InitialState)
	EndEvent
EndState

State Position01
	Event OnActivate(ObjectReference akActionRef)
		RotatePillarToState(2, 1)
		
		GoToState("Position02")
	EndEvent
EndState


State Position02
	Event OnActivate(ObjectReference akActionRef)
		RotatePillarToState(3, 2)
		
		GoToState("Position03")
	EndEvent
EndState


State Position03
	Event OnActivate(ObjectReference akActionRef)
		RotatePillarToState(1, 3)
		
		GoToState("Position01")
	EndEvent
EndState

State Busy
	;do nothing
EndState

Function RotatePillarToState(Int StateNumber, Int AnimEventNumber)
	GotoState("Busy")
	
	If SolveState == StateNumber
		PullBarRef.NumPillarsSolved += 1
		PillarSolved = True
		
		PlayAnimationAndWait("Trigger0" + AnimEventNumber, "Turned0" + AnimEventNumber)
		
		Return
	EndIf
	
	If !PillarSolved
		PlayAnimationAndWait("Trigger0" + AnimEventNumber, "Turned0" + AnimEventNumber)
		
		Return
	EndIf
	
	If PullBarRef.PuzzleSolved
		PullBarRef.RefActOnSuccess.Activate(PullBarRef)
		PullBarRef.PuzzleSolved = False
	EndIf
		
	PullBarRef.NumPillarsSolved -= 1
	PillarSolved = False
		
	PlayAnimationAndWait("Trigger0" + AnimEventNumber, "Turned0" + AnimEventNumber)
EndFunction
