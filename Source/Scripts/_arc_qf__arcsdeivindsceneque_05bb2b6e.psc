;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 26
Scriptname _arc_QF__arcSDEivindSceneQue_05BB2B6E Extends Quest Hidden

;BEGIN ALIAS PROPERTY InsideEntranceMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InsideEntranceMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DoorExt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DoorExt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LanternMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LanternMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eivind
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eivind Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmugglersDen
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SmugglersDen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lantern
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lantern Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE _arcSDESQuestScript
Quest __temp = self as Quest
_arcSDESQuestScript kmyQuest = __temp as _arcSDESQuestScript
;END AUTOCAST
;BEGIN CODE
;start-up stage

;ugly hack to make sure quest has started fully before running scenes
;conditionally in stage 10
kmyQuest.OnUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;disable the trigger
Alias_Trigger.GetReference().DisableNoWait()

;set stage to 20, so we know a valid fragment ran
;this will be used as a conditional in the shut down stage
SetStage(20)

;stop eivind from being a teammate during scene
(Alias_Eivind.GetReference() as Actor).SetPlayerTeammate(False, False)

;start enter cave scene
_arcSDESQuestScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;disable the trigger
Alias_Trigger.GetReference().DisableNoWait()

;set stage to 20, so we know a valid fragment ran
;this will be used as a conditional in the shut down stage
SetStage(20)

;stop eivind from being a teammate during scene
(Alias_Eivind.GetReference() as Actor).SetPlayerTeammate(False, False)

;start the lantern on scene
_arcSDESQuestScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;stop the quest, as none of the other fragments ran
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;disable the trigger
Alias_Trigger.GetReference().DisableNoWait()

;set stage to 20, so we know a valid fragment ran
;this will be used as a conditional in the shut down stage
SetStage(20)

;start lantern off scene
_arcSDESQuestScene03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;this fragment will run if eivind is a follower

;return eivind to being a teammate when scene as ended
(Alias_Eivind.GetReference() as Actor).SetPlayerTeammate(True, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;this stage is set in the stage 10 fragments of this quest
;it conditionalizes the shut down stage, so that we know that
;a valid scene fragment ran
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property _arcSDESQuestScene01  Auto  

Scene Property _arcSDESQuestScene02  Auto  

Scene Property _arcSDESQuestScene03  Auto  
