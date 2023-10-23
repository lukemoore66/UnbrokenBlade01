ScriptName _arcGTSQuestTrollAliasScript Extends ReferenceAlias

Scene Property _arcGuardianTrollSceneQuestScene Auto

Event OnDeath(Actor akKiller)
	_arcGuardianTrollSceneQuestScene.Stop()
EndEvent
