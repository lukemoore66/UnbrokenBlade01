;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname _arc_QF__arcGuardianFireScene_052EDDB6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Guardian
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guardian Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StartMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE _arcGuardianQuestScript
Quest __temp = self as Quest
_arcGuardianQuestScript kmyQuest = __temp as _arcGuardianQuestScript
;END AUTOCAST
;BEGIN CODE
;start up stage

kmyQuest.StartupQuest()
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

kmyQuest.ShutdownQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
