ScriptName _arcFMQuestActorAliasScript Extends _arcQuestActorAliasScript

Spell Property _arcKnockOutFollowerSpell Auto
Spell Property _arcTeleportSpell Auto

Function TryKnockOut(Bool abKnockOut = True)
	Actor kActor = GetReference() as Actor
	
	If !kActor
		Return
	EndIf
	
	If abKnockOut
		kActor.AddSpell(_arcKnockOutFollowerSpell)
		Return
	EndIf
	
	kActor.RemoveSpell(_arcKnockOutFollowerSpell)
EndFunction

Function TryTeleport(ObjectReference akDestRef)
	Actor kActor = GetReference() as Actor
	
	If !kActor
		Return
	EndIf
	
	If !akDestRef
		Return
	EndIf
	
	_arcTeleportSpell.Cast(akDestRef, kActor)
	
	;wait here to make sure the spell has been fully cast
	;before passing in teleport marker via activation
	Utility.Wait(0.1)
	
	kActor.Activate(akDestRef)
EndFunction
