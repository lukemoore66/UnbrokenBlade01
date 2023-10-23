ScriptName _arcFBQ003PlayerAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
Form Property _arcBattleExplosionDustDropperAct Auto
Form Property _arcBattleExplosionSoundAct Auto

Auto State Inactive
	;do nothing
EndState

State Stage10
	Event OnBeginState()
		RegisterForSingleUpdate(0.1)
	EndEvent

	Event OnCellLoad()
		OnUpdate()
	EndEvent
	
	Event OnUpdate()
		;shake camera / controller 30% of the time
		If Utility.RandomInt(0, 9) < 3
			Game.ShakeCamera(PlayerRef, Utility.RandomFloat(0.05, 0.2), Utility.RandomFloat(0.2, 3.0))
			Game.ShakeController(Utility.RandomFloat(0.1, 0.7), Utility.RandomFloat(0.1, 0.7), Utility.RandomFloat(0.1, 1.0))
		EndIf
	
		;play explosion 50% of the time
		If Utility.RandomInt(0, 9) < 4
			;deletes itself once it has finished playing its sound
			ObjectReference SoundActRef = PlayerRef.PlaceAtMe(_arcBattleExplosionSoundAct)
			
			;this moves the sound randomly around the player
			SoundActRef.MoveTo(PlayerRef, Utility.RandomFloat(-128.0, 128.0), Utility.RandomFloat(-128.0, 128.0), \
			Utility.RandomFloat(-128.0, 128.0))
			
			SoundActRef.Activate(SoundActRef)
		EndIf
		
		;drop dust 50% of the time
		If Utility.RandomInt(0, 9) < 4
			;deletes itself once it has finished dropping dust
			ObjectReference DustDropperActRef = PlayerRef.PlaceAtMe(_arcBattleExplosionDustDropperAct)
			
			;this moves the dust dropper in front of the player within 512.0 units
			DustDropperActRef.MoveTo(PlayerRef,\
			Utility.RandomFloat(256.0, 512.0) * (Math.Sin(PlayerRef.GetAngleZ() + Utility.RandomFloat(-45.0, 45.0))),\
			Utility.RandomFloat(256.0, 512.0) * (Math.Cos(PlayerRef.GetAngleZ() + Utility.RandomFloat(-45.0, 45.0))),\
			PlayerRef.GetHeight() + Utility.RandomFloat(128.0, 256.0),\
			False)
			
			DustDropperActRef.Activate(DustDropperActRef)
		EndIf
		
		RegisterForSingleUpdate(Utility.RandomFloat(0.1, 4.0))
	EndEvent
	
	Event OnEndState()
		UnregisterForUpdate()
	EndEvent
EndState
