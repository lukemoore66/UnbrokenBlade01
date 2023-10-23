ScriptName _arcGDSQuestScript Extends _arcGuardianQuestScript

GlobalVariable Property _arcDraugrReleasedCount Auto
Message Property _arcGDSQuestDraugrReleasedMSG Auto
Quest Property _arcGuardianDraugrSceneQuest Auto

ReferenceAlias Property Draugr01 Auto
ReferenceAlias Property Draugr02 Auto
ReferenceAlias Property Draugr03 Auto
ReferenceAlias Property Draugr04 Auto
ReferenceAlias Property Draugr05 Auto
ReferenceAlias Property Draugr06 Auto
ReferenceAlias Property Draugr07 Auto

Function ShowMessage()
	_arcDraugrReleasedCount.SetValue(_arcDraugrReleasedCount.GetValue() + 1.0)
	
	_arcGuardianDraugrSceneQuest.UpdateCurrentInstanceGlobal(_arcDraugrReleasedCount)
	
	_arcGDSQuestDraugrReleasedMSG.Show()
EndFunction

Function OnLoadGame()
	((Draugr01.GetReference() as Actor) as _arcChainDraugrRefScript).OnLoadGame()
	((Draugr02.GetReference() as Actor) as _arcChainDraugrRefScript).OnLoadGame()
	((Draugr03.GetReference() as Actor) as _arcChainDraugrRefScript).OnLoadGame()
	((Draugr04.GetReference() as Actor) as _arcChainDraugrRefScript).OnLoadGame()
	((Draugr05.GetReference() as Actor) as _arcChainDraugrRefScript).OnLoadGame()
	((Draugr06.GetReference() as Actor) as _arcChainDraugrRefScript).OnLoadGame()
	((Draugr07.GetReference() as Actor) as _arcChainDraugrRefScript).OnLoadGame()
EndFunction
