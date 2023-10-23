;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname _arc_QF__arcGuardianEntrySce_052792D4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY PullChain
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PullChain Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guardian
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guardian Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShoutTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShoutTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrapLinker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrapLinker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TeleportTriggerExt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TeleportTriggerExt Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;this stage is set in phase 4 of _arcGuardianEntrySceneQuestScene01
;it conditionalizes _arcGESQuestPullChainIntRefScript so that we know
;when the traps stop firing, and we can allow the internal pullchain
;to be activated
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;shut down stage
;this stage is set at the end of_arcGuardianEntrySceneQuestScene01
;as the quest is set to end at the end of the scene

;banish the guardian
(Alias_Guardian.GetReference() as _arcSummonFXScript).Banish(True)

;set the pullchain back to the Ready state
(Alias_PullChain.GetReference() as _arcGESQuestPullChainExtRefScript).GoToState("Ready")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;start up stage

;get guardian ref
_arcSummonFXScript GuardianRef = Alias_Guardian.GetReference() as _arcSummonFXScript

;move guardian into position
GuardianRef.Disable()
GuardianRef.MoveToMyEditorLocation()

;summon guardian
GuardianRef.Summon(True)

;set the guardian to the Active state
Guardian.GoToState("Active")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;the door is ready to be closed
;this stage is set at the end of phase 3 of _arcGuardianEntrySceneQuestScene01

;set the guardian to the Inactive state
Guardian.GoToState("Inactive")

;always disable the external teleport trigger
Alias_TeleportTriggerExt.GetReference().Disable()

;activate the door and traps, this makes them stop
Alias_TrapLinker.GetReference().Activate(Alias_Guardian.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;the door is ready to be opened
;this stage is set at the start of phase 3 of _arcGuardianEntrySceneQuestScene01

;activate the door and traps
Alias_TrapLinker.GetReference().Activate(Alias_Guardian.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcGESQuestGuardianAliasScript Property Guardian Auto
