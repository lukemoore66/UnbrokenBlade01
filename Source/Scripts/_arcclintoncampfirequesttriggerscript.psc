ScriptName _arcClintonCampfireQuestTriggerScript Extends ObjectReference

Keyword Property _arcClintonCampfireQuestKeyword Auto
ReferenceAlias Property Clinton Auto
Quest Property _arcClintonCampfireQuest Auto
Scene Property _arcClintonCampfireQuestScene Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	Actor kActorRef = (akActionRef as Actor)
	If kActorRef
		_arcClintonCampfireQuestKeyword.SendStoryEvent(akRef1 = kActorRef)
	EndIf
	kActorRef = None
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	ObjectReference kClinton = Clinton.GetReference()
	If !kClinton
		Return
	EndIf
	
	If akActionRef == kClinton && !_arcClintonCampfireQuestScene.IsPlaying()
		_arcClintonCampfireQuest.Stop()
	EndIf
EndEvent
