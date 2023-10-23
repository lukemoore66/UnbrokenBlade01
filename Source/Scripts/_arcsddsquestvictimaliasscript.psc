ScriptName _arcSDDSQuestVictimAliasScript Extends ReferenceAlias

Form Property ExecutionHood Auto
Sound Property _arcITMClothingUp Auto

Function AddHood()
	(GetReference() as Actor).EquipItem(ExecutionHood, True, True)
EndFunction

Function RemoveHood()
	Actor VictimRef = GetReference() as Actor
	
	If VictimRef.IsEquipped(ExecutionHood)
		_arcITMClothingUp.Play(VictimRef)
	EndIf
	
	VictimRef.UnequipItem(ExecutionHood, True, True)
	VictimRef.RemoveItem(ExecutionHood)
EndFunction
