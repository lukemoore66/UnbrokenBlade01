ScriptName _arcSceneActorManagerQuestScript Extends Quest

_arcQuestActorAliasScript Property Actor01 Auto
_arcQuestActorAliasScript Property Actor02 Auto
_arcQuestActorAliasScript Property Actor03 Auto
_arcQuestActorAliasScript Property Actor04 Auto
_arcQuestActorAliasScript Property Actor05 Auto
_arcQuestActorAliasScript Property Actor06 Auto
_arcQuestActorAliasScript Property Actor07 Auto
_arcQuestActorAliasScript Property Actor08 Auto
_arcQuestActorAliasScript Property Actor09 Auto
_arcQuestActorAliasScript Property Actor10 Auto
_arcQuestActorAliasScript Property Actor11 Auto
_arcQuestActorAliasScript Property Actor12 Auto
_arcQuestActorAliasScript Property Actor13 Auto
_arcQuestActorAliasScript Property Actor14 Auto
_arcQuestActorAliasScript Property Actor15 Auto
_arcQuestActorAliasScript Property Actor16 Auto

GlobalVariable Property WIEventsEnabled  Auto
GlobalVariable Property WEEnabled  Auto

Float Property WIEventsEnabledState  Auto Hidden
Float Property WEEnabledState  Auto Hidden

Function DisableActors()
	Actor01.TryToDisable()
	Actor02.TryToDisable()
	Actor03.TryToDisable()
	Actor04.TryToDisable()
	Actor05.TryToDisable()
	Actor06.TryToDisable()
	Actor07.TryToDisable()
	Actor08.TryToDisable()
	Actor09.TryToDisable()
	Actor10.TryToDisable()
	Actor11.TryToDisable()
	Actor12.TryToDisable()
	Actor13.TryToDisable()
	Actor14.TryToDisable()
	Actor15.TryToDisable()
	Actor16.TryToDisable()
EndFunction

Function EnableActors()
	Actor01.TryToEnable()
	Actor02.TryToEnable()
	Actor03.TryToEnable()
	Actor04.TryToEnable()
	Actor05.TryToEnable()
	Actor06.TryToEnable()
	Actor07.TryToEnable()
	Actor08.TryToEnable()
	Actor09.TryToEnable()
	Actor10.TryToEnable()
	Actor11.TryToEnable()
	Actor12.TryToEnable()
	Actor13.TryToEnable()
	Actor14.TryToEnable()
	Actor15.TryToEnable()
	Actor16.TryToEnable()
EndFunction

Function DisableWorldEvents()
	WIEventsEnabledState = WIEventsEnabled.GetValue()
	WEEnabledState = WEEnabled.GetValue()
	
	WIEventsEnabled.SetValue(0.0)
	WEEnabled.SetValue(0.0)
EndFunction

Function EnableWorldEvents()
	WIEventsEnabled.SetValue(WIEventsEnabledState)
	WEEnabled.SetValue(WEEnabledState)
EndFunction
