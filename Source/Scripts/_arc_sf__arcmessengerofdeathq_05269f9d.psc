;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname _arc_SF__arcMessengerOfDeathQ_05269F9D Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
_arcMessengerOfDeathQuest.KillVictimMid()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
_arcMessengerOfDeathQuest.BanishVictim()
_arcMessengerOfDeathQuest.SetTarget()
_arcMessengerOfDeathQuest.KillVictimFinish()
_arcMessengerOfDeathQuest.AddPerk(False)
_arcMessengerOfDeathQuest.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
_arcMessengerOfDeathQuest.AddPerk(True)
_arcMessengerOfDeathQuest.KillVictimStart()
_arcMessengerOfDeathQuest.MoveVictim()
_arcMessengerOfDeathQuest.SummonVictim()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcMODQuestScript Property _arcMessengerOfDeathQuest  Auto  
