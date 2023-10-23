;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 30
Scriptname _arc_SF__arcGuardianTrollScen_052F8073 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
_arcGuardianTrollSceneQuest.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
_arcGuardianTrollSceneQuest.GuardianRef.Banish()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
_arcGuardianTrollSceneQuest.GuardianRef.MoveTo(_arcGuardianTrollSceneQuest.GuardianMarker02Ref)
_arcGuardianTrollSceneQuest.GuardianRef.Summon()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
_arcGuardianTrollSceneQuest.GuardianRef.Banish()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
_arcGuardianTrollSceneQuest.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
_arcGuardianTrollSceneQuest.GuardianRef.Banish()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
_arcGuardianTrollSceneQuest.GuardianRef.MoveTo(_arcGuardianTrollSceneQuest.GuardianMarker01Ref)
_arcGuardianTrollSceneQuest.GuardianRef.Summon()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
_arcGuardianTrollSceneQuest.GuardianRef.Banish()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
_arcGuardianTrollSceneQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
_arcGuardianTrollSceneQuest.GuardianRef.MoveTo(_arcGuardianTrollSceneQuest.GuardianMarker04Ref)
_arcGuardianTrollSceneQuest.GuardianRef.Summon()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
_arcGuardianTrollSceneQuest.GuardianRef.MoveTo(_arcGuardianTrollSceneQuest.GuardianMarker05Ref)
_arcGuardianTrollSceneQuest.GuardianRef.Summon()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
_arcGuardianTrollSceneQuest.GuardianRef.MoveTo(_arcGuardianTrollSceneQuest.GuardianMarker03Ref)
_arcGuardianTrollSceneQuest.GuardianRef.Summon()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
_arcGuardianTrollSceneQuest.GuardianRef.Banish()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcGTSQuestScript Property _arcGuardianTrollSceneQuest Auto
