ScriptName _arcMODQuestMessengerBookAliasScript Extends ReferenceAlias

Form Property _arcMODBook Auto
ReferenceAlias Property DummyMarker Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	ObjectReference BookRef = GetReference()
	ObjectReference DummyMarkerRef = DummyMarker.GetReference()
	
	akNewContainer.RemoveItem(BookRef, abSilent = True)
	ForceRefTo(DummyMarkerRef.PlaceAtMe(_arcMODBook, abInitiallyDisabled = True))
EndEvent
