;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname _arc_QF__arcLumberCampSceneQu_05E50298 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ThalmorAgent02BasementMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent02BasementMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorVoice
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorVoice Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SearchHeadTrackMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SearchHeadTrackMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BasementWindowExt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BasementWindowExt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eivind
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eivind Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExtMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExtMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EivindLetsGoMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EivindLetsGoMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorAgent01UpstairsMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent01UpstairsMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExtraActor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExtraActor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorFleeMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorFleeMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LumberCampDoorExt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LumberCampDoorExt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorLookFarMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorLookFarMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BasementWindowExtMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BasementWindowExtMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorAgent02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorAgent01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OpenDoorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OpenDoorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorAgent02UpstairsMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent02UpstairsMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EivindBasementMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EivindBasementMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorAgent01BasementMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent01BasementMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExtLookFarMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExtLookFarMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LumberCampDoorInt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LumberCampDoorInt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SearchIdleMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SearchIdleMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BasementObjectiveMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BasementObjectiveMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BasementWindowInt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BasementWindowInt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY UpstairsMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_UpstairsMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;shut down stage
;this stage is set in stage 150 of _arcQuest003

;set thalmor agent 2 aggression back to previous value
ThalmorAgent02.TryResetAggression()

;stop this quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;negotiate scene
;thalmor have entered lumbercamp
;set at the end of phase 5 of _arcLumberCampSceneQuestNegotiate02Scene

;set dor to the active state
;this will open it / play sounds / animate
;and set it to detect when thalmor open it when leaving
LumberCampDoorInt.GoToState("Active")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;the thalmor have started knocking
;this stage is set in stage 60 of _arcquest003

;set the aggression of thalmor agent 2
ThalmorAgent02.TrySetAggression(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;negotiate scene
;eivind potion force greet complete
;set at the end of _arcLumberCampSceneQuestEivindFGPotionBranchStart topic

;give player the potion
PlayerRef.AddItem(_arcInvisibilityPotion)

;force start the next negotiate scene
_arcLumberCampSceneQuestNegotiate02Scene.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;negotiate scene
;eivind potion force greet active
;set at the end of phase 3 of _arcLumberCampSceneQuestNegotiateScene

;evaluate eivind's package so he force greets
(Alias_Eivind.GetReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;the player has left the lumber camp after engaging in combat with the thalmor
;this stage is set in stage 120 of _arcQuest003
;it is used to stop phase 1 of _arcLumberCampSceneQuestFight02Scene once
;the player leaves the lumber camp
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;negotiate scene
;eivind ready to open door
;this stage is set at the start of phase 4 of _arcLumberCampSceneQuestNegotiate02Scene

;stop knocking
ThalmorVoice.GoToState("Inactive")

;play unlock sound
LumberCampDoorInt._arcLumberCampDoorUnlockSFX.Play(LumberCampDoorInt.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;start up stage
;this fragment script is structured so that:
;all fragments for the negotiate scene are first
;all fragments for the sneak scene are next
;all fragments for the fight scene are last

;when the player leaves the lumber camp, the stage is set to 120 in _arcQuest003
;this quest is then stopped. This is triggered by the OnChangeLocation event in the
;stage60 stage in the player alias script on _arcQuest003
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;negotiate scene
;we have reached the end of _arcLumberCampSceneQuestNegotiate02Scene
;the thalmor have left
;this stage is set at the end of phase 23 of _arcLumberCampSceneQuestNegotiate02Scene

;set the lumber camp door to the inactive state
LumberCampDoorInt.GoToState("Inactive")

;force start part 3 of the negotiate scene
_arcLumberCampSceneQuestNegotiate03Scene.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef Auto

Form Property _arcInvisibilityPotion Auto

_arcQuest003ThalmorVoiceAliasScript Property ThalmorVoice Auto

Scene Property _arcLumberCampSceneQuestNegotiate02Scene  Auto  

Scene Property _arcLumberCampSceneQuestNegotiate03Scene  Auto  

Sound Property _arcLumberCampDoorUnlockSFX  Auto  

_arcQuestActorAliasScript Property ThalmorAgent02 Auto

_arcLCSQuestLumberCampDoorIntScript Property LumberCampDoorInt Auto
