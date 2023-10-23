;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname _arc_QF__arcEivindNavigateQue_05F851D2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Marker02LakeHonrich
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Marker02LakeHonrich Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LeanMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LeanMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Marker01LakeGier
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Marker01LakeGier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eivind
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eivind Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorEmbassyTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorEmbassyTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Marker04AspenGrove
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Marker04AspenGrove Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Marker06MountainPath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Marker06MountainPath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Marker03TrevasWatch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Marker03TrevasWatch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LetsGoMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LetsGoMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Marker07Odelia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Marker07Odelia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TavernMeetMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TavernMeetMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapFlagAct
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapFlagAct Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Marker05DragonMound
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Marker05DragonMound Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LumberCampDoorInt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LumberCampDoorInt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapEnableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OdeliaMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OdeliaMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TableTrig
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TableTrig Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY UpstairsMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_UpstairsMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;the stage is set at the start of _arcEivindNavigateQuestScene02
;it conditionalizes _arcEivindNavigateQuestEivindBranchMapTopic
;so we know that the scene played out

;fade in the game to give things time to load in
Game.FadeOutGame(False, True, 3.0, 1.0)

;enable the trigger, this will disable objects on the table
Alias_TableTrig.GetReference().Enable()

;set eivind to not follow
Eivind.SetFollow(False)

;move eivind out of the way
(Alias_Eivind.GetReference()).MoveTo(Alias_UpstairsMarker.GetReference())

;add perk to player to prevent them from activating the table
;which makes it difficult to activate the map marker
PlayerRef.AddPerk(_arcENQuestPerk)

;set the player alias to the Inactive state
;this is so we stop firing OnLocationChange events
Player.GoToState("Inactive")

;let the quest know that we have played out the scene
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;set at the end of _arcEivindNavigateQuestScene02
;once the player leaves the lumber camp

;enable all items that were disabled by the trigger
Int Index = _arcENQuestFormList.GetSize()
While Index
    Index -= 1
    (_arcENQuestFormList.GetAt(Index) as ObjectReference).EnableNoWait()
EndWhile

;revert the form list now that we are done with it
_arcENQuestFormList.Revert()

;disable the map enable marker now that we have left
Alias_MapEnableMarker.GetReference().DisableNoWait()

;set eivind to back to following
Eivind.SetFollow(True)

;if eivind was navigating, restart his scene
If EivindWasNavigating
    _arcEivindNavigateQuestScene.ForceStart()
EndIf

;remove the perk from the player, this allows them to activate
;the table in the lumber camp again
PlayerRef.RemovePerk(_arcENQuestPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;this stage is set in _arcENQuestTriggerAliasScript
;once the trigger has finished clearing items off the table

;enable the objects required for the scene
Alias_MapEnableMarker.GetReference().Enable(False)

;start the scene
_arcEivindNavigateQuestScene02.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;the stage is set in stage 10 if it's fragment conditions were satisfied
;it conditionalizes _arcEivindNavigateQuestEivindBranchMapTopic and
;stage 10's fragment
;so we know that the scene played out

;if eivind's navigation scene was playing
;put it into a variable so we can resume it when we leave the lumbercamp
EivindWasNavigating = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE _arcEivindNavigateQuestScript
Quest __temp = self as Quest
_arcEivindNavigateQuestScript kmyQuest = __temp as _arcEivindNavigateQuestScript
;END AUTOCAST
;BEGIN CODE
;start up stage

;get destination reference
ObjectReference DestRef = Alias_Marker07Odelia.GetReference()

kmyQuest.DestRefPosX = DestRef.GetPositionX()
kmyQuest.DestRefPosY = DestRef.GetPositionY()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;shut down stage
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Bool Property EivindWasNavigating  Auto Hidden 

Scene Property _arcEivindNavigateQuestScene02  Auto  

_arcENQuestPlayerAliasScript Property Player Auto

Scene Property _arcEivindNavigateQuestScene  Auto  

FormList Property _arcENQuestFormList  Auto  

Perk Property _arcENQuestPerk  Auto  

Actor Property PlayerRef  Auto  

_arcENQuestEivindAliasScript Property Eivind Auto
