ScriptName _arcQuestScript Extends Quest Conditional

Int Property CurrentObjective = -1 Auto Conditional Hidden

Actor Property PlayerRef Auto
PlayerWerewolfChangeScript Property PlayerWerewolfQuest Auto
DLC1PlayerVampireChangeScript Property DLC1PlayerVampireQuest Auto
Faction Property _arcThalmorFaction Auto
Faction Property _arcThalmorEnemyFaction Auto
Keyword Property _arcArcadiaRingQuestKeyword Auto
Quest Property _arcArcadiaRingQuest Auto

Function SetObjectiveDisplayed(int aiObjective, bool abDisplayed = true, bool abForce = false)
	CurrentObjective = aiObjective
	
	;always wait so other objectives do not display simultaneously
	Utility.Wait(0.025)
	
	Parent.SetObjectiveDisplayed(aiObjective, abDisplayed, abForce)
EndFunction

Function SetRingOwner(ObjectReference akNewOwnerRef = None)
	;wait, because SetRingContainer() / SetRingOwner() may have been called shortly beforehand
	;_arcArcadiaRingQuest quest will always execute very quickly
	While _arcArcadiaRingQuest.IsRunning()
		Utility.Wait(0.01)
	EndWhile
	
	_arcArcadiaRingQuestKeyword.SendStoryEventAndWait(akRef1 = akNewOwnerRef)
EndFunction

Function SetRingContainer(ObjectReference akNewContainerRef)
	;wait, because SetRingContainer() / SetRingOwner() may have been called shortly beforehand
	;_arcArcadiaRingQuest quest will always execute very quickly
	While _arcArcadiaRingQuest.IsRunning()
		Utility.Wait(0.01)
	EndWhile
	
	_arcArcadiaRingQuestKeyword.SendStoryEventAndWait(akRef2 = akNewContainerRef)
EndFunction

Function CancelTransformations()
	If PlayerWerewolfQuest.IsRunning() == True
		PlayerWerewolfQuest.ShiftBack()
	EndIf

	If DLC1PlayerVampireQuest.IsRunning() == True
		DLC1PlayerVampireQuest.ShiftBack()
	EndIf
EndFunction

Function ForceDismount()
	;animation takes 1.4667 to play (paired_dismount.hkx)
	While PlayerRef.IsOnMount()
		PlayerRef.Dismount()
		Utility.Wait(0.5)
	EndWhile
EndFunction

Function SetThalmorEnemy(Bool abEnemy)
	;false = neutral, so reverse logic
	abEnemy = !abEnemy
	
	_arcThalmorFaction.SetEnemy(_arcThalmorEnemyFaction, abEnemy, abEnemy)
EndFunction
