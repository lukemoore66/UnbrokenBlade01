;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname _arc_QF__arcFlashbackQuest002_05DE0B3C Extends Quest Hidden

;BEGIN ALIAS PROPERTY ChoppingBlock
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ChoppingBlock Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Horse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Horse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Headsman
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Headsman Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Officer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Officer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HusbandLookMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HusbandLookMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Door
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Door Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ValronisTurnMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ValronisTurnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ValronisMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ValronisMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArcadiaVoice
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArcadiaVoice Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cillian
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cillian Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Valronis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Valronis Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE _arcFlashbackQuest002Script
Quest __temp = self as Quest
_arcFlashbackQuest002Script kmyQuest = __temp as _arcFlashbackQuest002Script
;END AUTOCAST
;BEGIN CODE
;scene complete

;play flashback out sequence
kmyQuest.FlashbackOut(abEnableControls = False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;player is in flashback, controls are returned

;play title sequence
Game.ShowTitleSequenceMenu()
Game.StartTitleSequence("Sequence5")

;wait for title sequence
Utility.Wait(12.0)

;hide title sequence
Game.HideTitleSequenceMenu()

;set the stage so the scene can continue
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE _arcFlashbackQuest002Script
Quest __temp = self as Quest
_arcFlashbackQuest002Script kmyQuest = __temp as _arcFlashbackQuest002Script
;END AUTOCAST
;BEGIN CODE
;move valronis into position
Valronis.TryMoveTo(Alias_ValronisMarker.GetReference())

;start flashback sequence
kmyQuest.FlashbackIn(Alias_PlayerMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE _arcFlashbackQuest002Script
Quest __temp = self as Quest
_arcFlashbackQuest002Script kmyQuest = __temp as _arcFlashbackQuest002Script
;END AUTOCAST
;BEGIN CODE
;head chop start

;register for animation event
kmyQuest.RegisterForAnimationEvent(Alias_Cillian.GetReference(), "Decapitate")

;activate the chopping block
ObjectReference kChoppingBlockRef = Alias_ChoppingBlock.GetReference()
kChoppingBlockRef.Activate(kChoppingBlockRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;player has finished get up animation

;return controls to player
Game.EnablePlayerControls()

;remove the music from the music stack
_arcMUSFlashback002Sting.Remove()

;set the stage in _arcDragonAttackSceneQuest
_arcDragonAttackSceneQuest.SetStage(80)

;disable valronis and move valronis back to the thalmor barracks
Actor ValronisRef = Alias_Valronis.GetReference() as Actor
ValronisRef.Disable()
ValronisRef.MoveToMyEditorLocation()

;stop this quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;head chop complete

;kill the husband
(Alias_Cillian.GetReference() as Actor).Kill()

;play enhance sound
_arcHeadChopEnhanceSFX.Play(PlayerRef)

;apply imod
GetHit.Apply()

;shake camera / controller
Game.ShakeCamera(None, 0.3, 0.5)
Game.ShakeController(0.5, 0.5, 0.5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;player alias has returned from flashback

;play get up animation
PlayerRef.PlayIdle(Idle_1stPersonWoozyGetUpFromBed)

;restore cillian to his default state
Cillian.TryReset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;title sequence finished
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;player alias has moved to outpost location

;set the stage in _arcDragonAttackSceneQuest
_arcDragonAttackSceneQuest.SetStage(70)

;add the music
_arcMUSFlashback002Sting.Add()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcFlashbackQuestScript Property _arcFlashbackQuest002 Auto

MusicType Property _arcMUSFlashback002Sting  Auto  

ImageSpaceModifier Property GetHit  Auto  

Quest Property _arcDragonAttackSceneQuest  Auto  

Actor Property PlayerRef  Auto  

Idle Property Idle_1stPersonWoozyGetUpFromBed  Auto  

Scene Property _arcFlashbackQuest002Scene  Auto  

Sound Property _arcHeadChopEnhanceSFX  Auto  

_arcQuestActorAliasScript Property Valronis Auto

_arcQuestActorAliasScript Property Cillian Auto
