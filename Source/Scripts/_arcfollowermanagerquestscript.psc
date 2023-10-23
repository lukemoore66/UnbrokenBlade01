ScriptName _arcFollowerManagerQuestScript Extends Quest 

_arcFMQuestActorAliasScript Property Follower01 Auto
_arcFMQuestActorAliasScript Property Follower02 Auto
_arcFMQuestActorAliasScript Property Follower03 Auto
_arcFMQuestActorAliasScript Property Follower04 Auto
_arcFMQuestActorAliasScript Property Follower05 Auto
_arcFMQuestActorAliasScript Property Follower06 Auto
_arcFMQuestActorAliasScript Property Follower07 Auto
_arcFMQuestActorAliasScript Property Follower08 Auto
_arcFMQuestActorAliasScript Property Commanded01 Auto
_arcFMQuestActorAliasScript Property Commanded02 Auto
_arcFMQuestActorAliasScript Property Commanded03 Auto
_arcFMQuestActorAliasScript Property Commanded04 Auto
_arcFMQuestActorAliasScript Property Commanded05 Auto
_arcFMQuestActorAliasScript Property Commanded06 Auto
_arcFMQuestActorAliasScript Property Commanded07 Auto
_arcFMQuestActorAliasScript Property Commanded08 Auto

Function KnockOutFollowers(Bool abKnockout = True)
	If !IsRunning()
		Return
	EndIf
	
	Follower01.TryKnockOut(abKnockout)
	Follower02.TryKnockOut(abKnockout)
	Follower03.TryKnockOut(abKnockout)
	Follower04.TryKnockOut(abKnockout)
	Follower05.TryKnockOut(abKnockout)
	Follower06.TryKnockOut(abKnockout)
	Follower07.TryKnockOut(abKnockout)
	Follower08.TryKnockOut(abKnockout)
EndFunction

Bool Function TeleportActors(ObjectReference akDestRef)
	Stop()
	
	If !Start()
		Return False
	EndIf
	
	Follower01.TryTeleport(akDestRef)
	Follower02.TryTeleport(akDestRef)
	Follower03.TryTeleport(akDestRef)
	Follower04.TryTeleport(akDestRef)
	Follower05.TryTeleport(akDestRef)
	Follower06.TryTeleport(akDestRef)
	Follower07.TryTeleport(akDestRef)
	Follower08.TryTeleport(akDestRef)
	
	Commanded01.TryTeleport(akDestRef)
	Commanded02.TryTeleport(akDestRef)
	Commanded03.TryTeleport(akDestRef)
	Commanded04.TryTeleport(akDestRef)
	Commanded05.TryTeleport(akDestRef)
	Commanded06.TryTeleport(akDestRef)
	Commanded07.TryTeleport(akDestRef)
	Commanded08.TryTeleport(akDestRef)
	
	Return True
EndFunction

Function StopCombatActors()
	If !IsRunning()
		Return
	EndIf
	
	Follower01.TryStopCombat()
	Follower02.TryStopCombat()
	Follower03.TryStopCombat()
	Follower04.TryStopCombat()
	Follower05.TryStopCombat()
	Follower06.TryStopCombat()
	Follower07.TryStopCombat()
	Follower08.TryStopCombat()
	
	Commanded01.TryStopCombat()
	Commanded02.TryStopCombat()
	Commanded03.TryStopCombat()
	Commanded04.TryStopCombat()
	Commanded05.TryStopCombat()
	Commanded06.TryStopCombat()
	Commanded07.TryStopCombat()
	Commanded08.TryStopCombat()
EndFunction

Function DisableFollowers()
	If !IsRunning()
		Return
	EndIf
	
	Follower01.TryToDisable()
	Follower02.TryToDisable()
	Follower03.TryToDisable()
	Follower04.TryToDisable()
	Follower05.TryToDisable()
	Follower06.TryToDisable()
	Follower07.TryToDisable()
	Follower08.TryToDisable()
EndFunction

Function RemoveCommanded()
	If !IsRunning()
		Return
	EndIf
	
	Commanded01.TryRemove()
	Commanded02.TryRemove()
	Commanded03.TryRemove()
	Commanded04.TryRemove()
	Commanded05.TryRemove()
	Commanded06.TryRemove()
	Commanded07.TryRemove()
	Commanded08.TryRemove()
EndFunction

Function MoveFollowers(ObjectReference akDestinationRef, Bool abEnable = True)
	If !IsRunning()
		Return
	EndIf
	
	Follower01.TryMoveTo(akDestinationRef, abEnable)
	Follower02.TryMoveTo(akDestinationRef, abEnable)
	Follower03.TryMoveTo(akDestinationRef, abEnable)
	Follower04.TryMoveTo(akDestinationRef, abEnable)
	Follower05.TryMoveTo(akDestinationRef, abEnable)
	Follower06.TryMoveTo(akDestinationRef, abEnable)
	Follower07.TryMoveTo(akDestinationRef, abEnable)
	Follower08.TryMoveTo(akDestinationRef, abEnable)
EndFunction

Function MoveCommanded(ObjectReference akDestinationRef, Bool abEnable = True)
	If !IsRunning()
		Return
	EndIf
	
	Commanded01.TryMoveTo(akDestinationRef, abEnable)
	Commanded02.TryMoveTo(akDestinationRef, abEnable)
	Commanded03.TryMoveTo(akDestinationRef, abEnable)
	Commanded04.TryMoveTo(akDestinationRef, abEnable)
	Commanded05.TryMoveTo(akDestinationRef, abEnable)
	Commanded06.TryMoveTo(akDestinationRef, abEnable)
	Commanded07.TryMoveTo(akDestinationRef, abEnable)
	Commanded08.TryMoveTo(akDestinationRef, abEnable)
EndFunction

Function EnableFollowers()
	If !IsRunning()
		Return
	EndIf
	
	Follower01.TryToEnable()
	Follower02.TryToEnable()
	Follower03.TryToEnable()
	Follower04.TryToEnable()
	Follower05.TryToEnable()
	Follower06.TryToEnable()
	Follower07.TryToEnable()
	Follower08.TryToEnable()
EndFunction

Function DisableActors()
	If !IsRunning()
		Return
	EndIf
	
	DisableFollowers()
	
	RemoveCommanded()
EndFunction
