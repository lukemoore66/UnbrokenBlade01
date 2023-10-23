;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname _arc_QF__arcCalderSmuggleSce_05BE0698 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Smuggler
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Smuggler Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CalderMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CalderMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmugglerMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmugglerMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Calder
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Calder Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;the smuggler got to smuggler's den alive
;this stage is set in the smuggler's alias script

;move smuggler to editor location
Smuggler.GetReference().MoveToMyEditorLocation()

;set the smuggler to be aggressive
Smuggler.TrySetAggression(2.0)

;stop the quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;shutdown stage
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;this stage is set at the end of phase 1 of _arcCalderSmuggleSceneQuestScene01
;when both actors are known to be running their quest packages

;move calder and smuggler into postion
(Alias_Calder.GetReference() as Actor).MoveToPackageLocation()
(Alias_Smuggler.GetReference() as Actor).MoveToPackageLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;start up stage

;fade in the game to hide any movement of actors
Game.FadeOutGame(False, True, 3.0, 1.0)

;move calder and smuggler into postion
Calder.TryMoveTo(Alias_CalderMarker.GetReference())
Smuggler.TryMoveTo(Alias_SmugglerMarker.GetReference())

;give player perk so they cannot activate calder or the smuggler
PlayerRef.AddPerk(_arcCSSQuestPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;the scene is finished

;set the state of the smuggler's alias to stage10
Smuggler.GoToState("Stage10")

;remove perk from player so they can activate calder and the smuggler
PlayerRef.RemovePerk(_arcCSSQuestPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;this stage conditionalizes calder's forcegreet in
;_arcCalderSmuggleSceneQuestCalderFGBranchTopic
;it is set at the end of _arcCalderSmuggleSceneQuestScene02 and
;at the end of _arcCalderSmuggleSceneQuestCalderFGBranchTopic
;depending on what happens first
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcQuestActorAliasScript Property Calder Auto

_arcCSSQuestSmugglerAliasScript Property Smuggler Auto

Perk Property _arcCSSQuestPerk  Auto  

Actor Property PlayerRef  Auto  
