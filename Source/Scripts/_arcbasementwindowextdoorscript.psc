ScriptName _arcBasementWindowExtDoorScript Extends ObjectReference

Actor Property PlayerRef Auto
Perk Property _arcBasementWindowExtDoorPerk Auto

;there is no guarantee that events will fire in order when leaving and entering cells
;therefore, put a delay on OnCellAttach() and add the perk again this way,
;OnCellDetach() has time to execute beforehand.
Event OnCellAttach()
	PlayerRef.AddPerk(_arcBasementWindowExtDoorPerk)
	RegisterForSingleUpdate(1.0)
EndEvent

Event OnUpdate()
	PlayerRef.AddPerk(_arcBasementWindowExtDoorPerk)
EndEvent

Event OnCellDetach()	
	PlayerRef.RemovePerk(_arcBasementWindowExtDoorPerk)
EndEvent
