ScriptName _arcTSQuestTelishaAliasScript Extends ReferenceAlias

Location Property DragonBridgeFourShieldsTavernLocation Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If akOldLoc == DragonBridgeFourShieldsTavernLocation
		;not storing ObjectReference, it is easier to do this given
		;the nature of this script
		(GetReference() as Actor).MoveToPackageLocation()
	EndIf
EndEvent
