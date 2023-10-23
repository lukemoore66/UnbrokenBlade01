ScriptName _arcTavernTrespassEmployeeAliasScript Extends ReferenceAlias

Actor Property PlayerRef Auto
Faction Property _arcTavernTrespassFaction Auto
Quest Property _arcBrawlQuest Auto

Event OnCombatStateChanged(Actor akTargetRef, Int aeCombatState)
	If aeCombatState != 1
		Return
	EndIf
	
	Actor kTargetRef = akTargetRef as Actor
	
	If !kTargetRef.IsInFaction(_arcTavernTrespassFaction)
		Return
	EndIf
	
	If !_arcBrawlQuest.IsRunning()
		(GetReference() as Actor).SendTrespassAlarm(kTargetRef)
	EndIf
EndEvent

; 4	Lover
; 3	Ally
; 2	Confidant
; 1	Friend
; 0	Acquaintance
;-1	Rival
;-2	Foe
;-3	Enemy
;-4	Archnemesis
Function TrySetPCRelationshipRank(Int aiRank = 0)
	Actor kActorRef = GetReference() as Actor
	
	If !kActorRef
		Return
	EndIf
	
	kActorRef.SetRelationshipRank(PlayerRef, aiRank)
EndFunction
