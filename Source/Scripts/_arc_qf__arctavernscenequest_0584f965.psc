;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname _arc_QF__arcTavernSceneQuest_0584F965 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardCurrent
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardCurrent Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Telisha
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Telisha Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eivind
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eivind Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bard01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonBridgeFarm
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DragonBridgeFarm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardNew
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardNew Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Calder
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Calder Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bard02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;this stage is set at the end of _arcTavernSceneQuestScene01
;it is to launch _arcTavernSceneQuestScene02 as well as conditionalize
;telisha's packages_arcTelishaTavernSceneForceGreet on her alias and
;_arcTelishaTavernUseIdleInit on her actor record

_arcTavernSceneQuestScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;this stage is set at the start of _arcTavernSceneQuestTelishaForceGreetBranchCoinTossOffer
;It is to conditionalize _arcTelishaTavernSceneForceGreet on her alias so she stops
;force greeting at the correct time. It is also set at the start of phase 3 of
;_arcTavernSceneQuestScene02 just in case the player leaves the tavern early
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;this stage is set at the beginning of
;_arcTavernSceneQuestTelishaForceGreetBranchCoinTossOffer
;this stage conditionalizes phase 5 and onwards in  _arcTavernSceneQuestScene02
;so we know if telisha has force greeted for the coin toss
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;this stage is set a the end of phase 5 of _arcTavernSceneQuestScene02
;it is to conditionalize dialogue for _arcTavernSceneQuestEivindCoinTossBranchStart
;and the dialogue topics featured in _arcDialogueQuestEivindView
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;placeholder stage to conditionalize packages_arcEivindTavernUseIdleInit
;_arcTelishaTavernUseIdleInit so they only function for the beginning half
; of the scene correctly. It also stops _arcCalderTresspassQuestScene.

;turn off any world events
_arcSceneActorManagerQuest.DisableWorldEvents()

;set telisha's journal date for her rejection from eivind
;set the ring taken date and time for telisha's journal
_arcTelishaJournalDate01.SetValue(GameDaysPassed.GetValue())

;stop the calder tresspass scene if it was playing.
_arcCalderTrespassQuestScene.Stop()

;try to stop bards from playing, with a delay
Bard01.TryStopCurrentScene(True)
Bard02.TryStopCurrentScene(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;shut down stage
;this stage is set at the start of _arcTavernSceneQuestEivindCoinTossBranchStart
;and at the end of _arcTavernSceneQuestScene02 to conditionalize
;dialogue in _arcDialogueQuestEivindView, so it doesn't come up too early
;it also makes it so the _arcTavernSceneQuestEivindCoinTossBranchStart only
;comes up in the previous stage (30) only. It also completes the quest.

;re-enable world events
_arcSceneActorManagerQuest.EnableWorldEvents()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property _arcCalderTrespassQuestScene  Auto  

Location Property DragonBridgeLocation  Auto  

GlobalVariable Property GameDaysPassed  Auto  

GlobalVariable Property _arcTelishaJournalDate01  Auto  

_arcSceneActorManagerQuestScript Property _arcSceneActorManagerQuest  Auto 

Scene Property _arcTavernSceneQuestScene02  Auto  

_arcTSQBardAliasScript Property Bard01  Auto  

_arcTSQBardAliasScript Property Bard02  Auto  
