ScriptName _arcGuardianQuestScript Extends Quest

ReferenceAlias Property Guardian Auto
ReferenceAlias Property StartMarker Auto
_arcSummonFXScript Property GuardianRef Auto Hidden

Function StartupQuest()

	GuardianRef = Guardian.GetReference() as _arcSummonFXScript

	GuardianRef.Disable()

	GuardianRef.MoveTo(StartMarker.GetReference())

	GuardianRef.Summon(True)
EndFunction

Function ShutdownQuest(Bool abBanishFX = False)
	GuardianRef.Banish(abBanishFX)
	
	GuardianRef = None
EndFunction
