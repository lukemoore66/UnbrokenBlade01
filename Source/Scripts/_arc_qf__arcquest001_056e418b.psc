;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 171
Scriptname _arc_QF__arcQuest001_056E418B Extends Quest Hidden

;BEGIN ALIAS PROPERTY ArcadiaRing
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArcadiaRing Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eivind
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eivind Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Halvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Halvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Courier
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Courier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TelishaLockbox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TelishaLockbox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Telisha
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Telisha Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Calder
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Calder Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TyraContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TyraContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TelishaLetter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TelishaLetter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Solitude
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Solitude Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonBridgeTavern
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DragonBridgeTavern Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonBridgeTavernCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonBridgeTavernCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonBridgeTavernEivindMeetMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonBridgeTavernEivindMeetMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolitudeCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeWinkingSkeever
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SolitudeWinkingSkeever Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeWinkingSkeeverCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolitudeWinkingSkeeverCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_141
Function Fragment_141()
;BEGIN CODE
;the player obtained the ring from the lockbox or telisha
;this means they will wake up in the lumber camp with eivind

;set eivind as an ally so he will not attack the player straight away
Eivind.SetAlly(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_116
Function Fragment_116()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;this stage is advanced to if eivind and the player brawled
;it is advanced to at the end of _arcFlashbackQuest001
;it is for log entry purposes, and showing new objectives

;set eivind as an ally so he will no longer fight the player
Actor EivindRef = Eivind.GetReference() as Actor
EivindRef.StopCombat()
Eivind.SetAlly(True)
EivindRef.EvaluatePackage()

;fail the current objective
SetObjectiveFailed(kmyQuest.CurrentObjective)

;show meet with eivind objective
kmyQuest.SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player did not believe telisha
;this is set at the end of _arcQuest001TelishaRingBranchBelieveNo 
;this conditionalizes telisha's dialogue on _arcDialogueQuest and _arcCoinTossQuest
;so is no longer available
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_136
Function Fragment_136()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;set by stage 160 and 170
;prep quest for completion

;set the bandit journal date for _arcquest002
_arcSDBanditJournalDate.SetValue(GameDaysPassed.GetValue() - 2.0)

;complete the current objective
SetObjectiveCompleted(kmyQuest.CurrentObjective)

;complete / stop the quest
SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_170
Function Fragment_170()
;BEGIN CODE
;remove the tavern lockpicking perk if the player has it
PlayerRef.RemovePerk(_arcQuest001LockpickPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_68
Function Fragment_68()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;flashback sequence begins
;this is set in _arcArcadiaRingMagicEffectScript which is attached to the _arcArcadiaRingSpell
;added to the player at the end of the RingGiver = 2,3,4 fragments in stage 70 of this quest

;stop the ring fx
PlayerRef.RemoveSpell(_arcArcadiaRingSpell)

;start the flashback quest
_arcFlashbackQuest001.Start()

;give the ring to tyra
kmyQuest.SetRingContainer(Alias_TyraContainer.GetReference())

;set the ring taken date and time for telisha's journal
_arcTelishaJournalDate02.SetValue(GameDaysPassed.GetValue())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_163
Function Fragment_163()
;BEGIN CODE
;the player has received telisha's letter

;always remove the previous inventory event filter from the player alias
Player.RemoveInventoryEventFilter(Alias_TelishaLetter.GetReference())

;if the speak to calder objective (50) is still displayed
;always remove it, as we have telisha's letter and should read it instead
If IsObjectiveDisplayed(50)
    ;do not use the _arcQuestScript version of SetObjectiveDisplayed()
    ;we only want the vanilla version that does not set the CurrentObjective
    ;conditional variable that is used throughout this quest
    SetObjectiveDisplayed(50, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_115
Function Fragment_115()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;this stage is advanced to once the player wakes up from the flashback
;and did not brawl eivind
;it is advanced to at the end of _arcFlashbackQuest001
;it is for log entry purposes, and showing new objectives

;fail the current objective
SetObjectiveFailed(kmyQuest.CurrentObjective)

;show the speak to calder objective
kmyQuest.SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_160
Function Fragment_160()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player has received telisha's letter
;as long as the objective
;is not return the ring to calder (30) and
;is not return the ring to telisha (60)

;set the telisha enter cave date and time for telisha's journal
_arcTelishaJournalDate03.SetValue(GameDaysPassed.GetValue())

;remove current objective
kmyQuest.SetObjectiveDisplayed(kmyQuest.CurrentObjective, False)

;show objective to read telisha's letter
kmyQuest.SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_103
Function Fragment_103()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;this stage only runs if we confronted calder
;it is set at the end of _arcQuest001CalderConfrontBranchTalk
;the player never got the ring, so RingGiver must equal 0
;also the player overall won or drew against her at coin toss
;it is implied that the player confronted calder
;the player won the brawl

;complete the current objective
SetObjectiveCompleted(kmyQuest.CurrentObjective)

;show the confront telisha objective
kmyQuest.SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_157
Function Fragment_157()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;Startup Stage
;used to conditionalize dialogue for calder in _arcDialogueQuest
;so calder will offer you the quest as needed

;rename the ring to calder's ring
kmyQuest.SetRingOwner(Alias_Calder.GetReference())

;set the dates in tyra's journal
kmyQuest.SetTyraJournalDates()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
;the player is now inside of the tavern
;this is set by the Stage20 state in _arcQuest001PlayerAliasScript

;move calder into the winking skeever
(Alias_Calder.GetReference() as _arcCalderScript).MoveToWithDog()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_96
Function Fragment_96()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player did not reconsider calder's offer in time
;RingGiver 0 is implied, as it was not changed by anything else.

;set the ring status to taken
ArcadiaRing.GoToState("Taken")

;set the lockbox state to inactive
TelishaLockbox.GoToState("Inactive")

;set calder to the stage 70 state, so he disables when he reaches the cave
Calder.GoToState("Stage70")

;stop calder's trespass quest
_arcCalderTrespassQuest.Stop()

;evaluate calder's package so he leaves immediately
(Alias_Calder.GetReference() as Actor).EvaluatePackage()

;give telisha her key, in case the player wants to pickpocket her instead of picking the lock
Alias_Telisha.GetReference().AddItem(_arcTelishaLockboxKey, 1, True)

;make it so the lockbox can now be unlocked
Alias_TelishaLockbox.GetReference().SetLockLevel(75)

;give the ring to tyra
kmyQuest.SetRingContainer(Alias_TyraContainer.GetReference())

;set the ring taken date and time for telisha's journal
_arcTelishaJournalDate02.SetValue(GameDaysPassed.GetValue())

;fail the current objective
SetObjectiveFailed(kmyQuest.CurrentObjective)

;set the speak to calder objective
kmyQuest.SetObjectiveDisplayed(50)

;send out letter
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_73
Function Fragment_73()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player believed telisha
;this is set at the end of _arcQuest001TelishaRingBranchBelieveYes

;set telisha to the be the ring's owner
kmyQuest.SetRingOwner(Alias_Telisha.GetReference())

;the stage stage to 60, confront calder
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_134
Function Fragment_134()
;BEGIN CODE
;the player chose for eivind to follow to smugglers den

;set up eivind to follow player
Eivind.SetFollow(True)

;wait, so that the game will not run
;eivind's dialogue topic for not going to smuggler's den (_arcQuest002EivindFollowTopic)
;as a goodbye to the current conversation topic
Utility.Wait(3.0)

;set the stage to complete objectives
SetStage(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_95
Function Fragment_95()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player accepted calder's offer, but the timer ran out, as the
;player did not obtain the ring in time
;RingGiver is set to 1 by the Stage20 state in _arcQuest001Script
;once the player opens the lockbox, the stage will be set to 90

;Set the player state to inactive
Player.GoToState("Inactive")

;set the ring state as taken
ArcadiaRing.GoToState("Taken")

;set the lockbox state to ring missing, this will set the stage to 90
;if the player opens the lockbox
TelishaLockbox.GoToState("RingMissing")

;give the ring to tyra
kmyQuest.SetRingContainer(Alias_TyraContainer.GetReference())

;set the ring taken date and time for telisha's journal
_arcTelishaJournalDate02.SetValue(GameDaysPassed.GetValue())

;send out letter
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_147
Function Fragment_147()
;BEGIN CODE
;telisha didn't make it into the cave in time
;force move telisha into cave and disable her
;blank log entry so either one of the other two will show up

;get telisha ref
Actor TelishaRef = Alias_Telisha.GetReference() as Actor

;evaluate telisha's package so she knows where to go
TelishaRef.EvaluatePackage()

;move telisha to her package location
TelishaRef.MoveToPackageLocation()

;disable telisha
TelishaRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_129
Function Fragment_129()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player did not show evind telisha's letter or walked away
;from eivind's force greet
;set at the end of _arcQuest001EivindTelishaMissingLetterNo
;the player does not have the letter

;evaluate eivind's package so he searches for telisha immediately
(Alias_Eivind.GetReference() as Actor).EvaluatePackage()

;remove current objective
kmyQuest.SetObjectiveDisplayed(kmyQuest.CurrentObjective, False)

;show objective to help eivind search the perimeter of dragon bridge
kmyQuest.SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_93
Function Fragment_93()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player has obtained the ring from telisha
;RingGiver is set to 3 at the end of _arcBrawlQuestBranchStart
;set in stage 60 of _arcBrawlQuest

;disable some controls
Game.DisablePlayerControls(abMovement = False, abFighting = False, abActivate = False)

;stop the tavern scene quest (should be fine as it will set it to stage 40)
_arcTavernSceneQuest.Stop()

;set the quest script into the inactive state, this automatically cancels updates
;on game time once the previous state was ended
kmyQuest.GoToState("Inactive")

;rename the ring to eivind's ring, as telisha just told you that eivind
;gave it to her (keep instance data from here on)
kmyQuest.SetRingOwner(Alias_Eivind.GetReference())

;set the ring state as taken
ArcadiaRing.GoToState("Taken")

;manually give the ring to the player
kmyQuest.SetRingContainer(PlayerRef)

;move calder into the northern cave
(Alias_Calder.GetReference() as _arcCalderScript).MoveToWithDog()

;complete the current objective
SetObjectiveCompleted(kmyQuest.CurrentObjective)

;show the return ring to calder objective
kmyQuest.SetObjectiveDisplayed(30)

;start playing the ring fx
PlayerRef.AddSpell(_arcArcadiaRingSpell, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_143
Function Fragment_143()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;this fragment runs if you brawl calder and he gives you the ring

;fail the current objective
SetObjectiveFailed(kmyQuest.CurrentObjective)

;show the meet with telisha objective
kmyQuest.SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_101
Function Fragment_101()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;only listen for on item added events for telisha's letter
Player.AddInventoryEventFilter(Alias_TelishaLetter.GetReference())

;set the player alias to the correct state
Player.GoToState("Stage110")

;set telisha's letter to the correct state
TelishaLetter.GoToState("Sent")

;send out letter
WICourier.AddItemToContainer(Alias_TelishaLetter.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_131
Function Fragment_131()
;BEGIN CODE
;the player chose for eivind not to follow to smugglers den

;set up eivind not to follow player
Eivind.SetFollow(False)

;wait, so that the game will not run
;eivind's dialogue topic for not going to smuggler's den (_arcQuest002EivindFollowTopic)
;as a goodbye to the current conversation topic
Utility.Wait(3.0)

;set the stage to complete objectives
SetStage(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player accepted calder's offer.
;this is set at the end of _arcDialogueQuestCalderDragonBridgeBranchYes

;set the player alias state to Stage20 so we know when the tavern is entered
Player.GoToState("Stage20")

;set the quest script into the correct state, so we know when the timer is up
kmyQuest.GoToState("Stage20")

;start a timer for two in game days
kmyQuest.StartCalderOfferTimer(48.0)

;make sure calder starts travelling to the winking skeever
(Alias_Calder.GetReference() as Actor).EvaluatePackage()

;give telisha her key, in case the player wants to pickpocket her instead of picking the lock
Alias_Telisha.GetReference().AddItem(_arcTelishaLockboxKey, 1, True)

;make it so the lockbox can now be unlocked
Alias_TelishaLockbox.GetReference().SetLockLevel(75)

;complete the current objective, this will silently fail if there wasn't one
SetObjectiveCompleted(kmyQuest.CurrentObjective)

;show the objective to enter the tavern
kmyQuest.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_94
Function Fragment_94()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player has obtained the ring from the lockbox
;RingGiver is set to 2 in _arcQuest001TelishaLockboxAliasScript

;disable some controls
Game.DisablePlayerControls(abMovement = False, abFighting = False, abActivate = False)

;stop the tavern scene quest (should be fine as it will set it to stage 40)
_arcTavernSceneQuest.Stop()

;set the quest script into the inactive state, this automatically cancels updates
;on game time once the previous state was ended
kmyQuest.GoToState("Inactive")

;rename the ring back to calder's ring if it was named telisha's ring, as it is implied
;you didn't believe her, and took it anyway  (keep instance data from here on)
kmyQuest.SetRingOwner(Alias_Calder.GetReference())

;move calder into the northern cave
(Alias_Calder.GetReference() as _arcCalderScript).MoveToWithDog()

;complete the search tavern objective if needed
If kmyQuest.CurrentObjective == 10
    SetObjectiveCompleted(kmyQuest.CurrentObjective)
EndIf

;silently complete the confront calder objective if needed
If kmyQuest.CurrentObjective == 20
    kmyQuest.SetObjectiveDisplayed(kmyQuest.CurrentObjective, False)
    SetObjectiveCompleted(kmyQuest.CurrentObjective)
EndIf

;show objective to return ring to calder
 kmyQuest.SetObjectiveDisplayed(30)

;start playing the ring fx
PlayerRef.AddSpell(_arcArcadiaRingSpell, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player must now go and confront calder
;this is set at the end of _arcQuest001TelishaRingBranchBelieveYes
;as the player believed telisha

;complete the current objective
SetObjectiveCompleted(kmyQuest.CurrentObjective)

;set objective to confront calder
kmyQuest.SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_132
Function Fragment_132()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player showed eivind telisha's letter
;set at the end of _arcQuest001EivindTelishaMissingLetterYes

;if the current objective is to show eivind telisha's letter
If kmyQuest.CurrentObjective == 130
    ;complete it
    SetObjectiveCompleted(130)
Else
    ;otherwise, remove it
    kmyQuest.SetObjectiveDisplayed(kmyQuest.CurrentObjective, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_119
Function Fragment_119()
;BEGIN CODE
;this fragment always runs, it is now time to send out telisha's letter
;telisha may be on-screen, so have her run to the northern cave

;set _arcQuest001PlayerAliasScript to the stage100 state
Player.GoToState("Stage100")

;set _arcQuestTelishaAliasScript to the DisableWhenAble state
;so she will move to the northern cave as soon as she is not loaded
Telisha.GoToState("Missing")

;always stop the tavern scene quest
_arcTavernSceneQuest.Stop()

;have telisha travel to the northern cave
(Alias_Telisha.GetReference() as Actor).EvaluatePackage()

;evaluate eivind's package so he goes to tavern immediately
(Alias_Eivind.GetReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_151
Function Fragment_151()
;BEGIN CODE
;the player chose not to brawl calder
;this stage is set at the end of _arcQuest001CalderConfrontBranchTalk
;it adds a perk to the player so that they can steal telisha's necklace off of her
;it also conditionalizes the perk so it will only be active if this stage is done

;give the player the ability to steal telisha's amulet via a perk
PlayerRef.AddPerk(_arcTelishaAmuletPerk)

;set stage to 90, so telisha runs to smuggler's den
SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_169
Function Fragment_169()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;eivind has force greeted us about looking for telisha

;display the show eivind letter objective (130)
kmyQuest.SetObjectiveDisplayed(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_168
Function Fragment_168()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;eivind has not force greeted us about looking for telisha

;show talk to telisha about her letter objective (120)
kmyQuest.SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_117
Function Fragment_117()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player opened the lockbox, but it was empty, because the timer ran out

;fail the search the tavern objective (10) if it shown
If IsObjectiveDisplayed(10)
    SetObjectiveFailed(10)
Else
    ;otherwise, remove the current objective
    ;which could potentially be talk to calder (50)
    ;or help eivind search the perimeter (100)
    SetObjectiveDisplayed(kmyQuest.CurrentObjective, False)
EndIf

;show the speak to calder about missing ring objective
kmyQuest.SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_158
Function Fragment_158()
;BEGIN CODE
;this stage is set in two of the three fragments in stage 180 of this quest
;completes and stops this quest
;shutdown stage

;start the next quest
_arcQuest002.Start()

;stop the quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player declined calder's offer
;this is set at the end of _arcDialogueQuestCalderDragonBridgeBranchNo

;show objective for player to meet calder to reconsider
kmyQuest.SetObjectiveDisplayed(0)

;set the quest script into the correct state
kmyQuest.GoToState("Stage10")

;start a timer for an in game day
kmyQuest.StartCalderOfferTimer(24.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_165
Function Fragment_165()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player has read telisha's letter

;evaluate eivind's ai package
(Alias_Eivind.GetReference() as Actor).EvaluatePackage()

;set the player alias to the Stage130 state
Player.GoToState("Stage130")

;complete the read telisha's letter objective (110)
SetObjectiveCompleted(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_140
Function Fragment_140()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;set by stage 160 and 170
;prep quest for completion

;set the bandit journal date for _arcquest002
_arcSDBanditJournalDate.SetValue(GameDaysPassed.GetValue() - 2.0)

;remove the current objective
kmyQuest.SetObjectiveDisplayed(kmyQuest.CurrentObjective, False)

;complete / stop the quest
SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_127
Function Fragment_127()
;BEGIN CODE
;the player started brawling calder
;this conditionalizes his dialogue in _arcDialogueQuest as well as in
;this one _arcQuest001
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_162
Function Fragment_162()
;BEGIN CODE
;always set stage to 100
;this preps the player to receive telisha's letter

;set stage to 100
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_97
Function Fragment_97()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;this stage only runs if we confronted calder
;it is set at the end of _arcQuest001CalderConfrontBranchTalk
;the player never got the ring, so RingGiver must equal 0
;also the player overall lost against her at coin toss
;it is implied that the player confronted calder
;the player won the brawl

;complete the current objective
SetObjectiveCompleted(kmyQuest.CurrentObjective)

;show the confront telisha objective
kmyQuest.SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_139
Function Fragment_139()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player did not show evind telisha's letter or walked away
;from eivind's force greet
;set at the end of _arcQuest001EivindTelishaMissingLetterNo
;the player does have the letter

;evaluate eivind's package so he searches for telisha immediately
(Alias_Eivind.GetReference() as Actor).EvaluatePackage()

;remove current objective
kmyQuest.SetObjectiveDisplayed(kmyQuest.CurrentObjective, False)

;set the objective to show eivind telisha's letter
kmyQuest.SetObjectiveDisplayed(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_144
Function Fragment_144()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;this stage only runs if we confronted calder
;it is set at the end of _arcQuest001CalderConfrontBranchTalk
;the player never got the ring, so RingGiver must equal 0
;it is implied that the player confronted calder
;the player lost the brawl with calder
;or did not brawl with him at all

;give the ring to tyra
kmyQuest.SetRingContainer(Alias_TyraContainer.GetReference())

;fail the current objective
SetObjectiveFailed(kmyQuest.CurrentObjective)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_92
Function Fragment_92()
;BEGIN AUTOCAST TYPE _arcQuest001Script
Quest __temp = self as Quest
_arcQuest001Script kmyQuest = __temp as _arcQuest001Script
;END AUTOCAST
;BEGIN CODE
;the player has obtained the ring from calder
;RingGiver is set to 4 at the end of _arcBrawlQuestBranchStart
;set in stage 60 of _arcBrawlQuest

;disable some controls
Game.DisablePlayerControls(abMovement = False, abFighting = False, abActivate = False)

;set the quest script into the inactive state, this automatically cancels updates
;on game time once the previous state was ended
kmyQuest.GoToState("Inactive")

;set the ring state as taken
ArcadiaRing.GoToState("Taken")

;manually give the ring to the player
kmyQuest.SetRingContainer(PlayerRef)

;evaluate calder's package so he runs to the northern cave immediately
(Alias_Calder.GetReference() as Actor).EvaluatePackage()

;complete the current objective
SetObjectiveCompleted(kmyQuest.CurrentObjective)

;show the return ring to telisha objective
kmyQuest.SetObjectiveDisplayed(60)

;start playing the ring fx
PlayerRef.AddSpell(_arcArcadiaRingSpell, False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Form Property _arcTelishaLockboxKey Auto

_arcQuest001PlayerAliasScript Property Player Auto

Quest Property _arcFlashbackQuest001  Auto   

Actor Property PlayerRef  Auto   

_arcQuest001RingAliasScript Property ArcadiaRing Auto

_arcQuest001CalderAliasScript Property Calder Auto

_arcQuest001TelishaLockboxAliasScript Property TelishaLockbox Auto

_arcQuest001TelishaLetterAliasScript Property TelishaLetter Auto

WICourierScript Property WICourier  Auto  

Quest Property _arcQuest002  Auto   

GlobalVariable Property GameDaysPassed  Auto  

GlobalVariable Property _arcTelishaJournalDate02  Auto  

GlobalVariable Property _arcTelishaJournalDate03  Auto  

GlobalVariable Property _arcSDBanditJournalDate  Auto  

_arcQuestActorFollowerAliasScript Property Eivind Auto

SPELL Property _arcArcadiaRingSpell  Auto  

Quest Property _arcTavernSceneQuest  Auto  

Perk Property _arcTelishaAmuletPerk  Auto   

_arcQuestTelishaAliasScript Property Telisha Auto

Quest Property _arcCalderTrespassQuest  Auto  

Perk Property _arcQuest001LockpickPerk  Auto  
