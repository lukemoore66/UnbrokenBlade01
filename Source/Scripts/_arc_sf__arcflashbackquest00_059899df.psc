;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 62
Scriptname _arc_SF__arcFlashbackQuest00_059899DF Extends Scene Hidden

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
_arcFlashbackQuest001.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
_arcFlashbackQuest001.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
_arcFlashbackQuest001.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34(ReferenceAlias akAlias)
;BEGIN CODE
_arcFlashbackQuest001.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52(ReferenceAlias akAlias)
;BEGIN CODE
;wait for animation (idlepov_bedgetup.hkx 11.7334 sec)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
_arcFlashbackQuest001.SetStage(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
_arcFlashbackQuest001.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
_arcFlashbackQuest001.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
_arcFlashbackQuest001.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
If _arcQuest001.RingGiver != 4
    _arcFlashbackQuest001.SetStage(90)
    Return
EndIf

_arcFlashbackQuest001.SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property _arcFlashbackQuest001  Auto  

_arcQuest001Script Property _arcQuest001  Auto
