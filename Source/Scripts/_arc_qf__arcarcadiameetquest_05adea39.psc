;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 30
Scriptname _arc_QF__arcArcadiaMeetQuest_05ADEA39 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Arcadia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Arcadia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guardian
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guardian Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArcadiaPatrolMarker01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArcadiaPatrolMarker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArcadiaNocturnalMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArcadiaNocturnalMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardianDestMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardianDestMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArcadiaDestMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArcadiaDestMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WordWallTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WordWallTrigger Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;set at the end of _arcArcadiaMeetQuestArcadiaChroniclerBranchTopic
;conditionalizes dialogue for _arcArcadiaMeetQuestArcadiaKyne01BranchTopic
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;set in stage 60 of _arcQuest004
;the player has finished talking to the guardian
;about gifiting the summon spell and saving arcadia

;start the summon scene
_arcArcadiaMeetQuestScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;set at the end of phase 5 of _arcArcadiaMeetQuestScene01
;once the player has left odelia and in the flashback
;we need to set up everything ready for the player to return to odelia

;move arcadia into position
Arcadia.TryMoveTo(Alias_ArcadiaDestMarker.GetReference())

;set stage to 35 in _arcQuest004
;this moves the guardian into position and enables him
;so he can interact with the player once they are back in odelia
_arcQuest004.SetStage(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;set at the end of phase 7 of _arcArcadiaMeetQuestScene01
;one the payer has returned from the flashback to odelia
;this stage conditionalizes arcadia's forcegreet package
;_arcAMQArcadiaFGStage100 so that she forcegreets once the player
;has controls returned to them after the flashback

(Alias_Arcadia.GetReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;start up stage
;conditionalizes dialogue for _arcArcadiaMeetQuestArcadiaFGBranchTopic
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;set at the end of _arcArcadiaMeetQuestScene02
;the guardian has finished talking about giving you the summon spell

;banish the guardian
((Alias_Guardian.GetReference() as Actor) as _arcSummonFXScript).Banish(False)

;set the stage in _arcQuest004 to 80
;this will conditionalize the guardian's package 
;_arcQuest004GuardianTravelGuardianDestMarker so he will not try to travel
;when called upon at the exit in arcOdelia06 cell
_arcQuest004.SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;set at the end of _arcArcadiaMeetQuestScene01
;arcadia has finished being confused about valronis and will now leave

;banish arcadia
((Alias_Arcadia.GetReference() as Actor) as _arcSummonFXScript).Banish(False)

;set stage in _arcQuest004 to conditionalize the guardian's dialogue for
;_arcQuest004GuardianExit01BranchTopic
_arcQuest004.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;the player has engaged in dialogue with arcadia
;this stage is set at the end of _arcArcadiaMeetQuestArcadiaFGBranchTopic

;tell the parent quest, _arcQuest004 to advance its stage to 30
;this will remove the silence and the music will start playing again
_arcQuest004.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;set at the end of phase 2 of _arcArcadiaMeetQuestScene02
;the guardian is in position and praying
;ready to give the player the summon spell

;cast the summon give spell on the player
;the does not add _arcSummonGuardianSpell to the player
;it only handles fx for the scene
;that is done by the parent quest, _arcQuest004 at stage 70
_arcSummonGuardianGiveSpell.Cast(Alias_Guardian.GetReference() as Actor, PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;set at the end of phase 4 of _arcArcadiaMeetQuestScene01

;shout at the player
;this has to be performed via script, as an ai package does not work
_arcShoutRevealTruthSpell.Cast(Alias_Arcadia.GetReference(), PlayerRef)

;start the flashback quest
_arcFlashbackQuest004.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;set at the end of _arcArcadiaMeetQuestArcadiaKyne02BranchTopic
;starts phase 3 of _arcArcadiaMeetQuestScene01 so arcadia will wait before shouting
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;this stage is set at the end of _arcArcadiaMeetQuestArcadiaValronisBranchTopic
;once arcadia has expressed her confusion about valronis
;it conditionalizes dialogue for _arcArcadiaMeetQuestArcadiaValronisBranchTopic
;so she only says it once
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;set at the start of _arcArcadiaMeetQuestArcadiaKyne02BranchTopic

;stop the player from moving
Game.DisablePlayerControls(ablooking = True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;set at the end of phase 3 of _arcArcadiaMeetQuestScene02
;once the player has been given the summon power

;set the stage to 70 in _arcQuest004
;this will add the guardian summon spell to the player
;this is better handled in the parent quest
;so it is consistent with adding factions, spell etc to the player
_arcQuest004.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;set at the end of _arcArcadiaMeetQuestArcadiaVisionBranchTopic
;this is to conditionalize the above package so that arcadia only force greets once
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;set at the end of _arcArcadiaMeetQuestArcadiaKyne01BranchTopic
;conditionalizes dialogue for _arcArcadiaMeetQuestArcadiaKyne02BranchTopic
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;set at the end of _arcArcadiaMeetQuestArcadiaWhyBranchTopic
;conditionalizes dialogue for _arcArcadiaMeetQuestArcadiaChroniclerBranchTopic
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;set at the end of _arcArcadiaMeetQuestArcadiaWhoBranchTopic
;conditionalizes dialogue for _arcArcadiaMeetQuestArcadiaWhyBranchTopic
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcQuestActorAliasScript Property Arcadia Auto

Quest Property _arcQuest004  Auto  

SPELL Property _arcShoutRevealTruthSpell  Auto  

ObjectReference Property PlayerRef  Auto  

Quest Property _arcFlashbackQuest004  Auto  


Scene Property _arcArcadiaMeetQuestScene02  Auto  

SPELL Property _arcSummonGuardianGiveSpell  Auto  
