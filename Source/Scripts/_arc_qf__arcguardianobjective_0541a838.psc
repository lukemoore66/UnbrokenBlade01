;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname _arc_QF__arcGuardianObjective_0541A838 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Guardian
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guardian Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StartMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;give spell
_arcGuardiansWisdomGiveSpell.Cast(Alias_Guardian.GetReference(), PlayerRef)
PlayerRef.AddSpell(_arcGuardiansWisdomSpell)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;start up
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE _arcGuardianQuestScript
Quest __temp = self as Quest
_arcGuardianQuestScript kmyQuest = __temp as _arcGuardianQuestScript
;END AUTOCAST
;BEGIN CODE
;set the guardian to be passive
Guardian.GoToState("Passive")

;summon guardian
kmyQuest.StartupQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE _arcGuardianQuestScript
Quest __temp = self as Quest
_arcGuardianQuestScript kmyQuest = __temp as _arcGuardianQuestScript
;END AUTOCAST
;BEGIN CODE
;shut down
kmyQuest.ShutdownQuest()

;set the guardian to be aggressive
Guardian.GoToState("Aggressive")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property _arcGuardiansWisdomGiveSpell  Auto  

SPELL Property _arcGuardiansWisdomSpell  Auto  

Actor Property PlayerRef  Auto  

_arcGuardianQuestGuardianAliasScript Property Guardian Auto
