ScriptName _arcBurningCorpseHangRefScript Extends _arcHangRefScript

Spell Property _arcHangActorSpell Auto
EffectShader Property _arcBurningCorpseSmokeFXS Auto

Auto State Hanging
	Event OnLoad()
		Busy = True
	
		Disable()
		BlockActivation(True)
		
		ObjectReference Hang01Ref = GetLinkedRef()
		ObjectReference Hang02Ref = Hang01Ref.GetLinkedRef()
		ObjectReference HangDummyRef = Hang02Ref.GetLinkedRef()
		
		Resurrect()
		
		GoToState("Moving")
		Utility.Wait(0.1)
		MoveTo(HangDummyRef, 0.0, 0.0, -192.0)
		Kill()
		Enable()
		
		While !Is3DLoaded()
			Utility.Wait(0.1)
		EndWhile
		
		SetAlpha(0.0)
		Utility.Wait(0.1)
		GoToState("Hanging")
		
		If !PlayerRef.HasSpell(_arcHangActorSpell)
			_arcHangActorSpell.Cast(Self, PlayerRef)
		EndIf
		
		HangDummyRef.Enable()
		
		ApplyHavokImpulse(0.0, 0.0, -1.0, 1.0)
		
		While !Hang01Ref.Is3DLoaded() && !Hang02Ref.Is3DLoaded()
			Utility.Wait(0.1)
		EndWhile
		
		Game.AddHavokBallAndSocketConstraint(Self, "NPC L Hand [LHnd]", Hang01Ref, "AttachDummy")
		Game.AddHavokBallAndSocketConstraint(Self, "NPC R Hand [RHnd]", Hang02Ref, "AttachDummy")
		Game.AddHavokBallAndSocketConstraint(Self, "NPC Head [Head]", HangDummyRef, "HeadNode")
		Game.AddHavokBallAndSocketConstraint(Self, "NPC L Foot [Lft ]", HangDummyRef, "RFootNode")
		Game.AddHavokBallAndSocketConstraint(Self, "NPC R Foot [Rft ]", HangDummyRef, "LFootNode")
		
		Utility.Wait(3.0)
		
		HangDummyRef.Disable()
		
		ApplyHavokImpulse(0.0, 0.0, -1.0, 1.0)
		
		BlockActivation(False)
		
		SetAlpha(1.0, True)
		
		_arcBurningCorpseSmokeFXS.Play(Self)
		
		Busy = False
	EndEvent
	
	Event OnUnload()
		PlayerRef.DispelSpell(_arcHangActorSpell)
		
		_arcBurningCorpseSmokeFXS.Stop(Self)
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
