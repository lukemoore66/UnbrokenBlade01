;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname _arc_TIF__05CB2732 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;reset the messenger's force greet flag
_arcMessengerOfDeathQuest.SetForceGreetFlag(0)

;disable interaction
_arcMessengerOfDeathQuest.AddPerk(True)

Utility.Wait(3.0)

_arcMessengerOfDeathQuest.ReadBook()

;disable interaction
_arcMessengerOfDeathQuest.AddPerk(True)

;stop messenger of death quest with delay
_arcMessengerOfDeathQuest.ShutdownWithDelay(3.0)

;unlock the exit door
_arcQuest004.SetStage(85)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcMODQuestScript Property _arcMessengerOfDeathQuest  Auto  

Quest Property _arcQuest004  Auto  
