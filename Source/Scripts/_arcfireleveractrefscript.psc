ScriptName _arcFireLeverActRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto

Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto
Keyword Property LinkCustom04 Auto
Keyword Property LinkCustom05 Auto
Keyword Property LinkCustom06 Auto
Keyword Property LinkCustom07 Auto
Keyword Property LinkCustom08 Auto
Keyword Property LinkCustom09 Auto
Keyword Property LinkCustom10 Auto
Keyword Property LinkCustom11 Auto
Keyword Property LinkCustom12 Auto
Keyword Property LinkCustom13 Auto

Quest Property _arcGuardianFireSceneQuest Auto
Quest Property _arcGuardianObjectiveSceneQuest Auto

ObjectReference _arcPedestalDoorBeam01Ref
ObjectReference _arcFireLanternTrapActLightRef
ObjectReference _arcFire01CandleWall01ActLightRef
ObjectReference _arcFire02SconceWithBaseActLightRef
ObjectReference _arcFire03CandleWall02ActLightRef
ObjectReference _arcFire04SconceLargeFloorActLightRef
ObjectReference _arcFire05CandleHornFloorActLightRef
ObjectReference _arcFire06LanternActLightRef
ObjectReference _arcFire07CandleWall01ActLightRef
ObjectReference _arcFire08LanternHangingActLightRef
ObjectReference _arcFire09CandleWall02ActLightRef
ObjectReference _arcFire10SconceWithBaseActLightRef
ObjectReference _arcFire11SconceWithBaseActLightRef
ObjectReference _arcFireOwlDoorActivateMarker01Ref

Int ActivationCount = -1

Auto State Waiting
	Event OnLoad()
		_arcPedestalDoorBeam01Ref = GetLinkedRef()
		_arcFireLanternTrapActLightRef = GetLinkedRef(LinkCustom01)
		_arcFire01CandleWall01ActLightRef = GetLinkedRef(LinkCustom02)
		_arcFire02SconceWithBaseActLightRef = GetLinkedRef(LinkCustom03)
		_arcFire03CandleWall02ActLightRef = GetLinkedRef(LinkCustom04)
		_arcFire04SconceLargeFloorActLightRef = GetLinkedRef(LinkCustom05)
		_arcFire05CandleHornFloorActLightRef = GetLinkedRef(LinkCustom06)
		_arcFire06LanternActLightRef = GetLinkedRef(LinkCustom07)
		_arcFire07CandleWall01ActLightRef = GetLinkedRef(LinkCustom08)
		_arcFire08LanternHangingActLightRef = GetLinkedRef(LinkCustom09)
		_arcFire09CandleWall02ActLightRef = GetLinkedRef(LinkCustom10)
		_arcFire10SconceWithBaseActLightRef = GetLinkedRef(LinkCustom11)
		_arcFire11SconceWithBaseActLightRef = GetLinkedRef(LinkCustom12)
		_arcFireOwlDoorActivateMarker01Ref = GetLinkedRef(LinkCustom13)
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		If _arcGuardianFireSceneQuest.IsRunning()
			Return
		EndIf
		
		If !_arcGuardianObjectiveSceneQuest.IsCompleted()
			Return
		EndIf
		
		GoToState("Busy")
		
		;always increment the activation count
		ActivationCount += 1
		
		Utility.Wait(1.0)
		
		;if any lights are enabled
		;try to play the scene
		
		;individually check each light, this seems to be faster
		;probably because papyrus passes each parameter in an
		;'if' statement as an argument to a function, which essentially
		;makes it push and pop tons of data on and off the stack
		If !_arcPedestalDoorBeam01Ref.IsDisabled()
			TryPlayScene()
			Return
		EndIf
		
		If !_arcFireLanternTrapActLightRef.IsDisabled()
			TryPlayScene()
			Return
		EndIf
		
		If !_arcFire01CandleWall01ActLightRef.IsDisabled()
			TryPlayScene()
			Return
		EndIf
		
		If !_arcFire02SconceWithBaseActLightRef.IsDisabled()
			TryPlayScene()
			Return
		EndIf
		
		If !_arcFire03CandleWall02ActLightRef.IsDisabled()
			TryPlayScene()
			Return
		EndIf
		
		If !_arcFire04SconceLargeFloorActLightRef.IsDisabled()
			TryPlayScene()
			Return
		EndIf
		
		If !_arcFire05CandleHornFloorActLightRef.IsDisabled()
			TryPlayScene()
			Return
		EndIf
		
		If !_arcFire06LanternActLightRef.IsDisabled()
			TryPlayScene()
			Return
		EndIf
		
		If !_arcFire07CandleWall01ActLightRef.IsDisabled()
			TryPlayScene()
			Return
		EndIf
		
		If !_arcFire08LanternHangingActLightRef.IsDisabled()
			TryPlayScene()
			Return
		EndIf
		
		If !_arcFire09CandleWall02ActLightRef.IsDisabled()
			TryPlayScene()
			Return
		EndIf
		
		If !_arcFire10SconceWithBaseActLightRef.IsDisabled()
			TryPlayScene()
			Return
		EndIf
		
		If !_arcFire11SconceWithBaseActLightRef.IsDisabled()
			TryPlayScene()
			Return
		EndIf
		
		_arcGuardianFireSceneQuest.CompleteQuest()
		
		_arcFireOwlDoorActivateMarker01Ref.Activate(Self)
		
		GoToState("Complete")
	EndEvent
EndState

State Busy
	;do nothing
EndState

State Complete
	;do nothing
EndState

Event OnUnload()
	_arcPedestalDoorBeam01Ref = None
	_arcFireLanternTrapActLightRef = None
	_arcFire01CandleWall01ActLightRef = None
	_arcFire02SconceWithBaseActLightRef = None
	_arcFire03CandleWall02ActLightRef = None
	_arcFire04SconceLargeFloorActLightRef = None
	_arcFire05CandleHornFloorActLightRef = None
	_arcFire06LanternActLightRef = None
	_arcFire07CandleWall01ActLightRef = None
	_arcFire08LanternHangingActLightRef = None
	_arcFire09CandleWall02ActLightRef = None
	_arcFire10SconceWithBaseActLightRef = None
	_arcFire11SconceWithBaseActLightRef = None
	_arcFireOwlDoorActivateMarker01Ref = None
EndEvent

Function TryPlayScene()
	;this will only play the scene on every third pull of the lever
	;as it will be > 0 if we are not on a multiple of 3
	If (ActivationCount % 3)
		GoToState("Waiting")
		Return
	EndIf
	
	_arcGuardianFireSceneQuest.Start()
	
	GoToState("Waiting")
EndFunction
