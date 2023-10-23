;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 22
Scriptname _arc_SF__arcLumberCampSceneQu_05EA6453 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
_arcLumberCampSceneQuest.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
_arcLumberCampSceneQuest.SetStage(50)

;set the stage in _arcQuest003, so the thalmor return to the embassy
_arcQuest003.SetStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
_arcLumberCampSceneQuest.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property _arcLumberCampSceneQuest  Auto  

Quest Property _arcQuest003  Auto  
