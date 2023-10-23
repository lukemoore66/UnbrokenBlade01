ScriptName _arcGuardiansWisdomQuestEffectScript Extends ActiveMagicEffect

Form Property _arcGuardiansWisdomInSoundAct Auto
Form Property _arcGuardiansWisdomOutSoundAct Auto
ObjectReference Property PlayerRef Auto
ImagespaceModifier Property _arcGuardiansWisdomOutImod Auto
Keyword Property _arcGOQuestKeyword Auto
Quest Property _arcGuardianObjectiveQuest Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	_arcGuardianObjectiveQuest.Stop()
	
	While _arcGuardianObjectiveQuest.IsStopping()
		Utility.Wait(0.1)
	EndWhile
	
	PlayerRef.PlaceAtMe(_arcGuardiansWisdomInSoundAct)
	
	_arcGOQuestKeyword.SendStoryEventAndWait()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	PlayerRef.PlaceAtMe(_arcGuardiansWisdomOutSoundAct)
	_arcGuardiansWisdomOutImod.Apply(0.5)
	_arcGuardianObjectiveQuest.Stop()
EndEvent
