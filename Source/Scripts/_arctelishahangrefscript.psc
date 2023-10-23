ScriptName _arcTelishaHangRefScript Extends _arcHangRefScript

Keyword Property _arcHangKeyword Auto
Keyword Property LinkCustom01 Auto
Spell Property _arcHangActorSpell Auto

Form Property _arcTelishaAmulet Auto
Form Property _arcTelishaJournal Auto
Form Property _arcTelishaClothesBarKeeper Auto
Form Property ClothesBarkeeperShoes Auto
Form Property ExecutionHood Auto

ReferenceAlias Property TelishaJournal Auto

Bool[] AmuletState
Bool[] ClothesState
Bool[] ShoesState
Bool[] HoodState
Bool JournalState

Event OnInit()
	AmuletState = New Bool[2]
	ClothesState = New Bool[2]
	ShoesState = New Bool[2]
	HoodState = New Bool[2]
EndEvent

Auto State Inactive
	;do nothing
EndState

State Hanging
	Event OnLoad()
		Busy = True
	
		GetInventoryState()
		
		Disable()
		BlockActivation(True)
		
		ObjectReference HangRef = GetLinkedRef(_arcHangKeyword)
		ObjectReference DummyRef = HangRef.GetLinkedRef()
		ObjectReference NavcutRef = HangRef.GetLinkedRef(LinkCustom01)
		
		If IsDead()
			Resurrect()
		EndIf
		
		GoToState("Moving")
		NavcutRef.Disable()
		Utility.Wait(0.1)
		MoveTo(HangRef, 0.0, 0.0, -192.0)
		KillEssential()
		Enable()
		
		While !Is3DLoaded()
			Utility.Wait(0.1)
		EndWhile
		
		SetAlpha(0.0)
		Utility.Wait(0.1)
		NavcutRef.Enable()
		GoToState("Hanging")
		
		If !PlayerRef.HasSpell(_arcHangActorSpell)
			_arcHangActorSpell.Cast(Self, PlayerRef)
		EndIf
		
		DummyRef.Enable()
		
		ApplyHavokImpulse(0.0, 0.0, -1.0, 1.0)
		
		While !HangRef.Is3DLoaded()
			Utility.Wait(0.1)
		EndWhile
		
		Game.AddHavokBallAndSocketConstraint(Self, "NPC L Hand [LHnd]", HangRef, "LHandNode")
		Game.AddHavokBallAndSocketConstraint(Self, "NPC R Hand [RHnd]", HangRef, "RHandNode")
		Game.AddHavokBallAndSocketConstraint(Self, "NPC Head [Head]", DummyRef, "HeadNode")
		Game.AddHavokBallAndSocketConstraint(Self, "NPC L Foot [Lft ]", DummyRef, "LFootNode")
		Game.AddHavokBallAndSocketConstraint(Self, "NPC R Foot [Rft ]", DummyRef, "RFootNode")
		
		RemoveAllItems(abRemoveQuestItems = True)
		Utility.Wait(3.0)
		
		GoToState("AddingItems")
		
		SetInventoryState()
		
		GoToState("Hanging")
		
		DummyRef.Disable()
		
		ApplyHavokImpulse(0.0, 0.0, -1.0, 1.0)
		
		BlockActivation(False)
		SetAlpha(1.0, True)
		
		Busy = False
	EndEvent
	
	Event OnUnload()
		PlayerRef.DispelSpell(_arcHangActorSpell)
	EndEvent
	
	Event OnCellAttach()
		OnLoad()
	EndEvent
	
	Event OnCellDetach()
		PlayerRef.DispelSpell(_arcHangActorSpell)
	EndEvent
EndState

State Moving
	;do nothing
EndState

State AddingItems
	;do nothing
EndState

Function GetInventoryState()
	AmuletState[0] = GetItemCount(_arcTelishaAmulet)
	ClothesState[0] = GetItemCount(_arcTelishaClothesBarKeeper)
	ShoesState[0] = GetItemCount(ClothesBarkeeperShoes)
	HoodState[0] = GetItemCount(ExecutionHood)
	JournalState = GetItemCount(_arcTelishaJournal)
	
	AmuletState[1] = IsEquipped(_arcTelishaAmulet)
	ClothesState[1] = IsEquipped(_arcTelishaClothesBarKeeper)
	ShoesState[1] = IsEquipped(ClothesBarkeeperShoes)
	HoodState[1] = IsEquipped(ExecutionHood)
EndFunction

Function SetInventoryState()
	;because AddItem() and EquipItem() do not behave for dead actors as expected,
	;use EquipItem() to automatically add the item and equip it,
	;then use UnequipItem() if telisha did not have it equipped
	
	If AmuletState[0]
		EquipItem(_arcTelishaAmulet)
		
		If !AmuletState[1]
			UnequipItem(_arcTelishaAmulet)
		EndIf
	EndIf
	
	If ClothesState[0]
		EquipItem(_arcTelishaClothesBarKeeper)
		
		If !ClothesState[1]
			UnequipItem(_arcTelishaClothesBarKeeper)
		EndIf
	EndIf
	
	If ShoesState[0]
		EquipItem(ClothesBarkeeperShoes)
		
		If !ShoesState[1]
			UnequipItem(ClothesBarkeeperShoes)
		EndIf
	EndIf
	
	If HoodState[0]
		EquipItem(ExecutionHood)
		
		If !HoodState[1]
			UnequipItem(ExecutionHood)
		EndIf
	EndIf
	
	;the journal is a special case, as it needs to be a ReferenceAlias in _arcQuest002
	If JournalState
		ObjectReference JournalRef = PlaceAtMe(_arcTelishaJournal, abForcePersist = True, abInitiallyDisabled = True)
		TelishaJournal.ForceRefTo(JournalRef)
		AddItem(JournalRef)
		JournalRef.Enable()
	EndIf
EndFunction
