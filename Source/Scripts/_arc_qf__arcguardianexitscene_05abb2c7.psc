;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname _arc_QF__arcGuardianExitScene_05ABB2C7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY PullChain
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PullChain Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guardian
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guardian Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrapLinker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrapLinker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FactionTrigger Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;shut down stage
;this stage is set at the end of_arcGuardianEntrySceneQuestScene01
;as the quest is set to end at the end of the scene

;banish the guardian
(Alias_Guardian.GetReference() as _arcSummonFXScript).Banish(True)

;set the pullchain back to the Ready state
(Alias_PullChain.GetReference() as _arcGExSQuestPullChainExtRefScript).GoToState("Ready")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;the door is ready to be opened
;this stage is set at the start of phase 3 of _arcGuardianExitSceneQuestScene01

;set the guardian to the Active state
Guardian.GoToState("Active")

;activate the door and traps
Alias_TrapLinker.GetReference().Activate(Alias_Guardian.GetReference())

;enable the guardian favour faction trigger
Alias_FactionTrigger.GetReference().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;this stage is set at the end of phase 4 of _arcGuardianExitSceneQuestScene01
;it conditionalizes
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;the door is ready to be closed
;this stage is set at the end of phase 3 of _arcGuardianExitSceneQuestScene01

;set the guardian to the Inactive state
Guardian.GoToState("Inactive")

;always disable the external faction and teleport triggers
ObjectReference FactionTriggerRef = Alias_FactionTrigger.GetReference()
FactionTriggerRef.DisableNoWait()
FactionTriggerRef.GetLinkedRef().DisableNoWait()

;activate the door and traps, this makes them stop
Alias_TrapLinker.GetReference().Activate(Alias_Guardian.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;start up stage

;get guardian ref
_arcSummonFXScript GuardianRef = Alias_Guardian.GetReference() as _arcSummonFXScript

;move guardian into position
GuardianRef.Disable()
GuardianRef.MoveTo(Alias_StartMarker.GetReference())

;summon guardian
GuardianRef.Summon(True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcGExSQuestGuardianAliasScript Property Guardian Auto
