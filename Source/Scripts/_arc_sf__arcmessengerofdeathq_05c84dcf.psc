;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname _arc_SF__arcMessengerOfDeathQ_05C84DCF Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
_arcMessengerOfDeathQuest.AddPerk(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
_arcMessengerOfDeathQuest.SetTarget()
_arcMessengerOfDeathQuest.SetNewObjective()
_arcMessengerOfDeathQuest.AddPerk(False)
_arcMessengerOfDeathQuest.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcMODQuestScript Property _arcMessengerOfDeathQuest  Auto  
