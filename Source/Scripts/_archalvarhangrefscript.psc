ScriptName _arcHalvarHangRefScript Extends _arcHangRefScript

Keyword Property _arcHangKeyword Auto
Keyword Property LinkCustom01 Auto
Spell Property _arcHangActorSpell Auto

Auto State Inactive
	;do nothing
EndState

State Hanging
	Event OnLoad()
		Busy = True
		
		Disable()
		BlockActivation(True)
	
		ObjectReference HangRef = GetLinkedRef(_arcHangKeyword)
		ObjectReference DummyRef = HangRef.GetLinkedRef()
		ObjectReference NavcutRef = HangRef.GetLinkedRef(LinkCustom01)
		
		If IsDead()
			Resurrect()
		EndIf
		
		GoToState("Moving")
		NavcutRef.Disable()
		Utility.Wait(0.1)
		MoveTo(HangRef, 0.0, 0.0, 192.0)
		KillEssential()
		Enable()
		
		While !Is3DLoaded()
			Utility.Wait(0.1)
		EndWhile
		
		SetAlpha(0.0)
		Utility.Wait(0.1)
		NavcutRef.Enable()
		GoToState("Hanging")
		
		If !PlayerRef.HasSpell(_arcHangActorSpell)
			_arcHangActorSpell.Cast(Self, PlayerRef)
		EndIf
		
		DummyRef.Enable()
		
		ApplyHavokImpulse(0.0, 0.0, -1.0, 1.0)
		
		While !HangRef.Is3DLoaded()
			Utility.Wait(0.1)
		EndWhile
		
		Game.AddHavokBallAndSocketConstraint(Self, "Canine_Neck2", HangRef, "NeckNode")
		Game.AddHavokBallAndSocketConstraint(Self, "Canine_Tail3", DummyRef, "TailNode")
		Game.AddHavokBallAndSocketConstraint(Self, "Canine_LFrontLegPalm", DummyRef, "PawLNode")
		Game.AddHavokBallAndSocketConstraint(Self, "Canine_RFrontLegPalm", DummyRef, "PawRNode")
		
		RemoveAllItems(abRemoveQuestItems = True)
		Utility.Wait(3.0)
		
		DummyRef.Disable()
		
		ApplyHavokImpulse(0.0, 0.0, -1.0, 1.0)
		
		BlockActivation(False)
		SetAlpha(1.0, True)
		
		Busy = False
	EndEvent
	
	Event OnUnload()
		PlayerRef.DispelSpell(_arcHangActorSpell)
	EndEvent
	
	Event OnCellAttach()
		OnLoad()
	EndEvent
	
	Event OnCellDetach()
		PlayerRef.DispelSpell(_arcHangActorSpell)
	EndEvent
EndState

State Moving
	;do nothing
EndState
