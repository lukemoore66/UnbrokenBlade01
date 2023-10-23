ScriptName _arcFBQ001ShoutMarkerAliasScript Extends ReferenceAlias

Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto

ObjectReference ShoutMarkerRef
ObjectReference _arcDragonShoutMarkerInit
ObjectReference _arcDragonShoutMarkerRef01
ObjectReference _arcDragonShoutMarkerRef02

Auto State Inactive
	;do nothing
EndState

State Ready
	Event OnActivate(ObjectReference akActivator)
		GoToState("ToRef01")
		
		ShoutMarkerRef.SplineTranslateToRef(_arcDragonShoutMarkerRef01, 320.0, 320.0, 10.0)
	EndEvent
EndState

State ToRef01
	Event OnTranslationAlmostComplete()
		GoToState("ToRef02")
		
		ShoutMarkerRef.SplineTranslateToRef(_arcDragonShoutMarkerRef02, 320.0, 320.0, 10.0)
	EndEvent
	
	Event OnActivate(ObjectReference akActivator)
		GoToState("Finishing")
		
		ShoutMarkerRef.SplineTranslateToRef(_arcDragonShoutMarkerInit, 320.0, 320.0, 10.0)
	EndEvent
EndState

State ToRef02
	Event OnTranslationAlmostComplete()
		GoToState("ToRef01")
		
		ShoutMarkerRef.SplineTranslateToRef(_arcDragonShoutMarkerRef01, 320.0, 320.0, 10.0)
	EndEvent
	
	Event OnActivate(ObjectReference akActivator)
		GoToState("Finishing")
		
		ShoutMarkerRef.SplineTranslateToRef(_arcDragonShoutMarkerInit, 320.0, 320.0, 10.0)
	EndEvent
EndState

State Finishing
		Event OnTranslationComplete()
		GoToState("Ready")
	EndEvent
EndState

Event OnCellLoad()
	ShoutMarkerRef = GetReference()

	_arcDragonShoutMarkerInit = ShoutMarkerRef.GetLinkedRef(LinkCustom01)
	_arcDragonShoutMarkerRef01 = ShoutMarkerRef.GetLinkedRef(LinkCustom02)
	_arcDragonShoutMarkerRef02 = ShoutMarkerRef.GetLinkedRef(LinkCustom03)
	
	GoToState("Ready")
EndEvent

Event OnTranslationAlmostComplete()
	;do nothing
EndEvent

Event OnActivate(ObjectReference akActivator)
	;do nothing
EndEvent

Event OnUnload()
	GoToState("Inactive")
	
	ShoutMarkerRef.MoveToMyEditorLocation()
	
	ShoutMarkerRef = None
	
	_arcDragonShoutMarkerInit = None
	_arcDragonShoutMarkerRef01 = None
	_arcDragonShoutMarkerRef02 = None
EndEvent
