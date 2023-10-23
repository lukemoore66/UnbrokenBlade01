;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _arc_TIF__05C4810B Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;difficulty is set to easy (0) by default

;set a target
_arcMessengerOfDeathQuest.SetTarget()

;set stage to 20, this disables the external trigger
_arcMessengerOfDeathQuest.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcMODQuestScript Property _arcMessengerOfDeathQuest Auto
