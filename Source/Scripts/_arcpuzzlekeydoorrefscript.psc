ScriptName _arcPuzzleKeyDoorRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto

Function Rumble(Float akPower = 1.0, Float afDuration = 1.0, Float afFalloff = 768.0)
	Float PlayerDist = GetDistance(PlayerRef)
	
	If PlayerDist < afFalloff
		Float Intensity = (1.0 - (PlayerDist / afFalloff))
		Intensity = Intensity * akPower
				
		Game.ShakeCamera(PlayerRef, Intensity * 0.5, afDuration)
		Game.ShakeController(Intensity, Intensity, afDuration)
	EndIf
EndFunction
