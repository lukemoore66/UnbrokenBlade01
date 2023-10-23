;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 22
Scriptname _arc_SF__arcOdeliaEntrySceneQ_051FF471 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;cancel previous knockouts for sure
_arcOdeliaEntrySceneQuest.Cancel(True, True)

;knock out the player
_arcOdeliaEntrySceneQuest.KnockOut()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;start scene 6 again, to detect if the player moves or has thier weapon out
_arcOdeliaEntrySceneQuestScene06.Start()

;remove ai control of the player
Game.SetPlayerAIDriven(False)

;return control to the player
Game.EnablePlayerControls()

;start scene 4 again
_arcOdeliaEntrySceneQuestScene04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;have the player get up with controls disabled
_arcOdeliaEntrySceneQuest.GetUp(False)

;set the player to AI controlled so they will face valronis when they get up
Game.SetPlayerAIDriven(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;pause knockout
_arcOdeliaEntrySceneQuest.UnregisterForUpdate()

;heal everybody
Valronis.TryResetHealth()
ThalmorAgent01.TryResetHealth()
ThalmorAgent02.TryResetHealth()
ThalmorAgent03.TryResetHealth()
Eivind.TryResetHealth()

;move player to player knock out marker
PlayerRef.MoveTo(PlayerKnockOutMarker.GetReference())

;resume knockout
_arcOdeliaEntrySceneQuest.RegisterForSingleUpdate(6.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;skip the _arcKnockOutLoopImod and go straight to the _arcKnockOutLoopOutImod
;unregister for any updates, this effectivley pauses the knock out script
;it will still execute the OnUpdate() event in Stage4, applying the _arcKnockOutLoopImod
_arcOdeliaEntrySceneQuest.UnregisterForUpdate()

;go to the Stage 6 state, where it plays the _arcKnockOutLoopOut Imod
_arcOdeliaEntrySceneQuest.GoToState("Stage6")

;the start and end of _arcKnockoutLoopImod and _arcKNockOutLoopOutImod have a 0.5s
;overlap that looks the same, so running OnUpdate() will be a seamless transition
_arcOdeliaEntrySceneQuest.OnUpdate()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcOdeliaEntrySceneQuestScript Property _arcOdeliaEntrySceneQuest Auto

Scene Property _arcOdeliaEntrySceneQuestScene04 Auto

_arcQuestActorAliasScript Property Valronis Auto

_arcQuestActorAliasScript Property ThalmorAgent01 Auto

_arcQuestActorAliasScript Property ThalmorAgent02 Auto

_arcQuestActorAliasScript Property ThalmorAgent03 Auto

_arcQuestActorAliasScript Property Eivind Auto

ObjectReference Property PlayerRef  Auto  

ReferenceAlias Property PlayerKnockOutMarker  Auto  

Scene Property _arcOdeliaEntrySceneQuestScene06  Auto  
