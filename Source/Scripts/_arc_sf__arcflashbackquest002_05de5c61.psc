;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 26
Scriptname _arc_SF__arcFlashbackQuest002_05DE5C61 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
_arcFlashbackQuest002.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
_arcFlashbackQuest002.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
_arcFlashbackQuest002.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
_arcFlashbackQuest002.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17(ReferenceAlias akAlias)
;BEGIN CODE
_arcHorseWhinnySFX.Play(Horse.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
_arcFlashbackQuest002.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24(ReferenceAlias akAlias)
;BEGIN CODE
;this value is 11.7334 for the amin minus 6.0 seconds for the imod
;wait time in FlashbackOut
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property _arcFlashbackQuest002  Auto  

Sound Property _arcHorseWhinnySFX  Auto  

ReferenceAlias Property Horse  Auto  
