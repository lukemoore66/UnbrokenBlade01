;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _arc_TIF__05599974 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
_arcCoinTossQuest.CoinTossGold = _arcCoinTossGold100Percent.GetValueInt()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcCoinTossQuestScript Property _arcCoinTossQuest Auto

GlobalVariable Property _arcCoinTossGold100Percent Auto
