;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 28
Scriptname _arc_QF__arcFlashbackQuest003_0549B927 Extends Quest Hidden

;BEGIN ALIAS PROPERTY GuardianTalkingActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardianTalkingActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BladeSoldierRuneMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BladeSoldierRuneMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BladeSoldierMidMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BladeSoldierMidMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY pullBar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_pullBar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerEndMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerEndMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerFinishMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerFinishMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerPullBarMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerPullBarMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerSplashMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerSplashMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonClaw
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonClaw Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardianFinishMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardianFinishMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BladeSoldierStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BladeSoldierStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaveSplashPlane
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaveSplashPlane Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Stage30Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Stage30Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BladeSoldierRuneHeadtrackMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BladeSoldierRuneHeadtrackMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BladeSoldierHandsBehindBackMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BladeSoldierHandsBehindBackMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BladeSoldierSaluteMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BladeSoldierSaluteMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BladeSoldier
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BladeSoldier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guardian
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guardian Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BattleAmbienceSoundMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BattleAmbienceSoundMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;soldier has finished his line and player is position to activate switch
;this stage is set at the end of phase 10 of _arcFlashbackQuest003Scene

;set the pullbar to the active state so it can be used now
PullBar.GoToState("Active")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;player is now in flashback
;this stage is set at the end of phase 1 of _arcFlashbackQuest003Scene

;set the player to the Stage10 state, this dynamically adds
;effects to play around the player
Player.GoToState("Stage10")

;enable some player controls
;movement / looking / activation only
Game.EnablePlayerControls(True, False, False, True, False, False, True, False, 0)
Game.SetPlayerAIDriven(False)

;stop combat alarm for player so no aggro shows on compass
PlayerRef.StopCombatAlarm()
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
;Startup Stage

;banish the guardian with a delay
;this needs to be done so his effect shader doesn't glitch out
;and carry over to the flashback cell with the player
Guardian.BanishWithDelay(3.0)

;add filter activation perk to player so they can only activate
;the blade soldier
PlayerRef.AddPerk(_arcFBQ003Perk)

;set thalmor and thalmor enemy faction to be enemies
;this will only affect the thalmor and the blades in this scene
kmyQuest.SetThalmorEnemy(True)

;start the flashback sequence
kmyQuest.FlashbackIn(Alias_PlayerStartMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;the player has delivered their line
;this stage is set at the end of phase 10 of _arcFlashbackQuest003Scene

;remove the claw
ObjectReference BladeSoldierRef = Alias_BladeSoldier.GetReference()
ObjectReference DragonClawRef = Alias_DragonClaw.GetReference()

PlayerRef.RemoveItem(DragonClawRef, 1, False, BladeSoldierRef)

;then silently add it back immediately
BladeSoldierRef.RemoveItem(DragonClawRef, 1, True, PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;the player has entered the stage30 trigger
;this stage is set by _arcFBQ003Stage30TrigRef in arcOdelia04Flashback
;it conditionalizes phase 6 of _arcFlashbackQuest003Scene to end

;disable all controls, except activation
;this will allow the guardian to force greet later
Game.DisablePlayerControls(abCamSwitch = True, abLooking = True, abSneaking = True, abActivate = False, abJournalTabs = True)

;set player to be ai controlled, so they travel into position by themsleves
Game.SetPlayerAIDriven(True)

;remove filter activation perk
PlayerRef.RemovePerk(_arcFBQ003Perk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;the door is closed
;this stage is set by the script attached to _arcPuzzleDoorAnimActRef
;once the translation of the door is complete

;activate the wave splash plane
ObjectReference WaveSplashPlaneRef = Alias_WaveSplashPlane.GetReference()
WaveSplashPlaneRef.Activate(WaveSplashPlaneRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;shut down stage
;this stage is set when _arcFlashbackQuest003Scene02 finishes

;let _arcquest004 know that the guardian has finished talking
_arcQuest004.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;the player is now back in the present

;move the guardian into position
;so he will always face in the correct direction
Alias_Guardian.GetReference().MoveTo(Alias_GuardianFinishMarker.GetReference())

;summon the guardian
(Alias_Guardian.GetReference() as _arcSummonFXScript).Summon()

;start _arcFlashbackQuest003Scene02, this exits dialogue with the guardian
;with the correct timing, and ends the quest when it finishes
_arcFlashbackQuest003Scene02.Start()

;set stage in _arcQuest004
_arcQuest004.SetStage(10)

;have the guardian evaluate his package
;so he will force greet
(Alias_Guardian.GetReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;enable the stage 30 trigger so that ai will take over player when needed
;this stage is set at the start of phase 6 of _arcFlashbackQuest003Scene

Alias_Stage30Trigger.GetReference().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;pullbar has been activated and player is in postion for flood
;this stage is set at the end of phase 12 of _arcFlashbackQuest003Scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE _arcFlashbackQuestScript
Quest __temp = self as Quest
_arcFlashbackQuestScript kmyQuest = __temp as _arcFlashbackQuestScript
;END AUTOCAST
;BEGIN CODE
;set the player alias to inactive
;this stops ambient explosions and sounds etc..
Player.GoToState("Inactive")

;set the guardian's alias the the Stage70 state
;this will make him summon with delay once
;we are back in the present
Guardian.GoToState("Stage70")

;disable sound marker to stop battle sounds
Alias_BattleAmbienceSoundMarker.GetReference().Disable()

;play flashback out sequence
kmyQuest.FlashbackOut(Alias_PlayerFinishMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcFBQ003PlayerAliasScript Property Player Auto

_arcFBQ003GuardianAliasScript Property Guardian Auto

_arcFBQ003PullBarAliasScript Property PullBar Auto

Actor Property PlayerRef  Auto   

Quest Property _arcQuest004  Auto  

Perk Property _arcFBQ003Perk  Auto  

Scene Property _arcFlashbackQuest003Scene02  Auto  
