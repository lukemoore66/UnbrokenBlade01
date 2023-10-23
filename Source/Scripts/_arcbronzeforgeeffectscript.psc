ScriptName _arcBronzeForgeEffectScript Extends ActiveMagicEffect

ObjectReference Property PlayerRef Auto
VisualEffect Property FXCameraAttachEmbersHeavyEffects Auto 

Event OnEffectStart(Actor akTarget, Actor akCaster)
	FXCameraAttachEmbersHeavyEffects.Play(PlayerRef)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	FXCameraAttachEmbersHeavyEffects.Stop(PlayerRef)
EndEvent
