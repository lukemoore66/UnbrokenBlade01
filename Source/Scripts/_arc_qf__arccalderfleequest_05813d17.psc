;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname _arc_QF__arcCalderFleeQuest_05813D17 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Halvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Halvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Calder
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Calder Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;shutdown stage
;stop the quest if both calder and halvar are disabled
;this stage is set in the actor alias scripts on calder and halvar
;on this quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;startup stage
;this quest is launched in stage 100 _arcQuest002
;after calder has completed his stage 90 forcegreet
;and he is not dead
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
