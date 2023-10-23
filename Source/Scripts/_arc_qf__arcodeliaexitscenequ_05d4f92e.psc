;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname _arc_QF__arcOdeliaExitSceneQu_05D4F92E Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FinishMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FinishMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY exitDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_exitDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MidMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MidMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;shut down stage
;set the the end of _arcOdeliaExitSceneQuestScene01
;due to stop quest on end flag

;completes the quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;pop from fade to black hold imagespace modifier
;to fade to black back imagespace modifier
FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;this stage is set at the start of phase 3 of _arcOdeliaExitSceneQuestScene01

;pop the fade to black imagespace modifier to hold to black
FadeToBlackImod.PopTo(FadeToBlackHoldImod)

;play title sequence
Game.ShowTitleSequenceMenu()
Game.StartTitleSequence("sequence6")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;set at the start of phase 2 of _arcOdeliaExitSceneQuestScene01

;start fading to black
FadeToBlackImod.Apply()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE _arcOExSQuestScript
Quest __temp = self as Quest
_arcOExSQuestScript kmyQuest = __temp as _arcOExSQuestScript
;END AUTOCAST
;BEGIN CODE
;prepare the player to start the scene
kmyQuest.StartScene()

;play sting
_arcMUSOdeliaExitSting.Add()

;disable the exit door
;this prevents the teleport from glitching out if the player is AI controlled
Alias_ExitDoor.GetReference().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE _arcOExSQuestScript
Quest __temp = self as Quest
_arcOExSQuestScript kmyQuest = __temp as _arcOExSQuestScript
;END AUTOCAST
;BEGIN CODE
;set at the end of phase 8 of _arcOdelliaExitSceneQuestScene01
;re-enables player controls and re-enables the exit door

;remove sting form music stack
_arcMUSOdeliaExitSting.Remove()

;hide the title sequence
Game.HideTitleSequenceMenu()

;return the player to normal
kmyQuest.FinishScene()

;get exit door reference
ObjectReference ExitDoorRef = Alias_ExitDoor.GetReference()

;enable the exit door now that the player is no longer AI controlled
;this prevents the teleport from glitching out
ExitDoorRef.EnableNoWait()

;have the player activate the exit door
ExitDoorRef.Activate(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ImageSpaceModifier Property FadeToBlackImod  Auto  

ImageSpaceModifier Property FadeToBlackHoldImod  Auto  

ImageSpaceModifier Property FadeToBlackBackImod  Auto  

MusicType Property _arcMUSOdeliaExitSting  Auto  

ObjectReference Property PlayerRef  Auto  
