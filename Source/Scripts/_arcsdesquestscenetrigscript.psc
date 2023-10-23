ScriptName _arcSDESQuestSceneTrigScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Keyword Property _arcSDEivindSceneQuestKeyword Auto
Int Property TriggerEnum Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef != PlayerRef
		Return
	EndIf
	
	_arcSDEivindSceneQuestKeyword.SendStoryEvent(akRef1 = Self, aiValue1 = TriggerEnum)
EndEvent
