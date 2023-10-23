;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname _arc_QF__arcDragonAttackMana_050D3D2B Extends Quest Hidden

;BEGIN ALIAS PROPERTY ClosestInn
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ClosestInn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LumberCamp
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_LumberCamp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ClosestInnCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ClosestInnCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FourShieldsTavern
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_FourShieldsTavern Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Telisha
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Telisha Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DRAGON
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DRAGON Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eivind
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eivind Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LumberCampCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LumberCampCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FourShieldTavernCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FourShieldTavernCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;start up stage
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;try stopping spectators commenting on dragon corpse
;this stage is set when _arcDragonAttackManagerQuestScene stops

;stop WIDragonKilled quest
WIDragonKilledScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property WIDragonKilledScene Auto
