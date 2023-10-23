ScriptName _arcBlacksmithSoundMarkerRefScript Extends ObjectReference

Cell Property arcOdelia04 Auto
Sound Property NPCHumanBlacksmithHammerDistant Auto

Event OnCellAttach()
	Actor BurningCorpseRef = GetLinkedRef() as Actor
	
	If BurningCorpseRef.IsDead()
		Return
	EndIf
	
	If BurningCorpseRef.GetParentCell() != arcOdelia04
		Return
	EndIf
	
	BurningCorpseRef = None
	
	Cell ParentCell = GetParentCell()
	
	While ParentCell.IsAttached()
		NPCHumanBlacksmithHammerDistant.Play(Self)
		
		Utility.Wait(Utility.RandomFloat(1.0, 1.3))
	EndWhile
EndEvent
