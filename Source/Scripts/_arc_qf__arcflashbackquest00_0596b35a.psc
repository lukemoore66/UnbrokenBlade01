;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 40
Scriptname _arc_QF__arcFlashbackQuest00_0596B35A Extends Quest Hidden

;BEGIN ALIAS PROPERTY EivindLetsGoMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EivindLetsGoMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Arcadia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Arcadia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArcadiaPrayMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArcadiaPrayMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMound
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMound Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonPerch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonPerch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoverMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HoverMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShoutMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShoutMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MusicTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MusicTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArcadiaFinishMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArcadiaFinishMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerChair
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerChair Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EivindForceGreetMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EivindForceGreetMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LumberCampDoorExt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LumberCampDoorExt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArcadiaMeditateMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArcadiaMeditateMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DRAGON
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DRAGON Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EivindLumberCampPlayerBedMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EivindLumberCampPlayerBedMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eivind
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eivind Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
;if eivind is already hostile

;set stage to 120, this cancels the force greet
SetStage(120)

;start the brawl quest
_arcBrawlQuestKeyword.SendStoryEvent(akRef1 = Alias_Eivind.GetReference() as Actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE _arcFlashbackQuestScript
Quest __temp = self as Quest
_arcFlashbackQuestScript kmyQuest = __temp as _arcFlashbackQuestScript
;END AUTOCAST
;BEGIN CODE
;complete the flashback sequence
;RingGiver was calder, so run calder variant

SittingAngleLimit.SetValue(SittingAngleLimitOrig)

;wake up where you left off
kmyQuest.FlashbackOut(None, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;end of phase 6 (look at player)

;let the dragon fly off
(Alias_Dragon.GetReference() as Actor).SetAllowFlying(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE _arcFlashbackQuestScript
Quest __temp = self as Quest
_arcFlashbackQuestScript kmyQuest = __temp as _arcFlashbackQuestScript
;END AUTOCAST
;BEGIN CODE
;quest start / startup stage

;lock followers out of the lumber camp
LumberCampDoorExt.GoToState("Active")

;set dragon to be unaggressive (only attack enemies)
Dragon.TrySetAggression(1.0)

;disable flying for the dragon
(Alias_Dragon.GetReference() as Actor).SetAllowFlying(False)

;limit the player's looking angles
SittingAngleLimitOrig = SittingAngleLimit.GetValue()
SittingAngleLimit.SetValue(0.6)

;start the flashback sequence
kmyQuest.FlashbackIn(Alias_PlayerChair.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;eivind's other dialogue options now available
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;end of phase 3 (get out of mound)

;shake the camera
Game.ShakeCamera(None, 1.0, 4.0)

;shake the controller
Game.ShakeController(0.6, 0.6, 4.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;player and eivind stopped brawling
;set in stage 60 of _arcBrawlQuest

;start lets go scene
_arcFlashbackQuest001Scene02.Start()

;manually set stage to 140, this will show objectives at the correct time
;while not finishing the quest
SetStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;start of phase 7 (fly off)

;shake the camera
Game.ShakeCamera(None, 0.75, 2.5)

;shake the controller
Game.ShakeController(0.6, 0.6, 1.5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;player now at destination, eivind variant

;player go to stage 90 state
Player.GoToState("Stage90")

;enable player controls
Game.EnablePlayerControls()

;eivind forcegreet
(Alias_Eivind.GetReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;end of phase 1 (wait)

;activate the dragon mound
;this also activates the dragon shout marker
;as it is an activation parent for it
;cannot use player to activate as they have activation controls disabled

;get dragon mound ref
ObjectReference DragonMoundRef = Alias_DragonMound.GetReference()

;activate self
DragonMoundRef.Activate(DragonMoundRef)

;disable the music trigger
Alias_MusicTrigger.GetReference().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;eivind forcegreet complete
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;player has left lumbercamp (eivind variant)
;or player has gotten up in stage 80 (calder variant)
;complete quest here

;allow followers back into the lumber camp
LumberCampDoorExt.GoToState("Inactive")

;set the stage in _arcQuest001, so ring is gone, no matter what
;it also conditionalizes everyone's alias packages for that quest as needed
_arcQuest001.SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;start of phase 5 (done shouting)

;stop shout marker from moving
;cannot use player as they have activation controls disabled

;get shout marker ref
ObjectReference ShoutMarkerRef = Alias_ShoutMarker.GetReference()

;activate self
ShoutMarkerRef.Activate(ShoutMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;player now at destination, calder variant

;enable player controls
Game.EnablePlayerControls()

;stop quest here, it also completes, as stage 140 is a shutdown stage
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
;player and eivind start brawling
;this stage conditionalizes eivind's alias package in _arcQuest001
;so that he doesn't run to the winking skeever
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE _arcFlashbackQuestScript
Quest __temp = self as Quest
_arcFlashbackQuestScript kmyQuest = __temp as _arcFlashbackQuestScript
;END AUTOCAST
;BEGIN CODE
;complete the flashback sequence
;RingGiver was not calder, so run eivind variant

;limit the player's movement
SittingAngleLimit.SetValue(SittingAngleLimitOrig)

;move eivind to his marker in lumber camp
Eivind.TryMoveTo(Alias_EivindForceGreetMarker.GetReference())

;override the flashback return marker and go to eivind's house
kmyQuest.FlashbackOut(Alias_EivindLumberCampPlayerBedMarker.GetReference(), False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;end of phase 7 (fly off)

;disable controls to help center camera anim
Game.DisablePlayerControls(abLooking = True, abCamSwitch = True, abSneaking = True)

;this combination if idles centers the camera
PlayerRef.PlayIdle(IdleWalkingCameraStart)
Utility.Wait(1.5)
PlayerRef.PlayIdle(IdleWalkingCameraEnd)

;disable dragon
(Alias_Dragon.GetReference() as Actor).Disable(False)

;set dragon back to being aggressive
Dragon.TryResetAggression()

;play dragon roar
Int SoundInstance = NPCDragonFlightRoar.Play(Alias_HoverMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
;start of phase 9 (wait for anim)

;play get up animation
PlayerRef.PlayIdle(Idle_1stPersonWoozyGetUpFromBed)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto  

GlobalVariable Property SittingAngleLimit  Auto  

Float Property SittingAngleLimitOrig  Auto  Hidden

Sound Property NPCDragonFlightRoar  Auto  

Idle Property Idle_1stPersonWoozyGetUpFromBed  Auto  

Idle Property IdleWalkingCameraStart  Auto  

Idle Property IdleWalkingCameraEnd  Auto  

_arcFBQ001PlayerAliasScript Property Player Auto

Quest Property _arcQuest001  Auto  

Scene Property _arcFlashbackQuest001Scene02  Auto 

_arcQuestActorAliasScript Property Eivind Auto

_arcQuestActorAliasScript Property Dragon Auto

Keyword Property _arcBrawlQuestKeyword  Auto  

_arcLumberCampDoorExtAliasScript Property LumberCampDoorExt Auto
