ScriptName _arcChainDraugrRefScript Extends Actor

ObjectReference Property PlayerRef Auto
Activator Property _arcChainLightAct Auto
Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
_arcGDSQuestScript Property _arcGuardianDraugrSceneQuest Auto
Faction Property _arcChainDraugrFaction Auto

;"NPC R Foot [Rft ]"
;"NPC L Foot [LLft ]"
;"NPC R Hand [RHnd]"
;"NPC L Hand [LHnd]"
String Property BodyNode = "NPC R Foot [Rft ]" Auto

;"Link01" - "Link11"
;Link11 is the base link
;Link01 is the end link
String Property ChainNode = "Link01" Auto

ObjectReference ChainRef
_arcChainTrigScript TriggerRef
_arcSummonFXScript DraugrSummonFXRef
MasterAmbushScript DraugrAmbushRef
ObjectReference LightRef

Auto State Init
	Event OnCellLoad()
		GoToState("Loading")
				
		ChainRef = GetLinkedRef(LinkCustom01)
		TriggerRef = GetLinkedRef(LinkCustom02) as _arcChainTrigScript
		DraugrSummonFXRef = (Self as ObjectReference) as _arcSummonFXScript
		DraugrAmbushRef = (Self as ObjectReference) as MasterAmbushScript
		
		BlockActivation(True)
		
		KillSilent()
		
		Enable(False)
		
		DraugrSummonFXRef.SetFactionRank(_arcChainDraugrFaction, 0)
	EndEvent
EndState

State Loading
	Event OnLoad()
		EnableAI(False)
	
		While !ChainRef.Is3DLoaded()
			Utility.Wait(0.1)
		EndWhile
				
		;delay killing, this gives the scripts attached to effects
		;attached to the AbDraugr spell time to execute without errors
		Utility.Wait(0.1)
		
		While !Game.AddHavokBallAndSocketConstraint(Self, BodyNode, ChainRef, ChainNode)
			Utility.Wait(0.1)
		EndWhile
		
		EnableAI(True)
		
		GoToState("Chained")
		
		Utility.Wait(1.0)
		
		ChainRef.SetMotionType(Motion_Dynamic, True)
		ChainRef.ApplyHavokImpulse(0.0, 0.0, 1.0, -5.0)
		ChainRef.PushActorAway(Self, 0.0)
	EndEvent
EndState

State Chained
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		GoToState("Released")
				
		;this plays the activation sound when releasing the draugr
		ChainRef.Activate(Self)
		
		Game.RemoveHavokConstraints(Self, BodyNode, ChainRef, ChainNode)
		
		_arcGuardianDraugrSceneQuest.ShowMessage()
		
		TriggerRef.ReleaseCount += 1
		
		DraugrSummonFXRef.SetFactionRank(_arcChainDraugrFaction, 1)
	EndEvent
	
	;this ensures the draugr is always attached if the draugr unloads
	Event OnUnload()
		GoToState("Loading")
	EndEvent
EndState

State Released
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != TriggerRef
			Return
		EndIf
		
		GoToState("Sarcophagus")
		
		DraugrSummonFXRef.Banish()
		
		Reset()
		
		DraugrSummonFXRef.Active = False
		
		BlockActivation(False)
		
		DraugrAmbushRef.GoToState("allDone")
		
		MoveTo(GetLinkedRef())
		
		DraugrSummonFXRef.SetFactionRank(_arcChainDraugrFaction, -1)
	EndEvent
EndState

State Sarcophagus
	Event OnActivate(ObjectReference akActionRef)	
		If akActionRef != TriggerRef
			Return
		EndIf
		
		GoToState("LightFX")
				
		LightRef = TriggerRef.PlaceAtMe(_arcChainLightAct)
		
		LightRef.Activate(Self)
	EndEvent
EndState

State LightFX
	Event OnActivate(ObjectReference akActionRef)	
		If akActionRef != LightRef
			Return
		EndIf
		
		DraugrSummonFXRef.Summon()
		
		LightRef = None
	EndEvent
	
	Event OnLoad()
		GoToState("Complete")
				
		DraugrAmbushRef.GoToState("waiting")
	
		Activate(PlayerRef)
		
		ChainRef = None
		TriggerRef = None
		DraugrAmbushRef = None
		DraugrSummonFXRef = None
	EndEvent
EndState

State Complete
	;do nothing
EndState

Function OnLoadGame()
	If GetState() == "Chained"
		GoToState("Loading")
			
		Disable()
		
		MoveToMyEditorLocation()
		
		ChainRef.Disable()
		ChainRef.Reset()
		ChainRef.Enable(False)
		
		Enable(False)
		
		Return
	EndIf
	
	If GetState() == "Released"
		DraugrSummonFXRef.Banish()
	EndIf
EndFunction
