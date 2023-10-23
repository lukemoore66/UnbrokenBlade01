;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 37
Scriptname _arc_QF__arcFlashbackQuest004_05AF2E62 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ThalmorAgent01TortureMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent01TortureMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ValronisWindMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ValronisWindMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EatFoodActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EatFoodActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ValronisDoorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ValronisDoorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ValronisAlchemyTable
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ValronisAlchemyTable Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorAgent01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HitSoundMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HitSoundMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Valronis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Valronis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Redguard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Redguard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Arminah
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Arminah Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorAgent02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorAgent02StartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent02StartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ValronisStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ValronisStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BurnLetterAct
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BurnLetterAct Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrapDoorExt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrapDoorExt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArcadiaDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArcadiaDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArminahPatrolStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArminahPatrolStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorAgent02SandboxMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent02SandboxMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorAgent01PatrolDestMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent01PatrolDestMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorAgent02GuardMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent02GuardMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WindMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WindMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrapDoorInt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrapDoorInt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArminahLetter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArminahLetter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerDestMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerDestMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;set at the end of _arcFlashbackQuest004Scene01
;valronis will now ask the player some questions while thalmor agent 1
;and arminah make thier way from the torture room.
;starts the _arcFlashbackQuest004Scene02 scene
;conditionalizes valronis force greet package _arcFBQ004ValronisFGStage90

;start the second scene, _arcFlashbackQuest004Scene02
_arcFlashbackQuest004Scene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;set at the end of _arcFlashbackQuest004ValronisFGStage125BranchTopic
;so valronis only force greets once
;this stage allows _arcFlashbackQuest004Scene02 to progress to phase 10
;where valronis tells thalmor agent 1 that they are leaving
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN AUTOCAST TYPE _arcFlashbackQuestScript
Quest __temp = self as Quest
_arcFlashbackQuestScript kmyQuest = __temp as _arcFlashbackQuestScript
;END AUTOCAST
;BEGIN CODE
;this stage is set once the player is back in odelia
;at the end of _arcFlashbackQuest004Scene03
;shut down stage
;clean up everything now that the flashback out sequence is complete

;set the thalmor to be enemies again
kmyQuest.SetThalmorEnemy(True)

;remove the perk so the player can activate things again
PlayerRef.RemovePerk(_arcFBQ004Perk)

;remove the unarmed weapon from thalmor agent 1, they do not need it anymore
(Alias_ThalmorAgent01.GetReference() as Actor).RemoveItem(Unarmed)

;remove thalmoragent02
ThalmorAgent02.TryRemove()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;set at the end of _arcFlashbackQuest004ValronisFGStage30Continue
;valronis has finished his forcegreet reply
;you now have to eat the food

;enable the eat food activator
Alias_EatFoodActivator.GetReference().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;this stage is set at the end of phase 1 of _arcFlashbackQuest004Scene01
;we are now in valronis' lab

;enable some player controls
;movement / looking / activation only
Game.EnablePlayerControls(True, False, False, True, False, False, True, False, 0)
Game.SetPlayerAIDriven(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;set at the end of _arcFlashbackQuest004ValronisFGStage90Archivist
;when valronis has stopped talking
;this is so _arcFlashbackQuest004Scene02 can progress to phase 3
;where thalmor agent 1 chimes in

;evaluate thalmor agent 2 package so he will guard the exit immediately
(Alias_ThalmorAgent02.GetReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;set by _arcFlashbackQuest004ValronisFGStage90BranchTopic
;to conditionalize valronis force greet package _arcFBQ004ValronisFGStage90
;so he will only force greet once
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;set at the end of phase 7 of _arcFlashbackQuest004Scene02
;valronis has opened arcadia's door

;open the door via script, as it is locked otherwise
Alias_ArcadiaDoor.GetReference().SetOpen(True)

;unlock the trap door as an owner
Alias_TrapDoorInt.GetReference().Lock(False, True)

;start _arcFlashbackQuest004Scene03, this way
;we can track when the player has the letter and burns it
_arcFlashbackQuest004Scene03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;set at the end of phase 2 of _arcFlashbackQuest004Scene01
; it conditionalizes valronis' alias behaviour in _arcFBQ004ValronisSitAlchemyBench
;making valronis travel to the player instead of tending to his alchemy bench
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
;if stage 140 was not completed
;we need to do everything done in that stage here instead

;lock the trap door as an owner
Alias_TrapDoorInt.GetReference().Lock(True, True)

;disable everyone, as they are not needed anymore
Alias_Valronis.GetReference().DisableNoWait()
Alias_Arminah.GetReference().DisableNoWait()
Alias_ThalmorAgent01.GetReference().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;this stage is set in _arcFBQ004EatFoodActivatorAliasScript
;once the player has eaten the food

;set the hit sound marker to the Active state.
HitSoundMarker.GoToState("Active")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
;set at the end of phase 8 of _arcFlashbackQuest004Scene02
;the door is now open and valronis can now force greet us
;this conditionalizes valronis' dialouge so he only force greets once
;in _arcFlashbackQuest004ValronisFGStage125BranchTopic
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;set at the end of phase 6 of _arcFlashbackQuest004Scene01
;this is to conditionalize the _arcFBQ004ValronisFGStage30
;forcegreet package for valronis' alias
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;et at the end of _arcFlashbackQuest004Scene02
;once valronis, arminah and thalmor agent 1 have left the laboratory

;lock the trap door as an owner
Alias_TrapDoorInt.GetReference().Lock(True, True)

;disable everyone, as they are not needed anymore
Alias_Valronis.GetReference().DisableNoWait()
Alias_Arminah.GetReference().DisableNoWait()
Alias_ThalmorAgent01.GetReference().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;this stage is set at the end of phase 11 of _arcFlashbackQuest004Scene01
;a couple of seconds after valronis tells thalmor agent 1 to stop torturing

;set the hit sound marker to the Inactive state
HitSoundMarker.GoToState("Inactive")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE _arcFlashbackQuestScript
Quest __temp = self as Quest
_arcFlashbackQuestScript kmyQuest = __temp as _arcFlashbackQuestScript
;END AUTOCAST
;BEGIN CODE
;start up stage
;disable all controls
Game.DisablePlayerControls(abCamSwitch = True, abSneaking = True, abLooking = True)

;move valronis into position
Valronis.TryMoveTo(Alias_ValronisStartMarker.GetReference())

;move thalmor agent 1 into position
ThalmorAgent01.TryMoveTo(Alias_ValronisStartMarker.GetReference())

;get thalmor agent 2's actor reference so we can optimze performance
Actor ThalmorAgent02Ref = Alias_ThalmorAgent02.GetReference() as Actor

;removed thalmor agent 2 from all factions
;so they will initiate tresspass dialgue with the player
ThalmorAgent02Ref.RemoveFromAllFactions()

;set thalmor agent 2's aggression so they will only attack enemies
ThalmorAgent02Ref.SetActorValue("Aggression", 1.0)

;set relationship between thalmoragent02 and player to foes
;this makes them hostile towards the player without attacking them
ThalmorAgent02Ref.SetRelationshipRank(PlayerRef, -2)

;set the thalmor to be friends
kmyQuest.SetThalmorEnemy(False)

;add the perk to the player so the player can only activate what's needed
PlayerRef.AddPerk(_arcFBQ004Perk)

;start the flashback sequence
kmyQuest.FlashbackIn(Alias_PlayerStartMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE _arcFlashbackQuestScript
Quest __temp = self as Quest
_arcFlashbackQuestScript kmyQuest = __temp as _arcFlashbackQuestScript
;END AUTOCAST
;BEGIN CODE
;set at the end of phase 3 of _arcFlashbackQuest004Scene03
;once the player has thrown the letter into the fire and six seconds have passed

;play flashback out sequence
kmyQuest.FlashbackOut(Alias_PlayerDestMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcQuestActorAliasScript Property Valronis Auto

_arcQuestActorAliasScript Property ThalmorAgent01 Auto

_arcQuestActorAliasScript Property ThalmorAgent02 Auto

_arcFBQ004HitSoundMarkerScript Property HitSoundMarker Auto

Perk Property _arcFBQ004Perk  Auto  

Actor Property PlayerRef  Auto  

Form Property Unarmed  Auto  

Scene Property _arcFlashbackQuest004Scene02  Auto  

Scene Property _arcFlashbackQuest004Scene03  Auto  
