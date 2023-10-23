ScriptName _arcCalderWineQuestScript Extends Quest

GlobalVariable Property GameDaysPassed Auto
Scene Property _arcCalderWineQuestScene Auto
_arcDialogueQuestScript Property _arcDialogueQuest Auto

;the following function is used in _arcCalderWineOfferQuestScene
Function SetNextMiddas(Float MiddasOffset)
	Int iGameDaysPassed = GameDaysPassed.GetValue() as Int
	
	;this works out to be 6am on the next middas
	;6 / 24 hours = 0.25 is how we arrive at 6am
	_arcDialogueQuest.CalderWineNextMiddas = iGameDaysPassed + MiddasOffset + 0.25
	
	_arcCalderWineQuestScene.Stop()
EndFunction
