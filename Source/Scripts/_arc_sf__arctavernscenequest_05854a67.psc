;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname _arc_SF__arcTavernSceneQuest_05854A67 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
If _arcTavernSceneQuest.IsRunning()
    _arcTavernSceneQuest.SetStage(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property _arcTavernSceneQuest  Auto
