;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 88
Scriptname _arc_QF__arcQuest003_05DBD3F8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY LumberCampWindowInt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LumberCampWindowInt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArcadiaRing
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArcadiaRing Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OdeliaExternalMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OdeliaExternalMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eivind
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eivind Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BasementObjectiveMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BasementObjectiveMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FBQ001MusicTrig
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FBQ001MusicTrig Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OdeliaBanditBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OdeliaBanditBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Telisha
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Telisha Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LumberCampEivindBasementMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LumberCampEivindBasementMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OdeliaMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OdeliaMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorVoice
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorVoice Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LumberCampDoorInt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LumberCampDoorInt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorAgent01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorEmbassyFrontGate
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorEmbassyFrontGate Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OdeliaBanditBossJournalMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OdeliaBanditBossJournalMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorEmbassyFrontGateMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorEmbassyFrontGateMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LumberCampDoorExt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LumberCampDoorExt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MODQuestTrigger01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MODQuestTrigger01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorAgent02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorAgent02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MODQuestAct04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MODQuestAct04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FollowerKnockOutMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FollowerKnockOutMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SawMill
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SawMill Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArcadiaLetterTranscription
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArcadiaLetterTranscription Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LumberCampExtMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LumberCampExtMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OdeliaExtTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OdeliaExtTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CalderSchedule
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CalderSchedule Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OESQuestTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OESQuestTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FBQ001DragonMound
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FBQ001DragonMound Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OdeliaDoorExt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OdeliaDoorExt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArcadiaLetter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArcadiaLetter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OdeliaEntryPedestal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OdeliaEntryPedestal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TavernMeetMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TavernMeetMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OdeliaBanditBossJournal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OdeliaBanditBossJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CalderCampfireMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CalderCampfireMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorEmbassyTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorEmbassyTrigger Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
;if the thalmor embassy scene quest played out
;we can check this by checking the max stage reached for
;_arcThalmorEmbassySceneQuest, if we got past 10
;the scene must have played out

;set the stage in the entry scene quest now that we are ready
;this stage will go straight into the knockout scene, skipping any other
;entry scenes
_arcOdeliaEntrySceneQuest.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;eivind is ready to ask the player what to do
;this stage is set at the end of phase 2 of _arcLumberCampSceneQuestKnockScene
;eivind's forcegreet should now be active

;evaluate eivind's package so he force greets
(Alias_Eivind.GetReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;the player left the lumber camp
;this stage is set by the stage60 state in the player alias script
;no choice was made

;start playing _arcLumberCampSceneQuestSneak02Scene
_arcLumberCampSceneQuestSneak02Scene.ForceStart()

;remove music failsafe
_arcMUSLumberCampScene.Remove()

;complete the speak to eivind objective
SetObjectiveCompleted(10)

;display the escape the thalmor objective
kmyQuest.SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;the player has entered the lumbercamp
;this stage is set in the Stage0 state of the player alias script

;start the _arcLumberCampSceneQuestStart02Scene
_arcLumberCampSceneQuestStart02Scene.ForceStart()

;add silent music track
_arcMUSSilenceLumberCampScene.Add()

;complete objective to follow eivind to lumber camp
SetObjectiveCompleted(0)

;set objective to speak to eivind
kmyQuest.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
;the player has picked an option after eivind's force greet
;the player has chosen to split-up or
;the player has chosen to walk away
;this stage is set at the end of _arcQuest003EivindLeaveLumberCampSplitUp
;and _arcQuest003EivindLeaveLumberCampWalkAway

;stop eivind from following
Eivind.SetFollow(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;the player left the lumber camp
;this stage is set by the stage60 state in the player alias script
;negotiate option chosen
;the thalmor did not enter the lumber camp

;hide the negotiate with the thalmor objective
SetObjectiveDisplayed(20, False)

;display the escape the thalmor objective
kmyQuest.SetObjectiveDisplayed(30)

;force start sneak scene 2
_arcLumberCampSceneQuestSneak02Scene.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
;this fragment runs if the player has engaged in combat with the thalmor
;before leaving the lumber camp

;move agents to the front door if they are not dead
Actor ThalmorAgent02Ref = Alias_ThalmorAgent01.GetReference() as Actor
ObjectReference LumberCampExtMarkerRef = Alias_LumberCampExtMarker.GetReference()

 ThalmorAgent01.TryMoveTo(LumberCampExtMarkerRef)

If !ThalmorAgent02Ref.IsDead()
    ThalmorAgent02.TryMoveTo(LumberCampExtMarkerRef)
EndIf

;move eivind to the player
Eivind.TryMoveTo(PlayerRef)

;set stage to 60 in _arcLumberCampSceneQuest
;this conditionalizes phase 1 of _arcLumberCampSceneQuestFight02Scene to finish early
_arcLumberCampSceneQuest.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
;this stage is to conditionalize stage 120
;it is set by stage 130, as long as the player was still in the lumber camp
;so that phase 1 of _arcLumberCampSceneQuestFight02Scene
;will end when the player leaves to lumber camp
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_63
Function Fragment_63()
;BEGIN CODE
;skull pedestal has been activated

;set stage in _arcOdeliaEntrySceneQuest to start scene 3
;where the thalmor attack
_arcOdeliaEntrySceneQuest.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;the thalmor have been rendered inert
;this stage is set in stage 10 or _arcLumberCampFleeQuest
;once both agents have left dragon bridge or have been killed
;stop combat with both thalmor agents
;thalmor agent 2 may have been deleted, so check that they exist

(Alias_ThalmorAgent01.GetReference() as Actor).StopCombatAlarm()

;evaluate eivind's package so he will force greet
(Alias_Eivind.GetReference() as Actor).EvaluatePackage()

;stop _arcLumberCampSceneQuest
_arcLumberCampSceneQuest.Stop()

;set the thalmor back to being enemies
kmyQuest.SetThalmorEnemy(True)

;start eivind's navigation quest, this is early, but we want to be sure it has started
;before _arcEivindNavigateQuestScene runs.
_arcEivindNavigateQuest.Start()

;complete whatever the current objective may be
SetObjectiveCompleted(kmyQuest.CurrentObjective)

;complete the fight the thalmor objective
;if it is displayed
If IsObjectiveDisplayed(40)
    SetObjectiveCompleted(40)
EndIf

;set objective to talk to eivind
kmyQuest.SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;start-up stage

;set the player alias to the correct state
Player.GoToState("Stage0")

;set the external lumber camp door to the correct state
;so the it will block followers from entering
LumberCampDoorExt.GoToState("Active")

;start the lumbercamp scene quest
;this automatically starts _arcLumberCampSceneQuestStart01Scene
_arcLumberCampSceneQuest.Start()

;set the follow eivind to lumber camp objective to be displayed
kmyQuest.SetObjectiveDisplayed(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;eivind force greet complete
;this stage is set at the end of _arcQuest003EivindLeaveLumberCampBranchStart

;give eivind his transcription of arcadia's letter on clean paper
;get letter reference
ObjectReference ArcadiaLetterTranscriptionRef = (Alias_ArcadiaLetterTranscription.GetReference())

;enable letter
ArcadiaLetterTranscriptionRef.EnableNoWait()

;give eivind letter
(Alias_Eivind.GetReference()).AddItem(ArcadiaLetterTranscriptionRef, abSilent = True)

;set eivind so that he cannot enter the tavern
Eivind.GoToState("Stage160")

;complete whatever the current objective may be
SetObjectiveCompleted(kmyQuest.CurrentObjective)

;set new objective to travel to odelia or confront the thalmor
kmyQuest.SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_85
Function Fragment_85()
;BEGIN CODE
;if thalmor agent 2 is not in the lumber camp
;remove them from the cell owner faction
;otherwise, if they are, it is removed when they leave
;via their alias script

(Alias_ThalmorAgent02.GetReference() as Actor).RemoveFromFaction(DragonBridgeHorgeirHouse)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;the player has chosen to negotiate

;start the negotiate scene
_arcLumberCampSceneQuestNegotiate01Scene.Start()

;remove music
_arcMUSLumberCampScene.Remove()

;complete objective to speak to eivind
SetObjectiveCompleted(10)

;set objective to negotiate with the thalmor
kmyQuest.SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
;the player is still in the lumber camp

;set the stage to 135 to conditionalize stage 120
;so that phase 1 of _arcLumberCampSceneQuestFight02Scene
;will end when the player leaves to lumber camp
SetStage(135)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;eivind has reached his destination in the basement of the lumber camp
;this stage is set at the end of phase 3 of  _arcLumberCampSceneQuestIntScene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_77
Function Fragment_77()
;BEGIN CODE
;this stage is set in the ReadLetter state in _arcquest003Script attached
;to this quest, this state was triggered by stage 30 in this quest
;give the letter to the player so that they can read it

;get letter reference
ObjectReference ArcadiaLetterRef = Alias_ArcadiaLetter.GetReference()

;set the letter's owner now to be the player
ArcadiaLetterRef.SetActorOwner(PlayerRef.GetBaseObject() as ActorBase)

;give player the letter
PlayerRef.AddItem(ArcadiaLetterRef)

;enable the letter
ArcadiaLetterRef.EnableNoWait()

;read the letter
ArcadiaLetterRef.Activate(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN CODE
;the player has picked an option after eivind's force greet
;the player has chosen to travel with eivind
;this stage is set at the end of _arcQuest003EivindLeaveLumberCampTravel

;set eivind as a follower
Eivind.SetFollow(True)

;have eivind start navigating
_arcEivindNavigateQuestScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;the player left the lumber camp
;this stage is set by the stage60 state in the player alias script
;negotiate option chosen
;the thalmor entered the lumber camp
;the thalmor have not exited the lumber camp
;the thalmor did not engage with the player

ObjectReference LumberCampExtMarkerRef =  Alias_LumberCampExtMarker.GetReference()
Actor ThalmorAgent02Ref = Alias_ThalmorAgent02.GetReference() as Actor

 ThalmorAgent01.TryMoveTo(LumberCampExtMarkerRef)

If !ThalmorAgent02Ref.IsDead()
    ThalmorAgent02.TryMoveTo(LumberCampExtMarkerRef)
EndIf

;move eivind to the player
Eivind.TryMoveTo(PlayerRef)

;force start combat
(Alias_ThalmorAgent01.GetReference() as Actor).StartCombat(PlayerRef)
(Alias_ThalmorAgent02.GetReference() as Actor).StartCombat(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_64
Function Fragment_64()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;the thalmor have entered odelia to capture the player
;this stage is set at the end of phase x of _arcOdeliaEntrySceneQuestScene03

;complete current objective
SetObjectiveCompleted(60)

;display new objective
kmyQuest.SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
;player entered trigger outside odelia
;this stage is set by the OESQuestTrigger alias on this quest

;stop eivind's navigation quest
;this implicitly stops _arcEivindNavigateQuestScene to allow
;to start eivind's external entry scene
_arcEivindNavigateQuest.Stop()

;start odelia entry scene quest
;this implicitly starts eivind's external entry scene
_arcOdeliaEntrySceneQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
;thalmor agent 2 is alive

;stop combat
(Alias_ThalmorAgent02.GetReference() as Actor).StopCombatAlarm()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_70
Function Fragment_70()
;BEGIN CODE
;the player has been knocked out and the screen is blank

;set up the messenger of death quest
;simulate entering the first trigger (_arcMessengerOfDeathAct01Ref)
Alias_MODQuestTrigger01.GetReference().OnTriggerEnter(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;the player has chosen to fight

;start the fight scene
_arcLumberCampSceneQuestFight01Scene.Start()

;complete objective to speak to eivind
SetObjectiveCompleted(10)

;set objective to negotiate with the thalmor
kmyQuest.SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_71
Function Fragment_71()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;the player has gotten up and the thalmor have left
;this stage is set at the end of _arcOdeliaEntrySceneQuest

OdeliaDoorExt.GoToState("Inactive")

;if the current objective is 60 (Travel to Odelia or Confront the Thalmor)
;we should complete it, as we never entered combat with the thalmor
;this can happen if either the timer ran out and we were shot or
;if the thalmor embassy scene played out
If IsObjectiveDisplayed(60)
    SetObjectiveCompleted(60)
EndIf

_arcQuest004.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;eivind has finished talking
;this stage is set at the end of _arcQuest003EivindLoreBranch03Start
;the thalmor are knocking

;set the player to the correct state so we know when we
;have left the lumber camp
Player.GoToState("Stage60")

;set thalmor agents to be ready for combat
ThalmorAgent01.GoToState("Stage60")
ThalmorAgent02.GoToState("Stage60")

;set the voice marker into the active state
ThalmorVoice.GoToState("Active")

;disable the sawmill
SawMill.GoToState("Disabled")

;set the thalmor embassy trigger to active
;this will cause eivind's package to be evaluated as needed for _arcEivindNavigateQuest
;it will also cause _arcThalmorEmbassySceneQuest to start as needed
ThalmorEmbassyTrigger.GoToState("Active")

;set the odelia external trigger to active
;this sets the stage to 190, once the player or eivind are near odelia
;conditionalizing eivind's packages
OdeliaExtTrigger.GoToState("Active")

;set the odelia entry quest scene trigger to active
;this sets the stage to 200. So eivind will prompt the player before entering odelia
OESQuestTrigger.GoToState("Active")

;set the odelia entry external door to the active state
OdeliaDoorExt.GoToState("Active")

;unlock the odelia external entry door
Alias_OdeliaDoorExt.GetReference().Lock(False)

;always make sure the embassy front gate is closed
;the state of the gate will be dealt with in the alias script
;for it in _arcThalmoreEmbassySceneQuest when the player enters the trigger
;for that quest
Alias_ThalmorEmbassyFrontGate.GetReference().SetOpen(False)

;stop clinton's campfire quest, this will let him flee
_arcClintonCampfireQuest.Stop()

;move thalmor agent 1 into position
ThalmorAgent01.TryMoveTo(Alias_LumberCampExtMarker.GetReference())

;enable thalmor agent 2
Alias_ThalmorAgent02.GetReference().Enable()

;set the stage in _arcLumberCampSceneQuest to set aggression values for actors
_arcLumberCampSceneQuest.SetStage(5)

;start the eivind knock scene
_arcLumberCampSceneQuestKnockEivindScene.Start()

;play music
_arcMUSLumberCampScene.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;the player has read arcadia's letter
;this stage is set in the NoteRead state of the ArcadiaLetter alias script

;evaluate eivind's package so he force greets
(Alias_Eivind.GetReference() as Actor).EvaluatePackage()

;make odelia discoverable
;enabling the map marker will also remove the collision plane in front of
;odelia's external entry door via the map marker being an enable parent
Alias_OdeliaMapMarker.GetReference().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
;the player has activated odelia's front external door
;this stage is set by the OdeliaDoorExt alias on this quest
;this stage will only run if the player made thier way to odelia
;the follower manager quest would have started from
;_arcThalmorEmbassyScene quest otherwise

;get all follower references for the next part of the quest
_arcFollowerManagerQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;the player has chosen to sneak away

;start the sneak scene
_arcLumberCampSceneQuestSneak01Scene.Start()

;remove music
_arcMUSLumberCampScene.Remove()

;complete objective to speak to eivind
SetObjectiveCompleted(10)

;set objective to escape the thalmor
kmyQuest.SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_84
Function Fragment_84()
;BEGIN CODE
;if thalmor agent 1 is not in the lumber camp
;remove them from the cell owner faction
;otherwise, if they are, it is removed when they leave
;via their alias script

(Alias_ThalmorAgent01.GetReference() as Actor).RemoveFromFaction(DragonBridgeHorgeirHouse)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;the player has left the lumber camp
;this stage is set by the stage60 state in the player alias script
;fight option was chosen

;force start sneak scene 2
_arcLumberCampSceneQuestSneak02Scene.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;eivind's choice forcegreet is complete
;this stage is set at the end of _arcQuest003EivindChoiceBranchStart
;the player can freely leave, or talk to eivind again
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;the player has left the lumber camp
;this stage is set by the stage60 state in the player alias script
;sneak option chosen

;force start sneak scene 2
_arcLumberCampSceneQuestSneak02Scene.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
;eivind or the player are close to odelia
;this stage is set by the OdeliaExtTrigger alias on this quest
;once the player or eivind enter the trigger
;it condionalizes eivind's package to escort the player to the top
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_61
Function Fragment_61()
;BEGIN CODE
;if the thalmor embassy scene quest didn't play out
;we can check this by checking the max stage reached for
;_arcThalmorEmbassySceneQuest, if we never got past 10
;the scene never played out, the player just left the trigger

;set the pedestal at the other end of the hall to the active state
;this way it will set the next stage when activated
OdeliaEntryPedestal.GoToState("Active")

;set stage 10 in _arcOdeliaEntrySceneQuest
;this will start the first scene where the player looks around and
;applies an imod
_arcOdeliaEntrySceneQuest.SetStage(10)

;move followers and commanded actors inside
;get destination reference
ObjectReference FollowerKnockOutMarkerRef = Alias_FollowerKnockOutMarker.GetReference()

;move followers / commanded actors inside manually using follower manager quest
_arcFollowerManagerQuest.Start()
_arcFollowerManagerQuest.MoveFollowers(FollowerKnockOutMarkerRef)
_arcFollowerManagerQuest.MoveCommanded(FollowerKnockOutMarkerRef)
_arcFollowerManagerQuest.Stop()

;give the journal to the odelia entry bandit boss
;because he is not dead
Alias_OdeliaBanditBoss.GetReference().AddItem(Alias_OdeliaBanditBossJournal.GetReference(), abSilent = True)

;set the stage in the entry scene quest now that we are ready
;this stage will play out entry scene 2, which happens of the player never
;went to the thalmor embassy
_arcOdeliaEntrySceneQuest.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;the player left the lumber camp
;this stage is set by the stage60 state in the player alias script
;this fragment always runs when the player leaves the lumber camp

;fade in the game to hide any movement of actors
Game.FadeOutGame(False, True, 3.0, 1.0)

;the lumber camp flee quest is intentionally started after each scene starts
;in each fragment for this stage

;set the player to the Stage120 state, so we know when they enter odelia
Player.GoToState("Stage120")

;get eivind reference
Actor EivindRef = Alias_Eivind.GetReference() as Actor

;enable eivind either way
EivindRef.Enable()

;add eivind as a follower
Eivind.SetFollow(True)

;always move followers / commanded actors to the player
_arcFollowerManagerQuest.Start()
_arcFollowerManagerQuest.MoveFollowers(PlayerRef)
_arcFollowerManagerQuest.MoveCommanded(PlayerRef)
_arcFollowerManagerQuest.Stop()

;set the external lumber camp door to the correct state
;so it no longer blocks followers
LumberCampDoorExt.GoToState("Inactive")

;always stop the thalmor door knock marker
ThalmorVoice.GoToState("Inactive")

;enable the sawmill
SawMill.GoToState("Enabled")

;run lumber camp flee quest
_arcLumberCampFleeQuest.Start()

;remove music failsafe
_arcMUSLumberCampScene.Remove()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;eivind's second force greet is complete
;this stage is set at the end of _arcQuest003EivindLoreBranch02Start

;set the ring owner to nobody
;this makes it use it's default name
;Mysterious Ring
kmyQuest.SetRingOwner(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;the player has ceased combat with the thalmor
;or they have managed to sneak off
;this stage is set at the end of _arcLumberCampSceneQuestFight02Scene
;or at the end of phase 23 of _arcLumberCampSceneQuestNegotiate02Scene
;or at the end of  phase 8 of _arcLumberCampSceneQuestSneak02Scene
;the thalmor will now return to base

kmyQuest.SetThalmorEnemy(False)

;stop combat and return to base
Actor ThalmorAgent01Ref = Alias_ThalmorAgent01.GetReference() as Actor
ThalmorAgent01Ref.StopCombat()
ThalmorAgent01Ref.StopCombatAlarm()
ThalmorAgent01Ref.EvaluatePackage()

;remove silent music track
_arcMUSSilenceLumberCampScene.Remove()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_72
Function Fragment_72()
;BEGIN CODE
;disable calder's schedule if it still exists
;and is within 512 units of the campfire enable marker
;this implies he would have seen it and burned it

Alias_CalderSchedule.GetReference().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_56
Function Fragment_56()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;the player has entered odelia
;this stage is set by the OnLocationChange() event in the player alias
;on this quest

;in theory, the player should be able to skip stages 130-200
;it tries to account for the state of everything up until this point

;always lock the front door, it must be done here, so followers can come in
;it also causes problems with any scripts attached to the door otherwise
Alias_OdeliaDoorExt.GetReference().Lock(True)

;stop all unneeded quests
;_arcSceneActorQuest is stopped by _arcThalmorEmbassySceneQuest
;when it ends
_arcLumberCampSceneQuest.Stop()
_arcLumberCampFleeQuest.Stop()
_arcThalmorEmbassySceneQuest.Stop()
_arcEivindNavigateQuest.Stop()

;manually set all triggers to be inactive
ThalmorEmbassyTrigger.GoToState("Inactive")
OdeliaExtTrigger.GoToState("Inactive")
OESQuestTrigger.GoToState("Inactive")

;set the thalmor agents to be inactive
ThalmorAgent01.GoToState("Inactive")
ThalmorAgent02.GoToState("Inactive")

;stop eivind from following the player
Eivind.SetFollow(False)

;set odelia bandit boss journal dates
kmyQuest.SetOdeliaBanditJournalDates()

;enable bandit boss journal
Alias_OdeliaBanditBossJournal.GetReference().EnableNoWait()

;set up calder's campsite now that he has left
;this will disable the _arcClintonCampfireQuest trigger via enable parent
ObjectReference CampfireMarkerRef = Alias_CalderCampfireMarker.GetReference()
CampfireMarkerRef.DisableNoWait()

;we then disable the campfire, and it's light / flames / smoke via a linked ref chain
;as these cannot be disabled via parent as they are controlled by the campfire actvator
ObjectReference CampfireActRef = CampfireMarkerRef.GetLinkedRef()
CampfireActRef.DisableNoWait()
CampfireActRef.GetLinkedRef().DisableNoWait()

;enable the forth messenger of death activation marker
;now that the player is locked inside odelia
Alias_MODQuestAct04.GetReference().EnableNoWait()

;always deactivate / disable the dragon mound and music trigger from
;_arcFlashbackQuest001, regardless of whether it played out or not
(Alias_FBQ001DragonMound.GetReference() as _arcFBQ001DragonMoundRefScript).Deactivate()
Alias_FBQ001MusicTrig.GetReference().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;eivind's inital forcegreet is complete
;this stage is set at the end of _arcQuest003EivindLoreBranch01Start

;this will return from the topic info fragment that triggered this stage
;and set up the letter to be read after a very short delay
;this is needed to return controls to the player before reading the letter
;so that they can turn the pages freely, without the controls glitching out
kmyQuest.GoToState("ReadLetter")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;the player left the lumber camp
;this stage is set by the stage60 state in the player alias script
;negotiate option chosen
;the thalmor entered the lumber camp
;the thalmor have exited the lumber camp

;set the stage to 140, so the thalmor retreat
;according to thier alias package conditions in _arcLumberCampFleeQuest
SetStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE _arcQuest003Script
Quest __temp = self as Quest
_arcQuest003Script kmyQuest = __temp as _arcQuest003Script
;END AUTOCAST
;BEGIN CODE
;the player has engaged in combat with the thalmor
;this stage is set in the thalmor alias scripts on each of the agents
;under the OnCombatStateChanged event in this quest

;force start part 2 of the fight scene
_arcLumberCampSceneQuestFight02Scene.ForceStart()

;add eivind as a follower
Eivind.SetFollow(True)

;remove silent music track
_arcMUSSilenceLumberCampScene.Remove()

;hide the current objective, as long as it is not currently to fight the thalmor
If kmyQuest.CurrentObjective != 40
    SetObjectiveDisplayed(kmyQuest.CurrentObjective, False)
EndIf

;display objective to fight the thalmor
kmyQuest.SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_83
Function Fragment_83()
;BEGIN CODE
;if thalmor agent 2 is alive

;stop combat and return to base
Actor ThalmorAgent02Ref = Alias_ThalmorAgent02.GetReference() as Actor
ThalmorAgent02Ref.StopCombat()
ThalmorAgent02Ref.StopCombatAlarm()
ThalmorAgent02Ref.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto

Quest Property _arcLumberCampSceneQuest  Auto

Quest Property _arcLumberCampFleeQuest  Auto

_arcQuest003PlayerAliasScript Property Player  Auto

_arcQuest003ThalmorAliasScript Property ThalmorAgent01 Auto

_arcQuest003ThalmorAliasScript Property ThalmorAgent02 Auto

_arcQuest003ThalmorVoiceAliasScript Property ThalmorVoice Auto

_arcQuest003ThalEmbTrigAliasScript Property ThalmorEmbassyTrigger Auto

_arcQuest003OdeliaExtTrigAliasScript Property OdeliaExtTrigger Auto

_arcQuest003OESQuestTrigAliasScript Property OESQuestTrigger Auto

_arcQuest003OdeliaDoorExtAliasScript Property OdeliaDoorExt Auto

_arcQuest003OEPAliasScipt Property OdeliaEntryPedestal Auto

Scene Property _arcLumberCampSceneQuestStart01Scene  Auto

Scene Property _arcLumberCampSceneQuestStart02Scene  Auto

Scene Property _arcLumberCampSceneQuestKnockThalmorScene  Auto

Scene Property _arcLumberCampSceneQuestKnockEivindScene  Auto

Scene Property _arcLumberCampSceneQuestNegotiate01Scene Auto

Scene Property _arcLumberCampSceneQuestSneak01Scene Auto

Scene Property _arcLumberCampSceneQuestSneak02Scene  Auto

Scene Property _arcLumberCampSceneQuestFight01Scene Auto

Scene Property _arcLumberCampSceneQuestFight02Scene  Auto

Scene Property _arcEivindNavigateQuestScene  Auto  

MusicType Property _arcMUSSilenceLumberCampScene  Auto  

MusicType Property _arcMUSLumberCampScene  Auto  

_arcQuest003SawMillAliasScript Property SawMill Auto

_arcQuest003EivindAliasScript Property Eivind Auto

Quest Property _arcEivindNavigateQuest  Auto  

Quest Property _arcOdeliaEntrySceneQuest  Auto  

Quest Property _arcThalmorEmbassySceneQuest  Auto  

_arcFollowerManagerQuestScript Property _arcFollowerManagerQuest Auto

Quest Property _arcQuest004  Auto  

_arcLumberCampDoorExtAliasScript Property LumberCampDoorExt Auto

Faction Property DragonBridgeHorgeirHouse  Auto  

Quest Property _arcClintonCampfireQuest  Auto  
