ScriptName _arcLoopImodMagicEffectScript Extends ActiveMagicEffect

Actor Property PlayerRef Auto

ImagespaceModifier Property LoopInImod Auto
ImagespaceModifier Property LoopImod Auto
ImagespaceModifier Property LoopOutImod Auto

Bool Property Active = True Auto Hidden
Float Property TimeIn Auto
Float Property TimeLoop Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	LoopInImod.Apply()
	
	Utility.Wait(TimeIn)
	
	If !Active
		LoopInImod.PopTo(LoopOutImod)
		Return
	EndIf
	
	LoopInImod.PopTo(LoopImod)
	Utility.Wait(TimeLoop)

	While Active
		LoopImod.PopTo(LoopImod)
		Utility.Wait(TimeLoop)
	EndWhile
	
	LoopImod.PopTo(LoopOutImod)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Active = False
EndEvent
