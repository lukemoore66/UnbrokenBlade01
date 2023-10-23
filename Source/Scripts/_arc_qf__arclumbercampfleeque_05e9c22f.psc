;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname _arc_QF__arcLumberCampFleeQue_05E9C22F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Citizen02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorAgent02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lucky
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lucky Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EmbassyGateMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EmbassyGateMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VarniusJunius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VarniusJunius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorAgent01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen07 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;start up stage

;there may be quest startup lag, causing actors to be in combat, not executing thier packages

;try to stop combat for all citizens and guards
Alias_Lucky.TryToStopCombat()
Alias_VarniusJunius.TryToStopCombat()
Alias_Citizen01.TryToStopCombat()
Alias_Citizen02.TryToStopCombat()
Alias_Citizen03.TryToStopCombat()
Alias_Citizen04.TryToStopCombat()
Alias_Citizen05.TryToStopCombat()
Alias_Citizen06.TryToStopCombat()
Alias_Citizen07.TryToStopCombat()
Alias_Citizen08.TryToStopCombat()
Alias_Citizen09.TryToStopCombat()
Alias_Citizen10.TryToStopCombat()
Alias_Citizen11.TryToStopCombat()
Alias_Citizen12.TryToStopCombat()
Alias_Citizen13.TryToStopCombat()
Alias_Citizen14.TryToStopCombat()
Alias_Citizen15.TryToStopCombat()
Alias_Citizen16.TryToStopCombat()
Alias_Guard01.TryToStopCombat()
Alias_Guard02.TryToStopCombat()
Alias_Guard03.TryToStopCombat()
Alias_Guard04.TryToStopCombat()

;try to evaluate package for all citizens and guards
Alias_Lucky.TryToEvaluatePackage()
Alias_VarniusJunius.TryToEvaluatePackage()
Alias_Citizen01.TryToEvaluatePackage()
Alias_Citizen02.TryToEvaluatePackage()
Alias_Citizen03.TryToEvaluatePackage()
Alias_Citizen04.TryToEvaluatePackage()
Alias_Citizen05.TryToEvaluatePackage()
Alias_Citizen06.TryToEvaluatePackage()
Alias_Citizen07.TryToEvaluatePackage()
Alias_Citizen08.TryToEvaluatePackage()
Alias_Citizen09.TryToEvaluatePackage()
Alias_Citizen10.TryToEvaluatePackage()
Alias_Citizen11.TryToEvaluatePackage()
Alias_Citizen12.TryToEvaluatePackage()
Alias_Citizen13.TryToEvaluatePackage()
Alias_Citizen14.TryToEvaluatePackage()
Alias_Citizen15.TryToEvaluatePackage()
Alias_Citizen16.TryToEvaluatePackage()
Alias_Guard01.TryToEvaluatePackage()
Alias_Guard02.TryToEvaluatePackage()
Alias_Guard03.TryToEvaluatePackage()
Alias_Guard04.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;the thalmor have left dragon bridge or are dead
;this stage is set at the end of phase 1 of _arcLumberCampFleeQuestScene

;set the stage in _arcquest003 so that eivind will now force greet the player
;telling them to leave
_arcQuest003.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;thalmor agent 1 is not disabled
;manually set to the active state

ThalmorAgent01.GoToState("Active")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;shut down stage
;this runs when _arcLumberCampFleeQuestScene is completed
;the thalmor are now rendered inert
;they are both disabled / dead
;or the player hes entered odelia

;force both thalmor to the inactive state
ThalmorAgent01.GoToState("Inactive")
ThalmorAgent02.GoToState("Inactive")

;stop this quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;if thalmor agent 2 is not dead

;remove thalmor agent 2
ThalmorAgent02.TryRemove()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;thalmor agent 2 is not dead or disabled
;manually set to the active state

ThalmorAgent02.GoToState("Active")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property _arcQuest003  Auto  

_arcLCFQuestThalmorAliasScript Property ThalmorAgent01 Auto

_arcLCFQuestThalmorAliasScript Property ThalmorAgent02 Auto
