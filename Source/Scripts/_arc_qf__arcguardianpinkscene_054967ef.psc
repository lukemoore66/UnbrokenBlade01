;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 22
Scriptname _arc_QF__arcGuardianPinkScene_054967EF Extends Quest Hidden

;BEGIN ALIAS PROPERTY Skeever01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skeever01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BladeSoldierGhost01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BladeSoldierGhost01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartMarkerClaw
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StartMarkerClaw Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PointMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PointMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skeever04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skeever04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BurningCorpse03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BurningCorpse03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartMarkerNoClaw
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StartMarkerNoClaw Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BurningCorpse02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BurningCorpse02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FireActivatorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FireActivatorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PullBarHigh
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PullBarHigh Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BurningCorpse01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BurningCorpse01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FinishMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FinishMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guardian
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guardian Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BladeSoldierGhost02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BladeSoldierGhost02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skeever02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skeever02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PullBarLow
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PullBarLow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skeever03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skeever03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PortcullisActivatorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PortcullisActivatorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PortcullisLow
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PortcullisLow Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;this stage is set at the end of _arcGuardianPinkSceneQuestScene02
;once the guardian has been banished, and we are sure both summoned
;guardians are dead

;start scene 3
_arcGuardianPinkSceneQuestScene03.Start()

;set the low pullbar to the 'Active' state, so it will now open the lower portculils
;and light the fires 
PullBarLow.GoToState("Active")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;the player has activated the low pullbar
;this stage is set by the PullBarLow alias in this quest

;activate fires via parent activation
;with the fire activation marker
ObjectReference FireActMarkerRef = Alias_FireActivatorMarker.GetReference()
FireActMarkerRef.Activate(FireActMarkerRef)

;set the portcullis to be open
_arcDefault2StateActivator PortcullisLowRef = Alias_PortcullisLow.GetReference() as _arcDefault2StateActivator
If !PortcullisLowRef.IsOpen
    PortcullisLowRef.SetOpen()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE _arcGPSQuestScript
Quest __temp = self as Quest
_arcGPSQuestScript kmyQuest = __temp as _arcGPSQuestScript
;END AUTOCAST
;BEGIN CODE
;start-up stage

;ugly hack to make sure quest has started fully before running scenes
;conditionally in stage 10
kmyQuest.OnUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE _arcGPSQuestScript
Quest __temp = self as Quest
_arcGPSQuestScript kmyQuest = __temp as _arcGPSQuestScript
;END AUTOCAST
;BEGIN CODE
;the player has the claw

;set the pullbar to the completed state
(Alias_PullBarHigh.GetReference() as _arcGPSQuestPullBarHighRefScript).GoToState("Complete")

;open the portcullis
ObjectReference PortcullisActMarkerRef = Alias_PortcullisActivatorMarker.GetReference()
PortcullisActMarkerRef.Activate(PortcullisActMarkerRef)

;wait for the portcullis
Utility.Wait(6.0)

;temporarily set the guardian to be passive
Guardian.GoToState("Passive")

;summon the guardian
kmyQuest.StartupQuest()

;start the scene
_arcGuardianPinkSceneQuestScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE _arcGPSQuestScript
Quest __temp = self as Quest
_arcGPSQuestScript kmyQuest = __temp as _arcGPSQuestScript
;END AUTOCAST
;BEGIN CODE
;the guardian has finished pointing
;this stage is set at the end of phase 3 of _arcGuardianPinkSceneQuestScene02

;banish the guardian
kmyQuest.GuardianRef.Banish()

;set the guardian back to being aggressive
Guardian.GoToState("Aggressive")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE _arcGPSQuestScript
Quest __temp = self as Quest
_arcGPSQuestScript kmyQuest = __temp as _arcGPSQuestScript
;END AUTOCAST
;BEGIN CODE
;the guardian has gotten up from the throne
;the stage is set at the end of phase 2 of _arcGuardianPinkSceneQuestScene02

;set the player as an enemy
PlayerRef.AddToFaction(_arcGuardianEnemyFaction)

;summon the blade guards
Alias_BladeSoldierGhost01.GetReference().Activate(kmyQuest.GuardianRef)
Alias_BladeSoldierGhost02.GetReference().Activate(kmyQuest.GuardianRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE _arcGPSQuestScript
Quest __temp = self as Quest
_arcGPSQuestScript kmyQuest = __temp as _arcGPSQuestScript
;END AUTOCAST
;BEGIN CODE
;we have finished waiting after the guardian has been defeated
;this stage is set at the end of phase 6 of _arcGuardianPinkSceneQuestScene02

;restore the guardian's health
kmyQuest.GuardianRef.ResetHealthAndLimbs()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE _arcGPSQuestScript
Quest __temp = self as Quest
_arcGPSQuestScript kmyQuest = __temp as _arcGPSQuestScript
;END AUTOCAST
;BEGIN CODE
;the blade guards are dead
;this stage is set at the end of phase 4 of _arcGuardianPinkSceneQuestScene02

;set the guardian to no longer be a ghost
kmyQuest.GuardianRef.SetGhost(False)

;move guardian to point marker
kmyQuest.GuardianRef.MoveTo(Alias_PointMarker.GetReference())

;summon the guardian
kmyQuest.GuardianRef.Summon(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE _arcGPSQuestScript
Quest __temp = self as Quest
_arcGPSQuestScript kmyQuest = __temp as _arcGPSQuestScript
;END AUTOCAST
;BEGIN CODE
;the guardian has finished telling the player that they need the claw
;this stage is set at the end of _arcGuardianPinkSceneQuestScene01

kmyQuest.ShutdownQuest()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;the player has been hit by the guardian's shout
;this stage is set at the end of _arcGuardianPinkSceneQuestScene03

;stop and complete the guardian objective quest
_arcGuardianObjectiveQuest.ShutdownQuest()

;start the third flashback quest
_arcFlashbackQuest003.Start()

;stop this quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE _arcGPSQuestScript
Quest __temp = self as Quest
_arcGPSQuestScript kmyQuest = __temp as _arcGPSQuestScript
;END AUTOCAST
;BEGIN CODE
;the guardian is defeated
;this stage is set at the end of _arcGuardianPinkSceneQuestScene02

;banish the guardian
kmyQuest.GuardianRef.Banish()

;move the guardian down stairs
kmyQuest.GuardianRef.MoveTo(Alias_FinishMarker.GetReference())

;summon the guardian
kmyQuest.GuardianRef.Summon(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE _arcGPSQuestScript
Quest __temp = self as Quest
_arcGPSQuestScript kmyQuest = __temp as _arcGPSQuestScript
;END AUTOCAST
;BEGIN CODE
;the guardian is bleeding out
;this stage is set at the end of phase 5 of _arcGuardianPinkSceneQuestScene02

;set the guardian to be a ghost again
kmyQuest.GuardianRef.SetGhost(True)

;set the player as not an enemy
PlayerRef.RemoveFromFaction(_arcGuardianEnemyFaction)

;explicitly stop combat alarm for player
PlayerRef.StopCombat()
PlayerRef.StopCombatAlarm()

;stop combat for the guardian
Actor GuardianRef = Alias_Guardian.GetReference() as Actor
GuardianRef.StopCombat()
GuardianRef.StopCombatAlarm()

;kill everything
Alias_BurningCorpse01.TryToKill()
Alias_BurningCorpse02.TryToKill()
Alias_BurningCorpse03.TryToKill()

Alias_Skeever01.TryToKill()
Alias_Skeever02.TryToKill()
Alias_Skeever03.TryToKill()
Alias_Skeever04.TryToKill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE _arcGPSQuestScript
Quest __temp = self as Quest
_arcGPSQuestScript kmyQuest = __temp as _arcGPSQuestScript
;END AUTOCAST
;BEGIN CODE
;the player does not have the claw

;only run the scene every third time the pullbar is activated
If (Alias_PullBarHigh.GetReference() as _arcGPSQuestPullBarHighRefScript).ActivationCounter % 3
    Stop()
    Return
EndIf

;summon the guardian
kmyQuest.StartupQuest()

;start the scene
_arcGuardianPinkSceneQuestScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property _arcGuardianPinkSceneQuestScene01  Auto  

Scene Property _arcGuardianPinkSceneQuestScene02  Auto  

Actor Property PlayerRef  Auto  

Faction Property _arcGuardianEnemyFaction  Auto  

Scene Property _arcGuardianPinkSceneQuestScene03  Auto  

_arcGPSQuestPullBarLowAliasScript Property PullBarLow Auto

Quest Property _arcFlashbackQuest003  Auto  

_arcGOQuestScript Property _arcGuardianObjectiveQuest  Auto  

_arcGuardianQuestGuardianAliasScript Property Guardian Auto
