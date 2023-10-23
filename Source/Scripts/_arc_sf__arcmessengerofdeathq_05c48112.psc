;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname _arc_SF__arcMessengerOfDeathQ_05C48112 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;kill someone
;the perk will be removed after we kill the victim
_arcMessengerOfDeathQuest.KillVictimStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
_arcMessengerOfDeathQuest.AddPerk(True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcMODQuestScript Property _arcMessengerOfDeathQuest  Auto  
