;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _arc_TIF__052982B5 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerRef.AddItem(Lockpick, 4)
PlayerRef.AddPerk(_arcQuest001LockpickPerk)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Perk Property _arcQuest001LockpickPerk  Auto  

Form Property Lockpick  Auto  

Actor Property PlayerRef  Auto  
