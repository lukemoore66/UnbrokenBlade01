ScriptName _arcFBQ001DragonMoundRefScript Extends ObjectReference

Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto
ObjectReference Property PlayerRef Auto
Sound Property _arcDragonMoundSFXLP Auto
Explosion Property _arcDragonMoundExplosion Auto
Activator Property _arcDragonMoundFXAct Auto
Explosion Property _arcDragonMoundExpDirtLrg Auto
Explosion Property FakeForceBallLite1024 Auto
Explosion Property FakeForceBall1024 Auto
EffectShader Property DragonResDirtFXS Auto
EffectShader Property DragonHolesResFXS Auto
Sound Property _arcDragonMoundExitFSSFX Auto
Sound Property _arcDragonMoundExplosionSFX Auto

ObjectReference kDirtCapRef
ObjectReference kLightRef
ObjectReference kPreFXRef
Actor kDragonRef

Int SoundInstance = -1

State Inactive
	;do nothing
EndState

Auto State Active
	Event OnCellLoad()
		kDirtCapRef = GetLinkedRef(LinkCustom01)
		kDragonRef = GetLinkedRef(LinkCustom02) as Actor
		kLightRef = GetLinkedRef(LinkCustom03)
		
		kLightRef.Enable()
			
		kDragonRef.SetRestrained(True)
		kDragonRef.SetGhost(True)
		PlayAnimation("DragonIsHome")
			
		kPreFXRef = PlaceAtMe(_arcDragonMoundFXAct)
		SoundInstance = _arcDragonMoundSFXLP.Play(Self)
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Inactive")
		
		_arcDragonMoundExplosionSFX.Play(PlayerRef)
		Utility.Wait(1.5)
		kDirtCapRef.PlaceAtMe(_arcDragonMoundExpDirtLrg)
		Utility.Wait(1.0)
		kDirtCapRef.PlaceAtMe(_arcDragonMoundExpDirtLrg)
		PlaceAtMe(FakeForceBall1024, 1)
		Game.ShakeCamera(None, 1.0, 4.0)
		Game.ShakeController(1.0, 1.0, 2.5)
		kPreFXRef.PlayAnimation("StopEffect")
		PlaceAtMe(_arcDragonMoundExplosion)
		Utility.Wait(1.0)
		Sound.StopInstance(SoundInstance)
		kLightRef.Disable()
		kDirtCapRef.Disable()
		kDragonRef.SetRestrained(False)
		kDragonRef.SetGhost(False)
		PlayAnimation("DragonExit")
		_arcDragonMoundExitFSSFX.Play(kDragonRef)
		DragonResDirtFXS.Play(kDragonRef)
		Utility.Wait(0.1)
		DragonResDirtFXS.Stop(kDragonRef)
		PlaceAtMe(FakeForceBallLite1024)
		Utility.Wait(1.5)
		PlaceAtMe(FakeForceBall1024)
		Utility.Wait(1.5)
		PlaceAtMe(FakeForceBallLite1024)
		DragonHolesResFXS.Play(kDragonRef)
		Utility.Wait(15.0)
		DragonHolesResFXS.Stop(kDragonRef)
		
		kLightRef.Delete()
		kDirtCapRef.Delete()
		kPreFXRef.Delete()
		
		kDirtCapRef = None
		kLightRef = None
		kPreFXRef = None
		kDragonRef = None
	EndEvent
EndState

Function Deactivate()
	GoToState("Inactive")
	
	kDirtCapRef = GetLinkedRef(LinkCustom01)
	kDragonRef = GetLinkedRef(LinkCustom02) as Actor
	kLightRef = GetLinkedRef(LinkCustom03)
	
	If kLightRef
		kLightRef.Delete()
	EndIf
	
	If kDirtCapRef
		kDirtCapRef.Delete()
	EndIf
	
	If kDragonRef
		kDragonRef.Delete()
	EndIf
	
	If kPreFXRef
		kPreFXRef.Delete()
	EndIf
	
	If SoundInstance != -1
		Sound.StopInstance(SoundInstance)
	EndIf
	
	kDirtCapRef = None
	kDragonRef = None
	kLightRef = None
	kPreFXRef = None
EndFunction
