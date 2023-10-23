ScriptName _arcOdeliaWordWallTrigRefScript Extends ObjectReference Conditional

Int Property EffectActive = 0 Auto Conditional Hidden

ObjectReference Property PlayerRef Auto
ImagespaceModifier Property _arcArcadiaRingLoopShortImod Auto
ImagespaceModifier Property _arcArcadiaRingOutImod Auto
Sound Property _arcWordWallScreamsSFX Auto

Int SoundInstance = -1

Auto State Inactive
	Event OnTriggerEnter(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		EffectActive = 1
		
		GoToState("Starting")
	EndEvent
EndState

State Starting
	Event OnBeginState()
		_arcArcadiaRingLoopShortImod.ApplyCrossfade(1.0)
		
		If SoundInstance == -1
			SoundInstance = _arcWordWallScreamsSFX.Play(PlayerRef)
		Else
			Sound.StopInstance(SoundInstance)
			SoundInstance = _arcWordWallScreamsSFX.Play(PlayerRef)
		EndIf
		
		ShakeRandom()
		
		RegisterForSingleUpdate(2.0)
	EndEvent
	
	Event OnUpdate()
		GoToState("Looping")
		OnUpdate()
	EndEvent
EndState

State Looping
	Event OnUpdate()
		_arcArcadiaRingLoopShortImod.ApplyCrossfade(1.0)
		
		ShakeRandom()
		
		RegisterForSingleUpdate(2.0)
	EndEvent
EndState

State Finishing
	Event OnUpdate()
		If SoundInstance != -1
			Sound.StopInstance(SoundInstance)
			SoundInstance = -1
		EndIf
		
		_arcArcadiaRingOutImod.ApplyCrossfade(1.0)
	
		GoToState("Finished")
		
		RegisterForSingleUpdate(10.0)
	EndEvent
EndState

State Finished
	Event OnUpdate()
	
		GoToState("Inactive")
		
		EffectActive = 0
	EndEvent
EndState

Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef != PlayerRef
		Return
	EndIf

	If GetState() == "Inactive"
		Return
	EndIf

	UnregisterForUpdate()
	
	GoToState("Inactive")
	
	OnTriggerEnter(akActionRef)
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	If akActionRef != PlayerRef
		Return
	EndIf
	
	GoToState("Finishing")
EndEvent

Function ShakeRandom()
	Game.ShakeCamera(PlayerRef, Utility.RandomFloat(0.0, 0.5), Utility.RandomFloat(0.0, 2.5))
	Game.ShakeController(Utility.RandomFloat(0.0, 0.25), Utility.RandomFloat(0.0, 0.25), Utility.RandomFloat(0.0, 2.5))
EndFunction
