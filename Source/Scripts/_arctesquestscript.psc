ScriptName _arcTESQuestScript Extends _arcQuestKnockOutScript Conditional

_arcTESQuestThalmorAliasScript Property ThalmorDay01 Auto
_arcTESQuestThalmorAliasScript Property ThalmorDay02 Auto
_arcTESQuestThalmorAliasScript Property ThalmorDay03 Auto
_arcTESQuestThalmorAliasScript Property ThalmorDay04 Auto
_arcTESQuestThalmorAliasScript Property ThalmorNight01 Auto
_arcTESQuestThalmorAliasScript Property ThalmorNight02 Auto
_arcTESQuestThalmorAliasScript Property ThalmorNight03 Auto
_arcTESQuestThalmorAliasScript Property ThalmorNight04 Auto
_arcTESQuestThalmorAliasScript Property ThalmorSoldier01 Auto
_arcTESQuestThalmorAliasScript Property ThalmorSoldier02 Auto
_arcTESQuestThalmorAliasScript Property ThalmorSoldier03 Auto
_arcTESQuestThalmorAliasScript Property ThalmorSoldier04 Auto
_arcTESQuestThalmorAliasScript Property ThalmorAgent01 Auto
_arcTESQuestThalmorAliasScript Property ThalmorAgent02 Auto
_arcTESQuestThalmorAliasScript Property Valronis Auto

Function ResetThalmorAndMoveToPackageLoc()
	ThalmorDay01.ResetAndMoveToPackageLoc()
	ThalmorDay02.ResetAndMoveToPackageLoc()
	ThalmorDay03.ResetAndMoveToPackageLoc()
	ThalmorDay04.ResetAndMoveToPackageLoc()
	ThalmorNight01.ResetAndMoveToPackageLoc()
	ThalmorNight02.ResetAndMoveToPackageLoc()
	ThalmorNight03.ResetAndMoveToPackageLoc()
	ThalmorNight04.ResetAndMoveToPackageLoc()
	ThalmorSoldier01.ResetAndMoveToPackageLoc()
	ThalmorSoldier02.ResetAndMoveToPackageLoc()
	ThalmorSoldier03.ResetAndMoveToPackageLoc()
	ThalmorSoldier04.ResetAndMoveToPackageLoc()
	ThalmorAgent01.ResetAndMoveToPackageLoc()
	ThalmorAgent02.ResetAndMoveToPackageLoc()
	Valronis.ResetAndMoveToPackageLoc()
EndFunction

Function StopThalmorCombat()
	ThalmorDay01.TryStopCombat()
	ThalmorDay02.TryStopCombat()
	ThalmorDay03.TryStopCombat()
	ThalmorDay04.TryStopCombat()
	ThalmorNight01.TryStopCombat()
	ThalmorNight02.TryStopCombat()
	ThalmorNight03.TryStopCombat()
	ThalmorNight04.TryStopCombat()
	ThalmorSoldier01.TryStopCombat()
	ThalmorSoldier02.TryStopCombat()
	ThalmorSoldier03.TryStopCombat()
	ThalmorSoldier04.TryStopCombat()
	ThalmorAgent01.TryStopCombat()
	ThalmorAgent02.TryStopCombat()
	Valronis.TryStopCombat()
EndFunction
