;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname _arc_QF__arcGuardianWebSceneQ_0543B510 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Guardian
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guardian Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FinishMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FinishMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spider02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spider02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spider06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spider06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spider05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spider05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spider03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spider03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spider01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spider01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spider04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spider04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY pullBar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_pullBar Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE _arcGuardianQuestScript
Quest __temp = self as Quest
_arcGuardianQuestScript kmyQuest = __temp as _arcGuardianQuestScript
;END AUTOCAST
;BEGIN CODE
;start up stage

;make sure all frostbite spiders are dead / disabled
Spider01.TryToKillOrDisable()
Spider02.TryToKillOrDisable()
Spider03.TryToKillOrDisable()
Spider04.TryToKillOrDisable()
Spider05.TryToKillOrDisable()
Spider06.TryToKillOrDisable()

kmyQuest.StartupQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE _arcGuardianQuestScript
Quest __temp = self as Quest
_arcGuardianQuestScript kmyQuest = __temp as _arcGuardianQuestScript
;END AUTOCAST
;BEGIN CODE
;shut down stage
;this stage is set at the end of _arcGuardianWebSceneQuestScene

;shut down quest
kmyQuest.ShutdownQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcGWSQuestSpiderAliasScript Property Spider01 Auto
_arcGWSQuestSpiderAliasScript Property Spider02 Auto
_arcGWSQuestSpiderAliasScript Property Spider03 Auto
_arcGWSQuestSpiderAliasScript Property Spider04 Auto
_arcGWSQuestSpiderAliasScript Property Spider05 Auto
_arcGWSQuestSpiderAliasScript Property Spider06 Auto
