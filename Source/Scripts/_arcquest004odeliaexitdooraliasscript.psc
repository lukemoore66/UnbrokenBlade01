ScriptName _arcQuest004OdeliaExitDoorAliasScript Extends ReferenceAlias

Function UnlockDoor()
	ObjectReference DoorRef = GetReference()

	DoorRef.GetLinkedRef().Activate(DoorRef)
	
	Utility.Wait(4.0)
	
	DoorRef.Lock(False)
EndFunction
