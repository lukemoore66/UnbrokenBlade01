ScriptName _arcMODQuestScript Extends Quest

_arcMOdxQuestScript Property _arcMODxQuest Auto

Actor Property PlayerRef Auto
_arcDialogueQuestScript Property _arcDialogueQuest Auto
ReferenceAlias Property CurrentVictim Auto
ReferenceAlias Property Valronis Auto
ReferenceAlias Property Messenger Auto
ReferenceAlias Property MessengerBook Auto
ReferenceAlias Property DummyMarker Auto
ReferenceAlias Property BehaviourMarker Auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property _arcMODQuestTargetTrigger Auto
GlobalVariable Property _arcMODQuestTargetTime Auto
GlobalVariable Property _arcMODQuestDifficulty Auto
Scene Property _arcMessengerOfDeathQuestScene01 Auto
Scene Property _arcMessengerOfDeathQuestScene02 Auto
Scene Property _arcMessengerOfDeathQuestScene03 Auto
Scene Property _arcMessengerOfDeathQuestScene04 Auto
Scene Property _arcMessengerOfDeathQuestScene05 Auto
Perk Property _arcMODQuestPerk Auto
Form Property ExecutionHood Auto
Sound Property _arcMessengerOfDeathSFX Auto

ReferenceAlias Property Alive01 Auto
ReferenceAlias Property Alive02 Auto
ReferenceAlias Property Alive03 Auto
ReferenceAlias Property Alive04 Auto
ReferenceAlias Property Alive05 Auto
ReferenceAlias Property Alive06 Auto
ReferenceAlias Property Alive07 Auto
ReferenceAlias Property Alive08 Auto
ReferenceAlias Property Alive09 Auto
ReferenceAlias Property Alive10 Auto
ReferenceAlias Property Alive11 Auto
ReferenceAlias Property Alive12 Auto
ReferenceAlias Property Alive13 Auto
ReferenceAlias Property Alive14 Auto
ReferenceAlias Property Alive15 Auto
ReferenceAlias Property Alive16 Auto

ReferenceAlias Property Dead01 Auto
ReferenceAlias Property Dead02 Auto
ReferenceAlias Property Dead03 Auto
ReferenceAlias Property Dead04 Auto
ReferenceAlias Property Dead05 Auto
ReferenceAlias Property Dead06 Auto
ReferenceAlias Property Dead07 Auto
ReferenceAlias Property Dead08 Auto
ReferenceAlias Property Dead09 Auto
ReferenceAlias Property Dead10 Auto
ReferenceAlias Property Dead11 Auto
ReferenceAlias Property Dead12 Auto
ReferenceAlias Property Dead13 Auto
ReferenceAlias Property Dead14 Auto
ReferenceAlias Property Dead15 Auto
ReferenceAlias Property Dead16 Auto

Float Property Trigger01Time = 4.0 Auto
Float Property Trigger02Time = 4.0 Auto
Float Property Trigger03Time = 4.0 Auto
Float Property Trigger04Time = 4.0 Auto
Float Property Trigger05Time = 4.0 Auto
Float Property Trigger06Time = 4.0 Auto
Float Property Trigger07Time = 4.0 Auto
Float Property Trigger08Time = 4.0 Auto
Float Property Trigger09Time = 4.0 Auto
Float Property Trigger10Time = 4.0 Auto
Float Property Trigger11Time = 4.0 Auto
Float Property Trigger12Time = 4.0 Auto
Float Property Trigger13Time = 4.0 Auto
Float Property Trigger14Time = 4.0 Auto
Float Property Trigger15Time = 4.0 Auto
Float Property Trigger16Time = 4.0 Auto

Int Property Trigger01Target = 2 Auto
Int Property Trigger02Target = 3 Auto
Int Property Trigger03Target = 4 Auto
Int Property Trigger04Target = 5 Auto
Int Property Trigger05Target = 6 Auto
Int Property Trigger06Target = 7 Auto
Int Property Trigger07Target = 8 Auto
Int Property Trigger08Target = 9 Auto
Int Property Trigger09Target = 10 Auto
Int Property Trigger10Target = 11 Auto
Int Property Trigger11Target = 12 Auto
Int Property Trigger12Target = 13 Auto
Int Property Trigger13Target = 14 Auto
Int Property Trigger14Target = 15 Auto
Int Property Trigger15Target = 16 Auto
Int Property Trigger16Target = 17 Auto

Int Property CurrentTrigger Auto Hidden

Int FirstEmptyDeadIndex = -1
ReferenceAlias FirstEmptyDeadAlias = None

Int FirstEmptyAliveIndex = -1

Int Stage

State SetStageWithDelay
	Event OnUpdate()
		If IsStarting()
			RegisterForSingleUpdate(0.1)
			Return
		EndIf
		
		GoToState("")
		
		If IsRunning()
			SetStage(Stage)
		EndIf
	EndEvent
EndState

State ShutdownWithDelay
	Event OnUpdate()
		GoToState("")
		
		Stop()
	EndEvent
EndState

;grab the current trigger number
Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
	CurrentTrigger = aiValue1
EndEvent

;ugly hack function needed to allow scenes to run during quest startup
Function SetStageWithDelay(Int aiStage)
	GoToState("SetStageWithDelay")
	Stage = aiStage
	OnUpdate()
EndFunction

Function ShutdownWithDelay(Float iaShutdownDelay)
	GoToState("ShutdownWithDelay")
	RegisterForSingleUpdate(iaShutdownDelay)
EndFunction

;this needs to be done via script, as filling aliases automatically does not maintain
;the order. They need to be presented in the correct order as the messenger appends them
;to the book
Function FillDeadAliases()
	;this is better done manually, instead of a loop with GetAlias(), as it way more performant
	ObjectReference Dead01Ref = _arcDialogueQuest.MessengerDeadActors[0] as ObjectReference
	ObjectReference Dead02Ref = _arcDialogueQuest.MessengerDeadActors[1] as ObjectReference
	ObjectReference Dead03Ref = _arcDialogueQuest.MessengerDeadActors[2] as ObjectReference
	ObjectReference Dead04Ref = _arcDialogueQuest.MessengerDeadActors[3] as ObjectReference
	ObjectReference Dead05Ref = _arcDialogueQuest.MessengerDeadActors[4] as ObjectReference
	ObjectReference Dead06Ref = _arcDialogueQuest.MessengerDeadActors[5] as ObjectReference
	ObjectReference Dead07Ref = _arcDialogueQuest.MessengerDeadActors[6] as ObjectReference
	ObjectReference Dead08Ref = _arcDialogueQuest.MessengerDeadActors[7] as ObjectReference
	ObjectReference Dead09Ref = _arcDialogueQuest.MessengerDeadActors[8] as ObjectReference
	ObjectReference Dead10Ref = _arcDialogueQuest.MessengerDeadActors[9] as ObjectReference
	ObjectReference Dead11Ref = _arcDialogueQuest.MessengerDeadActors[10] as ObjectReference
	ObjectReference Dead12Ref = _arcDialogueQuest.MessengerDeadActors[11] as ObjectReference
	ObjectReference Dead13Ref = _arcDialogueQuest.MessengerDeadActors[12] as ObjectReference
	ObjectReference Dead14Ref = _arcDialogueQuest.MessengerDeadActors[13] as ObjectReference
	ObjectReference Dead15Ref = _arcDialogueQuest.MessengerDeadActors[14] as ObjectReference
	ObjectReference Dead16Ref = _arcDialogueQuest.MessengerDeadActors[15] as ObjectReference
	
	ObjectReference DummyMarkerRef = DummyMarker.GetReference()
	
	;first we use the references to fill in the dead actor aliases and
	;blank dummy names for the book for null references
	If Dead01Ref
		Dead01.ForceRefTo(Dead01Ref)
	Else
		Dead01.ForceRefTo(DummyMarkerRef)
	EndIf
	
	If Dead02Ref
		Dead02.ForceRefTo(Dead02Ref)
	Else
		Dead02.ForceRefTo(DummyMarkerRef)
	EndIf
	
	If Dead03Ref
		Dead03.ForceRefTo(Dead03Ref)
	Else
		Dead03.ForceRefTo(DummyMarkerRef)
	EndIf
	
	If Dead04Ref
		Dead04.ForceRefTo(Dead04Ref)
	Else
		Dead04.ForceRefTo(DummyMarkerRef)
	EndIf
	
	If Dead05Ref
		Dead05.ForceRefTo(Dead05Ref)
	Else
		Dead05.ForceRefTo(DummyMarkerRef)
	EndIf
	
	If Dead06Ref
		Dead06.ForceRefTo(Dead06Ref)
	Else
		Dead06.ForceRefTo(DummyMarkerRef)
	EndIf
	
	If Dead07Ref
		Dead07.ForceRefTo(Dead07Ref)
	Else
		Dead07.ForceRefTo(DummyMarkerRef)
	EndIf
	
	If Dead08Ref
		Dead08.ForceRefTo(Dead08Ref)
	Else
		Dead08.ForceRefTo(DummyMarkerRef)
	EndIf
	
	If Dead09Ref
		Dead09.ForceRefTo(Dead09Ref)
	Else
		Dead09.ForceRefTo(DummyMarkerRef)
	EndIf
	
	If Dead10Ref
		Dead10.ForceRefTo(Dead10Ref)
	Else
		Dead10.ForceRefTo(DummyMarkerRef)
	EndIf
	
	If Dead11Ref
		Dead11.ForceRefTo(Dead11Ref)
	Else
		Dead11.ForceRefTo(DummyMarkerRef)
	EndIf
	
	If Dead12Ref
		Dead12.ForceRefTo(Dead12Ref)
	Else
		Dead12.ForceRefTo(DummyMarkerRef)
	EndIf
	
	If Dead13Ref
		Dead13.ForceRefTo(Dead13Ref)
	Else
		Dead13.ForceRefTo(DummyMarkerRef)
	EndIf
	
	If Dead14Ref
		Dead14.ForceRefTo(Dead14Ref)
	Else
		Dead14.ForceRefTo(DummyMarkerRef)
	EndIf
	
	If Dead15Ref
		Dead15.ForceRefTo(Dead15Ref)
	Else
		Dead15.ForceRefTo(DummyMarkerRef)
	EndIf
	
	If Dead16Ref
		Dead16.ForceRefTo(Dead16Ref)
	Else
		Dead16.ForceRefTo(DummyMarkerRef)
	EndIf
	
	;then we use the references to get both the first empty dead alias
	;and the first empty dead index
	If !Dead01Ref
		FirstEmptyDeadIndex = 0
		FirstEmptyDeadAlias = Dead01
	ElseIf !Dead02Ref
		FirstEmptyDeadIndex = 1
		FirstEmptyDeadAlias = Dead02
	ElseIf !Dead03Ref
		FirstEmptyDeadIndex = 2
		FirstEmptyDeadAlias = Dead03
	ElseIf !Dead04Ref
		FirstEmptyDeadIndex = 3
		FirstEmptyDeadAlias = Dead04
	ElseIf !Dead05Ref
		FirstEmptyDeadIndex = 4
		FirstEmptyDeadAlias = Dead05
	ElseIf !Dead06Ref
		FirstEmptyDeadIndex = 5
		FirstEmptyDeadAlias = Dead06
	ElseIf !Dead07Ref
		FirstEmptyDeadIndex = 6
		FirstEmptyDeadAlias = Dead07
	ElseIf !Dead08Ref
		FirstEmptyDeadIndex = 7
		FirstEmptyDeadAlias = Dead08
	ElseIf !Dead09Ref
		FirstEmptyDeadIndex = 8
		FirstEmptyDeadAlias = Dead09
	ElseIf !Dead10Ref
		FirstEmptyDeadIndex = 9
		FirstEmptyDeadAlias = Dead10
	ElseIf !Dead11Ref
		FirstEmptyDeadIndex = 10
		FirstEmptyDeadAlias = Dead11
	ElseIf !Dead12Ref
		FirstEmptyDeadIndex = 11
		FirstEmptyDeadAlias = Dead12
	ElseIf !Dead13Ref
		FirstEmptyDeadIndex = 12
		FirstEmptyDeadAlias = Dead13
	ElseIf !Dead14Ref
		FirstEmptyDeadIndex = 13
		FirstEmptyDeadAlias = Dead14
	ElseIf !Dead15Ref
		FirstEmptyDeadIndex = 14
		FirstEmptyDeadAlias = Dead15
	Else
		FirstEmptyDeadIndex = 15
		FirstEmptyDeadAlias = Dead16
	EndIf
EndFunction

ReferenceAlias Function GetFinalValidAliveAlias()
	;just get the final valid alive alias, the aliases are always randomized
	;so randomness is built in
	;if we have previously obtained a first empty alive alias index, use it instead
	If FirstEmptyAliveIndex != -1
		;we can exploit alias id's to get the first empty alive index
		;they start from index 5 and go to 20
		;use the offset of 5, then subtract 1 to get the last valid alias index
		;resulting in an offset of 4, giving the final valid alive alias
		Return GetAlias(FirstEmptyAliveIndex + 4) as ReferenceAlias
	EndIf
	
	If !Alive01.GetReference()
		FirstEmptyAliveIndex = 0
		Return None
	ElseIf !Alive02.GetReference()
		FirstEmptyAliveIndex = 1
		Return Alive01
	ElseIf !Alive03.GetReference()
		FirstEmptyAliveIndex = 2
		Return Alive02
	ElseIf !Alive04.GetReference()
		FirstEmptyAliveIndex = 3
		Return Alive03
	ElseIf !Alive05.GetReference()
		FirstEmptyAliveIndex = 4
		Return Alive04
	ElseIf !Alive06.GetReference()
		FirstEmptyAliveIndex = 5
		Return Alive05
	ElseIf !Alive07.GetReference()
		FirstEmptyAliveIndex = 6
		Return Alive06
	ElseIf !Alive08.GetReference()
		FirstEmptyAliveIndex = 7
		Return Alive07
	ElseIf !Alive09.GetReference()
		FirstEmptyAliveIndex = 8
		Return Alive08
	ElseIf !Alive10.GetReference()
		FirstEmptyAliveIndex = 9
		Return Alive09
	ElseIf !Alive11.GetReference()
		FirstEmptyAliveIndex = 10
		Return Alive10
	ElseIf !Alive12.GetReference()
		FirstEmptyAliveIndex = 11
		Return Alive11
	ElseIf !Alive13.GetReference()
		FirstEmptyAliveIndex = 12
		Return Alive12
	ElseIf !Alive14.GetReference()
		FirstEmptyAliveIndex = 13
		Return Alive13
	ElseIf !Alive15.GetReference()
		FirstEmptyAliveIndex = 14
		Return Alive14
	Elseif !Alive16.GetReference()
		FirstEmptyAliveIndex = 15
		Return Alive15
	Else
		;it is implied that Alive16 exists, so return that alias
		;FirstEmptyAliveIndex = 16 is out of bounds, however, it is always decremented
		;in the KillVictimFinish() function, as well as at the beginning of this function
		;which is the only other two places it is used
		FirstEmptyAliveIndex = 16
		Return Alive16
	EndIf
EndFunction

Function KillVictimStart()
	;get a victim
	Actor VictimRef = GetFinalValidAliveAlias().GetReference() as Actor
		
	;set them as the current victim for dialogue to work properly
	CurrentVictim.ForceRefTo(VictimRef)
	
	;50% chance to equip hood, except for children, as they can't have them
	If !VictimRef.IsChild() && Utility.RandomInt(0, 1)
		;remove any items they may be wearing under the hood
		VictimRef.UnequipItemSlot(30) ;head
		VictimRef.UnequipItemSlot(31) ;hair
		VictimRef.UnequipItemSlot(41) ;long hair
		VictimRef.UnequipItemSlot(42) ;circlet
		VictimRef.UnequipItemSlot(43) ;ears
		VictimRef.EquipItem(ExecutionHood, True)
	EndIf
	
	;make it so the victim can't move
	VictimRef.SetDontMove(True)
	
	;set the actor so they are a ghost
	VictimRef.SetGhost(True)
	
	;play the scene
	_arcMessengerOfDeathQuestScene01.Start()
EndFunction

Function KillVictimMid()
	;get the current victim
	Actor VictimRef = CurrentVictim.GetReference() as Actor

	;if the victim is not a child
	If !VictimRef.IsChild()
			;have valronis kill them
		VictimRef.KillSilent(Valronis.GetReference() as Actor)
	EndIf
	
	;play kill sting, if messenger is loaded
	ObjectReference MessengerRef = Messenger.GetReference()
	If MessengerRef.Is3DLoaded()
		_arcMessengerOfDeathSFX.Play(PlayerRef)
	EndIf
EndFunction

Function KillVictimFinish()
	;get the current victim
	Actor VictimRef = CurrentVictim.GetReference() as Actor
	
	;sometimes the killing scene may finish prematurely if the player
	;leaves the cell, run the important part of KillVictimMid()
	;which kills the victim if they are not a child
	;the victim will always be disabled, as they are banished regardless
	;at the end of the killing scene
	If !VictimRef.IsDead()
		;if the victim is not a child
		If !VictimRef.IsChild()
			;have valronis kill them
			VictimRef.KillSilent(Valronis.GetReference() as Actor)
		EndIf
	EndIf
	
	;clear the current victim alias
	CurrentVictim.Clear()
	
	;clear the last valid alive alias, as that alias is now dead
	;we can calculate what this is by exploiting alias id's in the same
	;way as we did in the GetFinalValidAliveAlias() function by using an offset of 4
	;when referring to the alias via it's id
	(GetAlias(FirstEmptyAliveIndex + 4) as ReferenceAlias).Clear()
	
	;decrement the first empty alive index, now that the last one is now
	;both dead and cleared
	FirstEmptyAliveIndex -= 1
	
	;add the victim to the first empty dead alias, which we got when
	;we were filling the dead actor aliases earlier	
	FirstEmptyDeadAlias.ForceRefTo(VictimRef)
	
	;add the current victim to the next avaliable index in the dead actor array
	_arcDialogueQuest.MessengerDeadActors[FirstEmptyDeadIndex] = VictimRef
	
	;we can exploit alias id's to calculate the next empty dead alias
	;they are indexed in ascending numerical order and they always fill accordingly
	;id's start from the number 21 and go to 36
	;therefore use an offset of 21, then increment by 1, resulting in 22, giving the next empty alias
	FirstEmptyDeadAlias = GetAlias(FirstEmptyDeadIndex + 22) as ReferenceAlias
	
	;increment the first empty index
	FirstEmptyDeadIndex += 1
	
	;set new objective in current tracker quest
	SetNewObjective(VictimRef)
EndFunction

Function SetTarget()
	;if the quest has been turned off, do not set a target
	If	_arcMODQuestTargetTrigger.GetValue() < 0.0
		Return
	EndIf

	Float TargetTime
	Int TargetTrigger
	
	If CurrentTrigger == 1
		TargetTrigger = Trigger01Target
		TargetTime = Trigger01Time
	ElseIf CurrentTrigger == 2
		TargetTrigger = Trigger02Target
		TargetTime = Trigger02Time
	ElseIf CurrentTrigger == 3
		TargetTrigger = Trigger03Target
		TargetTime = Trigger03Time
	ElseIf CurrentTrigger == 4
		TargetTrigger = Trigger04Target
		TargetTime = Trigger04Time
	ElseIf CurrentTrigger == 5
		TargetTrigger = Trigger05Target
		TargetTime = Trigger05Time
	ElseIf CurrentTrigger == 6
		TargetTrigger = Trigger06Target
		TargetTime = Trigger06Time
	ElseIf CurrentTrigger == 7
		TargetTrigger = Trigger07Target
		TargetTime = Trigger07Time
	ElseIf CurrentTrigger == 8
		TargetTrigger = Trigger08Target
		TargetTime = Trigger08Time
	ElseIf CurrentTrigger == 9
		TargetTrigger = Trigger09Target
		TargetTime = Trigger09Time
	ElseIf CurrentTrigger == 10
		TargetTrigger = Trigger10Target
		TargetTime = Trigger10Time
	ElseIf CurrentTrigger == 11
		TargetTrigger = Trigger11Target
		TargetTime = Trigger11Time
	ElseIf CurrentTrigger == 12
		TargetTrigger = Trigger12Target
		TargetTime = Trigger12Time
	ElseIf CurrentTrigger == 13
		TargetTrigger = Trigger13Target
		TargetTime = Trigger13Time
	ElseIf CurrentTrigger == 14
		TargetTrigger = Trigger14Target
		TargetTime = Trigger14Time
	ElseIf CurrentTrigger == 15
		TargetTrigger = Trigger15Target
		TargetTime = Trigger15Time
	Else ;CurrentTrigger == 16
		TargetTrigger = Trigger16Target
		TargetTime = Trigger16Time
	EndIf
	
	;set diffculty multipliers
	;0 = easy, 1 = normal, 2 = hard, 3 = expert
	Int Difficulty = _arcMODQuestDifficulty.GetValue() as Int
	If !Difficulty
		TargetTime = TargetTime * 2.5
	ElseIf Difficulty == 1
		TargetTime = TargetTime * 2.0
	ElseIf Difficulty == 2
		TargetTime = TargetTime * 1.5
	Else ;difficulty == 3
		TargetTime = TargetTime * 0.75
	EndIf
	
	TargetTime = (Math.Floor(TargetTime * 4.0)) as Float / 4.0
	
	_arcMODQuestTargetTrigger.SetValue(TargetTrigger)
	_arcMODQuestTargetTime.SetValue(GameDaysPassed.GetValue() + (TargetTime / 24.0))
EndFunction

Function ReadBook()
	If !IsRunning()
		Return
	EndIf

	MessengerBook.GetReference().Activate(PlayerRef)
EndFunction

Function AddPerk(Bool aiAddPerk)
	If aiAddPerk
		PlayerRef.AddPerk(_arcMODQuestPerk)
		Return
	EndIf
	
	PlayerRef.RemovePerk(_arcMODQuestPerk)
EndFunction

Function StartScene(Int aiSceneNumber)
	If aiSceneNumber == 1
		_arcMessengerOfDeathQuestScene01.Start()
	ElseIf aiSceneNumber == 2
		_arcMessengerOfDeathQuestScene02.ForceStart()
	ElseIf aiSceneNumber == 3
		_arcMessengerOfDeathQuestScene03.Start()
	ElseIf aiSceneNumber == 4
		_arcMessengerOfDeathQuestScene04.Start()
	Else
		_arcMessengerOfDeathQuestScene05.Start()
	EndIf
EndFunction

Function SetForceGreetFlag(Int aiFGFlag)
	_arcDialogueQuest.MessengerForceGreet = aiFGFlag
EndFunction

Function MoveVictim()
	(CurrentVictim as _arcQuestActorAliasScript).TryMoveTo(BehaviourMarker.GetReference(), False)
EndFunction

Function SummonVictim()
	_arcSummonFXAliasScript VictimAlias = CurrentVictim as _arcSummonFXAliasScript
	VictimAlias.GoToState("Active")
	VictimAlias.Summon(False)
EndFunction

Function BanishVictim()
	(CurrentVictim as _arcSummonFXAliasScript).Banish()
EndFunction

;this function is called twice
;at the end of KillVictimFinish() (killing)
;it is within the function because it is easy to get the victim's reference
;at the end of _arcMessengerOfDeathQuestScene05 (success)
Function SetNewObjective(ObjectReference akCurrentVictim = None)
	;fill in the current victim for the tracker quest before setting the stage
	;this way it can fill in the needed text replacement data
	If akCurrentVictim
		_arcMOdxQuest.CurrentVictim.ForceRefTo(akCurrentVictim)
	Else
		_arcMOdxQuest.CurrentVictim.Clear()
	EndIf
	
	;the rule is that we set the stage to 10x the current trigger when this function
	;is called
	_arcMODxQuest.SetStage(CurrentTrigger * 10)
EndFunction
