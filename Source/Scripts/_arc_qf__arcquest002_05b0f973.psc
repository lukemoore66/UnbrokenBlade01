;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 68
Scriptname _arc_QF__arcQuest002_05B0F973 Extends Quest Hidden

;BEGIN ALIAS PROPERTY VictimHalvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimHalvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Telisha
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Telisha Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmugglersDenMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmugglersDenMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LumberCampDoorExtKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LumberCampDoorExtKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tyra
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tyra Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sentry02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sentry02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TavernCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TavernCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TyraJournal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TyraJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmugglersDenEnableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmugglersDenEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Calder
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Calder Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sentry01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sentry01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TyraContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TyraContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TelishaJournal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TelishaJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Halvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Halvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TavernLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TavernLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExteriorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExteriorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExteriorMarkerHalvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExteriorMarkerHalvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EivindLumberCampExtMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EivindLumberCampExtMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditJournal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimCalder
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimCalder Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DRAGON
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DRAGON Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimBloodMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimBloodMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eivind
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eivind Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArcadiaRing
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArcadiaRing Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TavernMeetMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TavernMeetMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmugglersDen
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SmugglersDen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditDead
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditDead Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmugglersDenCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmugglersDenCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimTelisha
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimTelisha Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;start up stage
;started at the shutdown stage of _arcquest001 (stage 180)

;set _arcQuestTelishaAliasScript to the DisableWhenAble state
;so she will move to the northern cave as soon as she is not loaded
Telisha.GoToState("Missing")

;set eivind as an ally to the player
Eivind.SetAlly(True)

;set calder and halvar to be allies of the sentries
(Alias_Calder.GetReference() as Actor).AddToFaction(_arcSentryAllyFaction)
(Alias_Halvar.GetReference() as Actor).AddToFaction(_arcSentryAllyFaction)

;reset outside sentries
Sentry01.TryReset()
Sentry02.TryReset()

;set the sentries to be allies of calder and halvar
Sentry01.GoToState("Active")
Sentry02.GoToState("Active")

;get enable marker ref
_arcCheckForLoadRefScript EnableMarker = Alias_SmugglersDenEnableMarker.GetReference() as _arcCheckForLoadRefScript

;enable disabled objects in smuggler's den
Alias_SmugglersDenEnableMarker.GetReference().Enable()

;reset smuggler's den if needed
;this will not reset the enable state of objects
If EnableMarker.HasLoaded
    arcSmugglersDen.Reset()
EndIf

;unset smuggler's den as cleared
_arcSmugglersDenLocation.SetCleared(False)

;get eivind's ref
Actor EivindRef = Alias_Eivind.GetReference() as Actor

;have eivind go to tavern / follow player immediately
(Alias_Eivind.GetReference() as Actor).EvaluatePackage()

;set the stage
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;the player has entered dragon bridge

;start the dragon attack scene quest
_arcDragonAttackSceneQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_60
Function Fragment_60()
;BEGIN CODE
;if we have telisha's alias, she is still alive
;set her to non- essential
((Alias_Telisha.GetReference() as Actor).GetBaseObject() as ActorBase).SetEssential(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_63
Function Fragment_63()
;BEGIN CODE
;if the victim is not calder

;enable blood marker
;this needs to be done here, before we enter smugglers den
;as it will not work otherwise as decals wont load in
Alias_VictimBloodMarker.GetReference().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_64
Function Fragment_64()
;BEGIN CODE
;set at the end of:
;_arcQuest002EivindDragonbornBranchYesTopic,
; _arcQuest002EivindFG02DragonbornWhat,
;_arcQuest002EivindFG02WABranch

;complete the talk to eivind objective
;before stopping / completing the quest
SetObjectiveCompleted(80)

;stop / complete the quest
SetStage(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
;move eivind to the player if he is following
Eivind.TryMoveTo(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;the player has obtained the ring

;complete objective to obtain ring from tyra's corpse
SetObjectiveCompleted(30)

;show objective to discover the fate of telisha
SetObjectiveDisplayed(40)

;set the next stage
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;the player has entered smuggler's den

;set telisha's state to inactive
Telisha.GoToState("Inactive")

;have tyra go to the correct state
Tyra.GoToState("Stage20")

;stop the calder smuggle scene quest
;there is a chance we may arrive too early before the smuggler can notify them
_arcCalderSmuggleSceneQuest.Stop()

;disable all potential victims
Alias_Telisha.GetReference().Disable()
Alias_Calder.GetReference().Disable()
Alias_Halvar.GetReference().Disable()

;start the death scene quest
_arcSDDeathSceneQuest.Start()

;set calder and halvar to not be allies of the sentries
(Alias_Calder.GetReference() as Actor).RemoveFromFaction(_arcSentryAllyFaction)
(Alias_Halvar.GetReference() as Actor).RemoveFromFaction(_arcSentryAllyFaction)

;set the sentries to not be allies of calder and halvar
Sentry01.GoToState("Inactive")
Sentry02.GoToState("Inactive")

;complete the current objective
SetObjectiveCompleted(0)

;show objective to discover the fate of telisha and ring
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;set from stage 80
;halvar is victim

;place telisha
Telisha.TryMoveTo(Alias_ExteriorMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
;always disable the outside sentries
;thier 'actor only collision' stays enabled otherwise
;enable and remove them when we enter the tavern in stage 120
Sentry01.TryToDisable()
Sentry02.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;set from stage 80
;telisha is victim

Halvar.TryMoveTo(Alias_ExteriorMarkerHalvar.GetReference())

Calder.TryMoveTo(Alias_ExteriorMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;the dragon has started attacking
;this stage is set by stage 20 of _arcDragonAttackSceneQuest

;complete objective to talk to eivind
SetObjectiveCompleted(60)

;show objective to defeat the dragon
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;main death scene over
;set by stage 80 of _arcSDDeathSceneQuest
;victim was telisha

;set the player to the correct state
Player.GoToState("Stage70")

;set calder and halvar as non-essential
(Alias_Calder.GetReference().GetBaseObject() as ActorBase).SetEssential(False)
(Alias_Halvar.GetReference().GetBaseObject() as ActorBase).SetEssential(False)

;complete discover fate of telisha
SetObjectiveCompleted(40)

;complete discover the fate of telisha and the ring
SetObjectiveCompleted(10)

;set objective to return to the four shields
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
;if the victim is not telisha and she is not dead
;disable the tavern trespass quest forever
;as she has forgiven you, and will let you into the tavern when you get there
_arcTavernTrespassQuest.EnableTrespass(False)

;if the victim is telisha, trespass will be temporarily disabled during the
;dragon attack scene quest
;this is done conditionally in the _arcTavernTrespassQuestNode sm event node
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;the player has obtained the ring

;complete objective to obtain ring from tyra's corpse
SetObjectiveCompleted(30)

;show objective to discover the fate of telisha
SetObjectiveDisplayed(40)

;set the next stage
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;the player has entered the tavern
;set by stage 10 in _arcDragonAttackSceneQuest

;enable and remove sentries now that we definitely can't see them
Sentry01.TryToEnable()
Sentry01.TryToEnable()
Sentry01.TryRemove()
Sentry01.TryRemove()

;complete the return to tavern objective
SetObjectiveCompleted(50)

;show the speak to eivind objective
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;the player has left the tavern
;set by stage 30 in _arcDragonAttackSceneQuest

;clear objective to talk to eivind if needed
If !IsObjectiveCompleted(60)
    SetObjectiveDisplayed(60, False)
EndIf

;show objective to defeat the dragon
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
;eivind's final dialogue options
;set at the start of _arcQuest002EivindFG02BranchTopicStart
;after eivind's forcegreet
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;set from stage 80
;calder is victim
;and eivind did not force greet inside smugglers den

;place eivind
Eivind.TryMoveTo(Alias_ExteriorMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;the player has left smuggler's den

;fade in the game to hide any movement of actors
Game.FadeOutGame(False, True, 3.0, 1.0)

;disable all actors
Alias_Eivind.GetReference().Disable()
Alias_Telisha.GetReference().Disable()
Alias_Calder.GetReference().Disable()
Alias_Halvar.GetReference().Disable()

;complete _arcSDDeathSceneQuest
_arcSDDeathSceneQuest.SetStage(90)

;set the player to the correct state
Player.GoToState("Stage80")

;clear smugglers den location
Alias_SmugglersDen.GetLocation().SetCleared()

;set the stage
SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_65
Function Fragment_65()
;BEGIN CODE
;if the victim is not telisha
;we know that calder tried to help her
;remove calder and halvar from the tavern trespass faction

(Alias_Calder.GetReference() as Actor).RemoveFromFaction(_arcTavernTrespassFaction)
(Alias_Halvar.GetReference() as Actor).RemoveFromFaction(_arcTavernTrespassFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
;telisha is the victim
;enumerate the victim in the conditional variable in _arcDialogueQuest
;this allows the quest to know who the victim was

_arcDialogueQuest.VictimDialogueStatus = 3
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;set by stage 170 of this quest
;shut down stage

;add lumber camp key to player's inventory
ObjectReference LumberCampDoorExtKeyRef = Alias_LumberCampDoorExtKey.GetReference()
PlayerRef.AddItem(LumberCampDoorExtKeyRef)
LumberCampDoorExtKeyRef.EnableNoWait()

;remove eivind as a follower
Eivind.SetFollow(False)

;start _arcQuest003
_arcQuest003.Start()

;stop this quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;the player has entered combat with tyra

;show objective to defeat tyra
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
;the flashback is complete
;set by stage 80 of _arcDragonAttackSceneQuest
;eivind forcegreet active

;complete the defeat dragon objective
SetObjectiveCompleted(70)

;show the talk to eivind objective
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
;the player has obtained the ring

;set the stage in _arcSDDeathSceneQuest
_arcSDDeathSceneQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;main death scene over
;set by stage 80 of _arcSDDeathSceneQuest
;victim was halvar or calder

;set the player to the correct state
Player.GoToState("Stage70")

;set calder and halvar as non-essential
(Alias_Calder.GetReference().GetBaseObject() as ActorBase).SetEssential(False)
(Alias_Halvar.GetReference().GetBaseObject() as ActorBase).SetEssential(False)

;complete discover fate of telisha
SetObjectiveCompleted(40)

;complete discover the fate of telisha and the ring
SetObjectiveCompleted(10)

;set objective to return to the four shields
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
;if telisha is alive and you are in the _arcTavernTresspassFaction
;remove the player from the faction, as we are now friends with Telisha

;disable the trespass quest
_arcTavernTrespassQuest.EnableTrespass(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE _arcQuestScript
Quest __temp = self as Quest
_arcQuestScript kmyQuest = __temp as _arcQuestScript
;END AUTOCAST
;BEGIN CODE
;tyra was killed

;give tyra the ring
kmyQuest.SetRingContainer(Alias_Tyra.GetReference())

;complete the defeat tyra objective if needed
SetObjectiveCompleted(20)

;show objective to search tyra's corpse
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_57
Function Fragment_57()
;BEGIN CODE
;telisha is the victim
;enumerate the victim in the conditional variable in _arcDialogueQuest
;this allows the quest to know who the victim was

_arcDialogueQuest.VictimDialogueStatus = 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;leave smugglers den forcegreet complete

;have calder flee if he is not already dead
;do this by starting his flee quest
_arcCalderFleeQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
;telisha is the victim
;enumerate the victim in the conditional variable in _arcDialogueQuest
;this allows the quest to know who the victim was

_arcDialogueQuest.VictimDialogueStatus = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;have the player go to the correct state
Player.GoToState("Stage10")

;add smugglers den map marker to the map
Alias_SmugglersDenMapMarker.GetReference().AddToMap()

;set hurry smuggler's den objective
SetObjectiveDisplayed(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;the player has obtained the ring

;complete objective to obtain ring from tyra's corpse
SetObjectiveCompleted(30)

;show objective to discover the fate of telisha
SetObjectiveDisplayed(40)

;set the next stage
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcQuest002PlayerAliasScript Property Player Auto

_arcQuest002TyraAliasScript Property Tyra Auto

_arcQuestActorAliasScript Property Calder Auto

_arcQuestActorAliasScript Property Halvar Auto

_arcQuestTelishaAliasScript Property Telisha Auto

Quest Property _arcCalderSmuggleSceneQuest  Auto

Quest Property _arcSDDeathSceneQuest  Auto  

ReferenceAlias Property Victim  Auto  

Actor Property PlayerRef  Auto  

Quest Property _arcQuest003  Auto  

Quest Property _arcDragonAttackSceneQuest  Auto  

_arcQuestActorFollowerAliasScript Property Eivind Auto

Location Property _arcSmugglersDenLocation  Auto  

Cell Property arcSmugglersDen  Auto  

_arcTavernTrespassQuestScript Property _arcTavernTrespassQuest  Auto  

Quest Property _arcCalderFleeQuest  Auto  

_arcDialogueQuestScript Property _arcDialogueQuest  Auto  

Faction Property _arcTavernTrespassFaction  Auto  

_arcQuest002SentryAliasScript Property Sentry01 Auto

_arcQuest002SentryAliasScript Property Sentry02 Auto

Faction Property _arcSentryAllyFaction  Auto  
