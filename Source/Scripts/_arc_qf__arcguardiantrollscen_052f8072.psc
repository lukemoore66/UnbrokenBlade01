;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname _arc_QF__arcGuardianTrollScen_052F8072 Extends Quest Hidden

;BEGIN ALIAS PROPERTY StartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardianMarker01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardianMarker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guardian
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guardian Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrollSoundActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrollSoundActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardianMarker03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardianMarker03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BarrierActivatorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BarrierActivatorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardianMarker05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardianMarker05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardianMarker02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardianMarker02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardianMarker04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardianMarker04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrollMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrollMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troll
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troll Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE _arcGTSQuestScript
Quest __temp = self as Quest
_arcGTSQuestScript kmyQuest = __temp as _arcGTSQuestScript
;END AUTOCAST
;BEGIN CODE
;start up stage

;enable barriers
;this implicitly enables the teleport trigger via parent enable state
;on _arcGTSQuestBarrier01Ref
ObjectReference BarrierActivatorMarkerRef = Alias_BarrierActivatorMarker.GetReference()

BarrierActivatorMarkerRef.Activate(BarrierActivatorMarkerRef)

;make sure the _arcGuardianSnowSceneQuest is definitely finished
;and the guardian has time to be banished
;as there is a chance the guardian may not have been banished yet
If _arcGuardianSnowSceneQuest.IsRunning()
    _arcGuardianSnowSceneQuest.Stop()
    Utility.Wait(1.0)
EndIf

kmyQuest.StartupQuest()

;fill out the marker references in the quest script
;this will speed things up as they will remain resident in memory
;as opposed to getting references every time in the scene
kmyQuest.GuardianMarker01Ref = Alias_GuardianMarker01.GetReference()
kmyQuest.GuardianMarker02Ref = Alias_GuardianMarker02.GetReference()
kmyQuest.GuardianMarker03Ref = Alias_GuardianMarker03.GetReference()
kmyQuest.GuardianMarker04Ref = Alias_GuardianMarker04.GetReference()
kmyQuest.GuardianMarker05Ref = Alias_GuardianMarker05.GetReference()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE _arcGTSQuestScript
Quest __temp = self as Quest
_arcGTSQuestScript kmyQuest = __temp as _arcGTSQuestScript
;END AUTOCAST
;BEGIN CODE
;the guardian has appeared for the first time
;it is set at the start of phase 3 of _arcGuardianTrollSceneQuestScene
;this conditionalizes phase 1, 2 and 3 of _arcGuardianTrollSceneQuestScene
;so that they will only run the first time, as the scene repeats as long as the troll
;is still alive

;set the troll to no longer be a ghost
(Alias_Troll.GetReference() as Actor).SetGhost(False)

kmyQuest.GuardianRef.Banish()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;shut down stage
;set at the end of _arcGuardianTrollSceneQuestScene02
;once the player has left the cell
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;the guardian has been banished and we have waited a little while
;this stage is set at the end of phase 3 of _arcGuardianTrollSceneQuestScene

;play the troll roar sound
ObjectReference TrollSoundActivatorRef = Alias_TrollSoundActivator.GetReference()
TrollSoundActivatorRef.Activate(TrollSoundActivatorRef)

;apply the idle drain spell
(Alias_Troll.GetReference() as Actor).DoCombatSpellApply(_arcIdleDrainSpell, PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE _arcGTSQuestScript
Quest __temp = self as Quest
_arcGTSQuestScript kmyQuest = __temp as _arcGTSQuestScript
;END AUTOCAST
;BEGIN CODE
;shut down stage

;remove the idle drain spell
PlayerRef.DispelSpell(_arcIdleDrainSpell)

kmyQuest.ShutdownQuest()

;disable barriers
;this implicitly disables the teleport trigger via parent enable state
;on _arcGTSQuestBarrier01Ref
ObjectReference BarrierActivatorMarkerRef = Alias_BarrierActivatorMarker.GetReference()

BarrierActivatorMarkerRef.Activate(BarrierActivatorMarkerRef)

;clear marker references in quest script so they don't remain resident in memory
kmyQuest.GuardianMarker01Ref = None
kmyQuest.GuardianMarker02Ref = None
kmyQuest.GuardianMarker03Ref = None
kmyQuest.GuardianMarker04Ref = None
kmyQuest.GuardianMarker05Ref = None
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property _arcIdleDrainSpell  Auto  

Actor Property PlayerRef  Auto  

Quest Property _arcGuardianSnowSceneQuest  Auto  
