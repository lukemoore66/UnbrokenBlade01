;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 45
Scriptname _arc_QF__arcSDDeathSceneQues_05C27A34 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CageDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CageDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CalderKneelMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CalderKneelMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FriendSceneMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FriendSceneMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TorturePoleTelisha
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TorturePoleTelisha Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HalvarKneelMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HalvarKneelMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eivind
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eivind Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HalvarKneelMarkerFreed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HalvarKneelMarkerFreed Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Telisha
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Telisha Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TorturePoleHalvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TorturePoleHalvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CalderKneelMarkerFreed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CalderKneelMarkerFreed Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Calder
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Calder Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Halvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Halvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EivindSceneMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EivindSceneMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HalvarMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HalvarMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FriendFarMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FriendFarMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EivindKneelMarkerFreed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EivindKneelMarkerFreed Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrayMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PrayMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;calder was activated by the player

;remove calder's hood
Victim.RemoveHood()

;set stage for force greet
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;eivind forcegreet complete

;set eivind to the correct state
Eivind.GoToState("Inactive")

;set stage in _arcquest002
_arcQuest002.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;eivind / calder forcegreet complete

;set stage to 80
SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;victim is telisha
;capture telisha

;disable halvar's torture pole
Alias_TorturePoleHalvar.GetReference().Disable()

;give telisha a hood
Victim.AddHood()

;set telisha to the Hanging state
_arcTelishaHangRefScript TelishaRef = Alias_Telisha.GetReference() as _arcTelishaHangRefScript
TelishaRef.GoToState("Hanging")

If !TelishaRef.Busy
    TelishaRef.OnLoad()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;the player has left smuggler's den

;set telisha back to inactive
(Alias_Telisha.GetReference() as _arcTelishaHangRefScript).GoToState("Inactive")

;set halvar back to inactive
(Alias_Halvar.GetReference() as _arcHalvarHangRefScript).GoToState("Inactive")

;return the cage to normal
CageDoor.GoToState("Inactive")

;return Halvar to normal
Halvar.GoToState("Inactive")

;stop this quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;forcegreet should now be active

;evaluate package so calder gets up
(Alias_Calder.GetReference() as Actor).EvaluatePackage()

;evaluate halvar's package
(Alias_Halvar.GetReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;calder victim forcegreet complete

;this stage does nothing, as the scene is now triggered
;in stage 20 instead
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;victim is calder
;capture calder

;give calder a hood
Victim.AddHood()

;set calder to the Stage0 state
;this sets all of his factions and assistance
Calder.GoToState("Stage0")

;get calder's ref
Actor CalderRef = Alias_Calder.GetReference() as Actor

;move calder into position
Calder.TryMoveTo(Alias_VictimMarker.GetReference())

;make sure calder sits
(Victim.GetReference() as Actor).EvaluatePackage()

;capture halvar
;get refs
Actor HalvarRef = Alias_Halvar.GetReference() as Actor
ObjectReference HalvarMarkerRef = Alias_HalvarMarker.GetReference()

;set halvar to the Active state
Halvar.GoToState("Active")

;set the cage to the correct state
CageDoor.GoToState("Active")

;move into position
HalvarRef.Disable()
HalvarRef.MoveTo(HalvarMarkerRef)
HalvarRef.Enable()

;evaluate halvar's package after moving him
HalvarRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;player has entered the scene trigger
;halvar is the victim

;place calder at friend marker
Calder.TryMoveTo(Alias_FriendFarMarker.GetReference())

;heal eivind
(Alias_Eivind.GetReference() as Actor).ResetHealthAndLimbs()

;stop eivind from following
Eivind.SetFollow(False)

;force start the scene
_arcSDDeathSceneQuestHalvarVictimScene.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;eivind forcegreet

;evaluate eivind's package
(Alias_Eivind.GetReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;victim is halvar
;capture halvar

;disable telisha's torture pole
Alias_TorturePoleTelisha.GetReference().Disable()

;set halvar to the Hanging state
_arcHalvarHangRefScript HalvarRef = Alias_Halvar.GetReference() as _arcHalvarHangRefScript
HalvarRef.GoToState("Hanging")

If !HalvarRef.Busy
    HalvarRef.OnLoad()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;calder / halvar scene complete
;calder forcegreet again

;evaluate halvar's package
(Alias_Halvar.GetReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;player has entered the scene trigger
;telisha is the victim
;eivind is close

;heal eivind
(Alias_Eivind.GetReference() as Actor).ResetHealthAndLimbs()

;stop eivind from following
Eivind.SetFollow(False)

;force start the scene
_arcSDDeathSceneQuestTelishaVictimScene.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;telisha is victim
;eivind forcegreet complete

;set stage in _arcquest002
_arcQuest002.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
;eivind removes telisha's hood
;this stage is set at the end of phase 2 of _arcSDDeathSceneQuestTelishaVictimScene

;remove telisha's hood
Victim.RemoveHood()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;the player has the ring
;this stage is set by stage 60 of _arcquest002

;set the scene trigger to the correct state
SceneTrigger.GoToState("Active")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;player has entered the scene trigger
;telisha is the victim
;eivind is far away

;place eivind at friend marker
Eivind.TryMoveTo(Alias_FriendFarMarker.GetReference())

;heal eivind
(Alias_Eivind.GetReference() as Actor).ResetHealthAndLimbs()

;stop eivind from following
Eivind.SetFollow(False)

;force start the scene
_arcSDDeathSceneQuestTelishaVictimScene.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;player has entered the scene trigger
;calder is the victim

;put calder into the Stage20 state
;this sets his factions / assistance and takes off his hood
;once he is activated by the player
Calder.GoToState("Stage20")

;heal eivind
(Alias_Eivind.GetReference() as Actor).ResetHealthAndLimbs()

;stop eivind from following
Eivind.SetFollow(False)

;force start the scene
_arcSDDeathSceneQuestCalderVictimScene.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;telisha is not victim, eivind is following
;set up eivind for his forcegreet

;set stage in _arcquest002
_arcQuest002.SetStage(70)

;set eivind to the correct state
Eivind.GoToState("Stage85")

;eivind forcegreet
SetStage(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
;telisha is not victim, eivind is not following
;all forcegreets complete

;set stage in _arcquest002
_arcQuest002.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto  

Quest Property _arcQuest002  Auto  

Form Property _arcTelishaAmulet  Auto    

Scene Property _arcSDDeathSceneQuestTelishaVictimScene  Auto  

Scene Property _arcSDDeathSceneQuestHalvarVictimScene  Auto  

Scene Property _arcSDDeathSceneQuestCalderVictimScene  Auto  

_arcSDDSSceneTriggerAliasScript Property SceneTrigger Auto

_arcSDDSQuestEivindScript Property Eivind Auto

_arcSDDSQuestCalderAliasScript Property Calder Auto

_arcSDDSQuestHalvarAliasScript Property Halvar Auto

_arcQuestActorAliasScript Property Telisha Auto

_arcSDDSQuestCageDoorAliasScript Property CageDoor Auto

_arcSDDSQuestVictimAliasScript Property Victim Auto

Form Property ExecutionHood  Auto  
