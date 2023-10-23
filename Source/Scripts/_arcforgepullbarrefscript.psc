ScriptName _arcForgePullbarRefScript Extends ObjectReference

Int Property NumPillarsSolved = 0 Auto Hidden
Int Property PillarCount = 0 Auto
Bool Property PuzzleSolved = False Auto Hidden
Keyword Property LinkCustom01 Auto

ObjectReference Property RefActOnSuccess Auto Hidden
ObjectReference Property RefActOnFailure Auto Hidden

Auto State Waiting
	Event OnLoad()
		RefActOnSuccess = GetLinkedRef()
		RefActOnFailure = GetLinkedRef(LinkCustom01)
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		GoToState("Busy")
		
		If NumPillarsSolved == PillarCount
			PuzzleSolved = True
			
			RefActOnSuccess.Activate(Self)
			
			PlayAnimationandWait("Pull", "Reset")
		
			GotoState("Waiting")
			
			Return
		EndIf
		
		PuzzleSolved = False
		
		RefActOnFailure.Activate(Self)
		
		PlayAnimationandWait("Pull", "Reset")
		
		GotoState("Waiting")
	EndEvent
EndState

State Busy
	;do nothing
EndState

Event OnUnload()
	RefActOnSuccess = None
	RefActOnFailure = None
EndEvent
