ScriptName _arcOdeliaEntryTrigGESQuestRefScript Extends ObjectReference

Actor Property PlayerRef Auto
Spell Property _arcGuardianFlamesSpell Auto
Quest Property _arcOdeliaEntrySceneQuest Auto
Keyword Property LinkCustom01 Auto

Event OnTriggerEnter(ObjectReference akTriggerRef)
	;only do things if we have finished the entry scene quest
	If !_arcOdeliaEntrySceneQuest.IsCompleted()
		Return
	EndIf
	
	Actor ActorRef = akTriggerRef as Actor
	
	If !ActorRef
		Return
	EndIf
	
	;if the player enters the trigger
	;make sure they are allowed to activate the external pullchain
	If ActorRef == PlayerRef
		(GetLinkedRef(LinkCustom01) as _arcGESQuestPullChainExtRefScript).BlockActivation = False
	EndIf
	
	ActorRef.DispelSpell(_arcGuardianFlamesSpell)
EndEvent

Event OnTriggerLeave(ObjectReference akTriggerRef)
	;only do things if we have finished the entry scene quest
	If !_arcOdeliaEntrySceneQuest.IsCompleted()
		Return
	EndIf

	Actor ActorRef = akTriggerRef as Actor
	
	If !ActorRef
		Return
	EndIf
	
	;if the player exits the trigger
	;make sure they are not allowed to activate the external pullchain
	If ActorRef == PlayerRef
		(GetLinkedRef(LinkCustom01) as _arcGESQuestPullChainExtRefScript).BlockActivation = True
	EndIf
	
	;this is a quick way of determining if we have not banished the guardian
	;as the external teleport trigger is only enabled once we have banished him
	If GetLinkedRef().IsDisabled() && Is3DLoaded()
		_arcGuardianFlamesSpell.Cast(Self, ActorRef)
	EndIf
EndEvent
