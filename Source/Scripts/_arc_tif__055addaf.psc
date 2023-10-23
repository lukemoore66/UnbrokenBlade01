;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _arc_TIF__055ADDAF Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerRef.AddItem(Gold001)
_arcCoinTossQuest.CalculateGold()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcCoinTossQuestScript Property _arcCoinTossQuest  Auto  

ObjectReference Property PlayerRef  Auto  

Form Property Gold001  Auto
