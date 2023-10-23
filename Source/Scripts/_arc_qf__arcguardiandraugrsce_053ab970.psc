;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname _arc_QF__arcGuardianDraugrSce_053AB970 Extends Quest Hidden

;BEGIN ALIAS PROPERTY pullBar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_pullBar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY draugr07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_draugr07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY draugr01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_draugr01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY draugr06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_draugr06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DoorActMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DoorActMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FinishMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FinishMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Stage30Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Stage30Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY draugr02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_draugr02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Door
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Door Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShaftPortcullis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShaftPortcullis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY draugr05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_draugr05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY draugr04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_draugr04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartMarker02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StartMarker02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrapActivationMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrapActivationMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guardian
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guardian Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY draugr03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_draugr03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE _arcGDSQuestScript
Quest __temp = self as Quest
_arcGDSQuestScript kmyQuest = __temp as _arcGDSQuestScript
;END AUTOCAST
;BEGIN CODE
;set at the end of phase 10 of _arcGuardianDraugrSceneQuestScene
;banish the guardian
kmyQuest.ShutdownQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE _arcGDSQuestScript
Quest __temp = self as Quest
_arcGDSQuestScript kmyQuest = __temp as _arcGDSQuestScript
;END AUTOCAST
;BEGIN CODE
;stage 30 trigger has been entered
;this stage is set at the start of phase 5 of _arcGuardianDraugrSceneQuestScene

;delay summoning slightly
Utility.Wait(4.0)

;move guardian into position
kmyQuest.GuardianRef.MoveTo(Alias_StartMarker02.GetReference())

;summon the guardian
kmyQuest.GuardianRef.Summon(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;start up stage

;lock the door
Alias_Door.GetReference().Lock(True)

;set the eastern shaft portcullis to open
(Alias_ShaftPortcullis.GetReference() as _arcDefault2StateActivator).IsOpen = True

;add perk to player
;this will show the Release activation text when they are chained up
;and filter activation once they are released
PlayerRef.AddPerk(_arcGDSQuestPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE _arcGDSQuestScript
Quest __temp = self as Quest
_arcGDSQuestScript kmyQuest = __temp as _arcGDSQuestScript
;END AUTOCAST
;BEGIN CODE
;shut down stage
;set at the end of _arcGuardianDraugrSceneQuestScene

;remove perk from player
;we do not need to filter activation of the draugr anymore
PlayerRef.RemovePerk(_arcGDSQuestPerk)

;reset the draugr released count, update global, just in case
kmyQuest._arcDraugrReleasedCount.SetValue(0.0)
UpdateCurrentInstanceGlobal(kmyQuest._arcDraugrReleasedCount)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;all draugr have been killed
;this stage is set at the end of phase 6 of _arcGuardianDraugrSceneQuestScene

;enable stage 30 trigger
Alias_Stage30Trigger.GetReference().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE _arcGDSQuestScript
Quest __temp = self as Quest
_arcGDSQuestScript kmyQuest = __temp as _arcGDSQuestScript
;END AUTOCAST
;BEGIN CODE
;we have waited a few seconds after the player has entered the trigger
;this stage is set at the end of phase 1 of _arcGuardianDraugrSceneQuestScene

kmyQuest.StartupQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;stage 30 trigger has been entered by the player
;this stage is set to conditionalize the end of phase 7
;in _arcGuardianDraugrSceneQuestScene, so that the guardian
;is summoned in phase 8
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE _arcGDSQuestScript
Quest __temp = self as Quest
_arcGDSQuestScript kmyQuest = __temp as _arcGDSQuestScript
;END AUTOCAST
;BEGIN CODE
;banish guardian
;this stage is set at the start of phase 4 of _arcGuardianDraugrSceneQuestScene

kmyQuest.GuardianRef.Banish(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Perk Property _arcGDSQuestPerk  Auto  

Actor Property PlayerRef  Auto  
