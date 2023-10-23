;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname _arc_QF__arcGuardianFireOwlSc_052DEA12 Extends Quest Hidden

;BEGIN ALIAS PROPERTY GuardianTrig
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardianTrig Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guardian
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guardian Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY pullBar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_pullBar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FinishMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FinishMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE _arcGuardianQuestScript
Quest __temp = self as Quest
_arcGuardianQuestScript kmyQuest = __temp as _arcGuardianQuestScript
;END AUTOCAST
;BEGIN CODE
;summon the guardian / start the quest
;this stage is set at the end of phase 1 of _arcGuardianFireOwlSceneQuestScene

kmyQuest.StartupQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;start up stage
;starts the scene automaticaaly
;wait 2 seconds before summoning guardian
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE _arcGuardianQuestScript
Quest __temp = self as Quest
_arcGuardianQuestScript kmyQuest = __temp as _arcGuardianQuestScript
;END AUTOCAST
;BEGIN CODE
;shut down stage

Alias_GuardianTrig.GetReference().EnableNoWait()

kmyQuest.ShutdownQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
