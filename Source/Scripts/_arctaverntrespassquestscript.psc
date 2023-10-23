ScriptName _arcTavernTrespassQuestScript Extends Quest

Actor Property PlayerRef Auto
Faction Property _arcTavernTrespassFaction Auto

_arcTavernTrespassEmployeeAliasScript Property JulienneLylvieve Auto
_arcTavernTrespassEmployeeAliasScript Property Faida Auto
_arcTavernTrespassEmployeeAliasScript Property Telisha Auto

Function EnableTrespass(Bool abEnableTrespass)
	If abEnableTrespass
		PlayerRef.AddToFaction(_arcTavernTrespassFaction)
		
		JulienneLylvieve.TrySetPCRelationshipRank(-2)
		Faida.TrySetPCRelationshipRank(-2)
		Telisha.TrySetPCRelationshipRank(-2)
		
		;due to conditions in the player alias on this quest
		;it will not start unless the player is currently in the four shields tavern and
		;they are in the trespass faction
		Start()
	Else
		PlayerRef.RemoveFromFaction(_arcTavernTrespassFaction)
		
		JulienneLylvieve.TrySetPCRelationshipRank(0)
		Faida.TrySetPCRelationshipRank(0)
		Telisha.TrySetPCRelationshipRank(0)
		
		Stop()
	EndIf
EndFunction
