;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname _arc_PF__arcCalderTrespassGu_0562761C Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
_arcCalderTrespassQuestScene.Stop()

;threading issue
;need to wait as _arcCalderBehaviourQuestScene
;can finish after the next fragment runs
Utility.Wait(0.1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
GuardCurrent.ForceRefTo(akActor)
_arcCalderTrespassQuestScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property _arcCalderTrespassQuestScene  Auto  

ReferenceAlias Property GuardCurrent  Auto
