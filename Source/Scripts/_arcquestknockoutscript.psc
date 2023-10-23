ScriptName _arcQuestKnockOutScript Extends _arcQuestScript Conditional

Int Property KnockOutStage = 0 Auto Conditional Hidden

Idle Property TG05_KnockOut Auto
Idle Property ResetRoot Auto
Sound Property _arcKnockOutSFXLP Auto

ImagespaceModifier Property _arcKnockOutToBlackImod Auto
ImagespaceModifier Property _arcKnockOutFromBlackImod Auto
ImagespaceModifier Property _arcKnockOutLoopImod Auto
ImagespaceModifier Property _arcKnockOutLoopOutImod Auto
ImagespaceModifier Property _arcKnockOutBlackImod Auto

Int Property KnockOutLoopImodCount = 3 Auto
Int Property SoundInstance = -1 Auto Hidden

Int iLoopCounter

Float WaitTime = 0.0

;start knockout timer, called through StartTimer()
;via the OnUpdate() function directly
Auto State Stage0
	;start knock out timer running
	Event OnUpdate()
		GoToState("Stage1")
		KnockOutStage = 1
		
		RegisterForSingleUpdate(WaitTime)
		WaitTime = 0.0
	EndEvent
EndState

;knockout timer running
State Stage1
	;knock out timer stopped or knockout called through KnockOut()
	;via OnUpdate() function directly
	Event OnUpdate()
		;this cancels out the knockout timer if it was still running
		UnregisterForUpdate()
		
		GoToState("Stage2")
		
		KnockOutStage = 2
	
		CancelTransformations()
		ForceDismount()
		
		Game.ForceFirstPerson()
		
		;stop the player from switching the camrea / looking around
		;but also cancel thier sneak state, as they may be stuck sneaking after being knocked out
		;this also prevents them from sneaking, unless controls are fully enabled by the GetUp() function
		;or at a later point
		Game.DisablePlayerControls(abCamSwitch = True, abLooking = True, abSneaking = True)
		
		PlayerRef.PlayIdle(TG05_KnockOut)
		
		;only shake controller if the sound is played
		If SoundInstance == -1
			SoundInstance = _arcKnockOutSFXLP.Play(PlayerRef)
			Game.ShakeController(1.0, 1.0, 0.5)
		EndIf
		
		;apply _arcKnockOutToBlackImod
		_arcKnockOutToBlackImod.Apply()
		
		;wait for _arcKnockOutToBlackImod to nearly finish
		RegisterForSingleUpdate(9.5)
	EndEvent
EndState

;knock out timer stopped or knockout called through KnockOut()
;via OnUpdate() function directly
State Stage2
	;hold on black screen
	Event OnUpdate()
		GoToState("Stage3")
		KnockOutStage = 3
		
		;pop to _arcKnockOutBlackImod from _arcKnockOutToBlackImod
		_arcKnockOutToBlackImod.PopTo(_arcKnockOutBlackImod)
		
		;hold on a black screen
		RegisterForSingleUpdate(10.0)
	EndEvent
EndState

;hold on black screen
State Stage3
	;fade from black screen
	Event OnUpdate()
		GoToState("Stage4")
		KnockOutStage = 4
		
		;stop the knock out sound
		If SoundInstance >= 0
			Sound.StopInstance(SoundInstance)
			SoundInstance = -1
		EndIf
		
		;pop to _arcKnockOutFromBlackImod from _arcKnockOutBlackImod
		_arcKnockOutBlackImod.PopTo(_arcKnockOutFromBlackImod)
		
		;wait for _arcKnockOutFromBlackImod to nearly finish
		RegisterForSingleUpdate(3.5)
	EndEvent
EndState

;fade from black screen
State Stage4
	;play first knock out loop imod
	Event OnUpdate()
		GoToState("Stage5")
		KnockOutStage = 5
	
		;pop to _arcKnockOutLoopImod from _arcKnockOutFromBlackImod
		_arcKnockOutFromBlackImod.PopTo(_arcKnockOutLoopImod)
	
		;wait for _arcKnockOutLoopImod to nearly finish
		RegisterForSingleUpdate(10.5)
	EndEvent
EndState

;loop _arcKnockOutLoopImod
State Stage5
	Event OnBeginState()
		iLoopCounter = 1
	EndEvent
	
	;loop _arcKnockOutLoopOutImod
	Event OnUpdate()
		If iLoopCounter == 1
			KnockOutStage = 6
		EndIf
		
		If iLoopCounter >= KnockOutLoopImodCount
			GoToState("Stage6")
		EndIf
		
		;pop to _arcKnockOutLoopOutImod from _arcKnockOutLoopImod
		_arcKnockOutLoopImod.PopTo(_arcKnockOutLoopImod)
		
		iLoopCounter += 1
		
		;wait for _arcKnockOutLoopImod to nearly finish
		RegisterForSingleUpdate(10.5)
	EndEvent
EndState

;play knock out loop out imod
State Stage6
	;loop knock out loop imod
	Event OnUpdate()
		GoToState("Stage7")
		KnockOutStage = 7
		
		;pop to _arcKnockOutLoopOutImod from _arcKnockOutLoopImod
		_arcKnockOutLoopImod.PopTo(_arcKnockOutLoopOutImod)
		
		;wait for _arcKnockOutLoopOutImod to finish
		RegisterForSingleUpdate(3.0)
	EndEvent
EndState

;play knock out loop exit imod
State Stage7
	;knock out sequence complete
	Event OnUpdate()
		KnockOutStage = 8
	EndEvent
EndState

Function StartTimer(Float abWaitTime = 30.0)
	WaitTime = abWaitTime
	UnregisterForUpdate()
	GoToState("Stage0")
	KnockOutStage = 0
	OnUpdate()
EndFunction

Function KnockOut()
	UnregisterForUpdate()
	GoToState("Stage1")
	KnockOutStage = 1
	Utility.Wait(1.0)
	OnUpdate()
EndFunction

Function GetUp(Bool abEnableControls)
	UnregisterForUpdate()
	GoToState("Stage0")
	KnockOutStage = 0
	
	PlayerRef.PlayIdle(ResetRoot)
	
	If abEnableControls
		Utility.Wait(0.6667)
		Game.EnablePlayerControls()
	EndIf
EndFunction

Function Cancel(Bool abGetUp, Bool abEnableControls)
	UnregisterForUpdate()
	GoToState("Stage0")
	KnockOutStage = 0
	
	_arcKnockOutToBlackImod.Remove()
	_arcKnockOutFromBlackImod.Remove()
	_arcKnockOutLoopImod.Remove()
	_arcKnockOutLoopOutImod.Remove()
	_arcKnockOutBlackImod.Remove()
	
	If SoundInstance >= 0
		Sound.StopInstance(SoundInstance)
		SoundInstance = -1
	EndIf
	
	If abGetUp
		GetUp(abEnableControls)
	EndIf
EndFunction
