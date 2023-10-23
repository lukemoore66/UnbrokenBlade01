ScriptName _arcHangActorEffectScript Extends ActiveMagicEffect

;CasterRef will be trashed automatically when the effect ends
Actor CasterRef

Event OnEffectStart(Actor akTarget, Actor akCaster)
	CasterRef = akCaster
EndEvent

Event OnPlayerLoadGame()
	;this essentially sends this event to the caster
	;_arcHangRefScript is the parent script of the caster's hanging script
	;and this function handles all of the casting into the respective
	;child scripts before manually calling the OnLoad() event for that child script
	(CasterRef as _arcHangRefScript).OnPCLoadGame()
EndEvent
