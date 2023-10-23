;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname _arc_PF__arcCalderCampfireLi_057573D2 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
_arcCalderCampFireCrouchMarkerRef.RegisterForAnimationEvent(akActor, "PickUp")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4(Actor akActor)
;BEGIN CODE
_arcCalderCampFireCrouchMarkerRef.UnregisterForAnimationEvent(akActor, "PickUp")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property _arcCalderCampFireCrouchMarkerRef Auto
