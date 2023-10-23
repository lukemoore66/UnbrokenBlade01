ScriptName _arcFBQ003GuardianAliasScript Extends ReferenceAlias

State Stage70
	Event OnCellAttach()
		SummonWithDelay(1.0)
	EndEvent
EndState

State Summon
	Event OnUpdate()
		(GetReference() as _arcSummonFXScript).Summon()
		GoToState("Inactive")
	EndEvent
EndState
State Banish
	Event OnUpdate()
		(GetReference() as _arcSummonFXScript).Banish()
		GoToState("Inactive")
	EndEvent
EndState

State Inactive
	;do nothing
EndState

Function SummonWithDelay(Float akDelay)
	GoToState("Summon")
	RegisterForSingleUpdate(akDelay)
EndFunction

Function BanishWithDelay(Float akDelay)
	GoToState("Banish")
	RegisterForSingleUpdate(akDelay)
EndFunction
