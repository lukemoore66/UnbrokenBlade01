ScriptName _arcQuest003SawMillAliasScript Extends ReferenceAlias

ResourceObjectScript SawMillRef
Int ResourceState


Auto State Enabled
	;do nothing
EndState

State Disabled
	Event OnBeginState()
		SawMillRef = GetReference() as ResourceObjectScript
		
		ResourceState = SawMillRef.ResourceState
		
		SawMillRef.ChangeState(1)
	EndEvent
	
	Event OnEndState()
		SawMillRef.ChangeState(ResourceState)
		SawMillRef = None
	EndEvent
EndState
