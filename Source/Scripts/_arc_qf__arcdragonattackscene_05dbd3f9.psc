;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname _arc_QF__arcDragonAttackScene_05DBD3F9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Actor02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FourShieldsTavernExtMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FourShieldsTavernExtMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonSoundMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonSoundMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VarniusJunius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VarniusJunius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Perch03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Perch03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JulienneLylvieve
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JulienneLylvieve Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FourShieldsTavern
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_FourShieldsTavern Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DRAGON
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DRAGON Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faida
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Faida Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Telisha
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Telisha Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonFXMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonFXMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TelishaMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TelishaMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Perch02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Perch02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonBridge
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DragonBridge Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eivind
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eivind Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FourShieldsTavernCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FourShieldsTavernCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TelishaCloseMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TelishaCloseMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EivindMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EivindMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Perch01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Perch01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;the player has finished the flashback
;set in the shutdown stage (70) of _arcFlashbackQuest002

;set the stage in _arcquest002
_arcQuest002.SetStage(150)

;stop this quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;the player has left the tavern
;the dragon did not start attacking in the tavern

;set the player to the correct state, so that dragon attack extras will start
;if the tavern is entered
Player.GoToState("Stage30")

;always stop the scene here
_arcDragonAttackSceneQuestScene01.Stop()

;get dragon ref
Actor kDragonRef = Alias_Dragon.GetReference() as Actor

;enable the dragon
kDragonRef.Enable()

;start combat
(Alias_Eivind.GetReference() as Actor).StartCombat(kDragonRef)
kDragonRef.StartCombat(PlayerRef)

;set the stage in _arcquest002
_arcQuest002.SetStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;the player has entered dragon bridge

;set the player to the correct state
Player.GoToState("Stage0")

;move dragon to near marker and disable
Dragon.TryMoveTo(Alias_DragonStartMarker.GetReference(), False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;the player has entered the tavern
;telisha was not the vicitim, so she does exist

;set the player to the correct state
Player.GoToState("Stage10")

;set the stage in _arcquest002
_arcQuest002.SetStage(120)

;ensure eivind is enabled
Alias_Eivind.GetReference().Enable()

;ensure telisha is enabled
Alias_Telisha.GetReference().Enable()

;start the scene
_arcDragonAttackSceneQuestScene01.Start()

;enable the dragon
Alias_Dragon.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;set the dragon to the Active state
;so it will continously attack

Dragon.GoToState("Active")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;stop WIDragonKilled so npc's dont stand around
WIDragonKilledQuest.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;dragon soul has been absorbed
;set in _arcDASQuestDragonActorScript attacked to _arcDragon

;start flashback sequence
_arcFlashbackQuest002.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;player is in flashback, set in stage 5 of _arcFlashbackQuest002

;stop the silence
_arcMUSSilenceDragonAttackScene.Remove()

;delete the dragon
Alias_Dragon.GetReference().Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;the player has entered the tavern during dragon combat
;and combat did not start during the intial scene
;this stage is set by the player alias in the Stage30 state
;run the code from stage 20, minus the objectives

;start the sound marker
DragonSoundMarker.Start()

;start the fx marker
DragonFXMarker.Start()

;start the music
_arcMUSDragonAttackScene.Add()

;make the npc's flee
Alias_Faida.TryToEvaluatePackage()
Alias_JulienneLylvieve.TryToEvaluatePackage()
Alias_VarniusJunius.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;the dragon has been killed

;set the player back to the inactive state
Player.GoToState("Inactive")

;remove the music
_arcMUSDragonAttackScene.Remove()

;stop the sound marker
DragonSoundMarker.Stop()

;stop the fx marker
DragonFXMarker.Stop()

;heal eivind
(Alias_Eivind.GetReference() as Actor).ResetHealthAndLimbs()

;start dragon death scene
_arcDragonAttackSceneQuestScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;the dragon has started attacking inside the tavern
;set at the end of phase 4 of _arcDragonAttackSceneQuestScene

;set the stage in _arcquest002
_arcQuest002.SetStage(130)

;start the sound marker
DragonSoundMarker.Start()

;start the fx marker
DragonFXMarker.Start()

;add the music
_arcMUSDragonAttackScene.Add()

;make the npcs flee
Alias_Faida.TryToEvaluatePackage()
Alias_JulienneLylvieve.TryToEvaluatePackage()
Alias_VarniusJunius.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;the player has left the tavern
;the dragon started attacking in the tavern

;always stop the scene here
_arcDragonAttackSceneQuestScene01.Stop()

;get dragon ref
Actor kDragonRef = Alias_Dragon.GetReference() as Actor

;enable the dragon
kDragonRef.Enable()

;start combat
(Alias_Eivind.GetReference() as Actor).StartCombat(kDragonRef)
kDragonRef.StartCombat(PlayerRef)

;set the stage in _arcquest002
_arcQuest002.SetStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;dragon soul has started to be absorbed
;set in _arcDASQuestDragonActorScript attacked to _arcDragon

;disable some player controls
Game.DisablePlayerControls(abMovement = False, abFighting = False)

;add silent music track
_arcMUSSilenceDragonAttackScene.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;the player has entered the tavern
;telisha was the vicitim, so she does not exist

;ensure eivind is enabled
Alias_Eivind.GetReference().Enable()

;set the player to the correct state
Player.GoToState("Stage10")

;set the stage in _arcquest002
_arcQuest002.SetStage(120)

;start the scene
_arcDragonAttackSceneQuestScene01.Start()

;enable the dragon
Alias_Dragon.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto  

Quest Property _arcFlashbackQuest002  Auto  

Quest Property WIDragonKilledQuest  Auto  

Quest Property _arcQuest002  Auto  

Scene Property _arcDragonAttackSceneQuestScene01  Auto  

_arcDASQuestDSMAliasScript Property DragonSoundMarker Auto

_arcDASQuestDragonFXMarkerAliasScript Property DragonFXMarker Auto

MusicType Property _arcMUSDragonAttackScene  Auto  

_arcDASQuestPlayerAliasScript Property Player Auto

Scene Property _arcDragonAttackSceneQuestScene02  Auto  

MusicType Property _arcMUSSilenceDragonAttackScene  Auto

_arcDASQuestDragonAliasScript Property Dragon Auto
