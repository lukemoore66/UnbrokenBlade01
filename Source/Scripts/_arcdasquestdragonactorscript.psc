ScriptName _arcDASQuestDragonActorScript Extends DragonActorScript

;this script will throw some harmless errors from its parent script
;to the papyrus log. they can be ignored, it is better to keep them for compatibility

Actor Property PlayerRef Auto
Quest Property _arcDragonAttackSceneQuest Auto
Location Property DragonBridgeLocation Auto

;new state to override functionality from parent script (DragonActorScript)
State DeadAndWaiting
	;New event to override functionality from parent script (DragonActorScript)
	Event OnBeginState()
		BlockActivation(True)
		
		While GetDistance(PlayerRef) > DeathFXRange
			Utility.Wait(1.0)
		EndWhile

		GoToState("DeadDisintegrated")
		
		_arcDeathSequence(Self)
	EndEvent
EndState

;new version of OnLocationChange() function as defined in DragonActorScript
;manually using DragonBridgeLocation instead of akNewLoc parameter for RegisterDragonAtaack
;this is because akNewLoc parameter has a value of None at this point
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	WI.RegisterDragonAttack(DragonBridgeLocation, Self)
	
	If !IsDead() && IsGhost()
		SetGhost(False)
	EndIf
EndEvent

;new version of DeathSequence function from MQKillDragonScript attached to MQKillDragon quest
Function _arcDeathSequence(Actor akDragonRef)
	;set stage for dragon soul absorb start
	_arcDragonAttackSceneQuest.SetStage(50)
	
	;cast _MQKillDragon from parent script
	MQKillDragonScript _arcMQKillDragon  = MQKillDragon as MQKillDragonScript

	;Dragon wings particles bits
	_arcMQKillDragon.FXDragonDeathLHandBits.Play(akDragonRef, 12.0)
	_arcMQKillDragon.FXDragonDeathRHandBits.Play(akDragonRef, 12.0)
	
	;clear any arrows that may have been stuck in dragon	
	akDragonRef.ClearExtraArrows()
	
	;ghost the dragon so you can't hit him
	akDragonRef.SetGhost(True)	
	
	;World Interaction Function
	_arcMQKillDragon.WI.PlayerIsCurrentlyAbsorbingPower(akDragonRef)
	_arcMQKillDragon.bIsAbsorbing = True
		
	;Start effect shader decorating holes in the base skin
	_arcMQKillDragon.DragonHolesFXS.Play(akDragonRef)
	
	;Play imagespace modifier which is timed to match sequence.
	_arcMQKillDragon.DragonPowerAbsorbISM.Apply()

	;Sound of dragon carcass first bursts into flames until the flames die off. Must be turned off
	Int SoundInstanceFireID = _arcMQKillDragon.NPCDragonDeathSequenceFireLPM.Play(akDragonRef) 
	
	Utility.Wait(1.5)
	
	;Small bits rising from dragon fx shader.
	_arcMQKillDragon.DragonHolesBitsLiteFXS.Play(akDragonRef)
	
	Utility.Wait(1.0)
	
	;Bigger bits rising from dragon fx shader.
	_arcMQKillDragon.DragonHolesBitsFXS.Play(akDragonRef)
	
	Utility.Wait(4.0)
	
	;Magic particles on wings
	_arcMQKillDragon.FXDragonDeathRHandFire.Play(akDragonRef, 12.0)
	_arcMQKillDragon.FXDragonDeathLHandFire.Play(akDragonRef, 12.0)
	
	Utility.Wait(1.0)
	
	;magic fire fx shader
	_arcMQKillDragon.DragonHolesMagicFXS.Play(akDragonRef)
	_arcMQKillDragon.DragonHolesMagicFXS.Stop(akDragonRef)

	Utility.Wait(0.25)
	
	;StopDragon bits fxs
	_arcMQKillDragon.DragonHolesBitsFXS.Stop(akDragonRef)
	_arcMQKillDragon.DragonHolesBitsLiteFXS.Stop(akDragonRef)		
	
	;Stop holes fx shader now that main dragon skin is un-worn
	_arcMQKillDragon.DragonHolesFXS.Stop(akDragonRef)

	Utility.Wait(1.8)
	
	;unequip invisible art
	If akDragonRef.IsEquipped(_arcMQKillDragon.DragonBloodHeadFXArmor) == True
		akDragonRef.UnEquipItem(_arcMQKillDragon.DragonBloodHeadFXArmor)
	EndIf
	If akDragonRef.IsEquipped(_arcMQKillDragon.DragonBloodTailFXArmor) == True
		akDragonRef.UnEquipItem(_arcMQKillDragon.DragonBloodTailFXArmor)
	EndIf
	If akDragonRef.IsEquipped(_arcMQKillDragon.DragonBloodWingLFXArmor) == True
		akDragonRef.UnEquipItem(_arcMQKillDragon.DragonBloodWingLFXArmor)
	EndIf
	If akDragonRef.IsEquipped(_arcMQKillDragon.DragonBloodWingRFXArmor) == True
		akDragonRef.UnEquipItem(_arcMQKillDragon.DragonBloodWingRFXArmor)
	EndIf
	
	;display dragon absorb effect art. One part on dragon one part on player.
	_arcMQKillDragon.DragonAbsorbEffect.Play(akDragonRef, 8.0, PlayerRef)
	_arcMQKillDragon.DragonAbsorbManEffect.Play(PlayerRef, 8.0, akDragonRef)
	
	;Sounds for when the wispy particles being to fly at the player.
	_arcMQKillDragon.NPCDragonDeathSequenceWind.Play(akDragonRef) 
	_arcMQKillDragon.NPCDragonDeathSequenceExplosion.Play(akDragonRef) 
	
	Utility.Wait(0.1)
		
	;On man power absorb effect shader.
	_arcMQKillDragon.DragonPowerAbsorbFXS.Play(PlayerRef)

	Utility.Wait(4.0)

	;Stop fx shader on player showing power absorb.	
	_arcMQKillDragon.DragonPowerAbsorbFXS.Stop(PlayerRef)
	
	;End sound of dragon carcass bursting into flames.
	Sound.StopInstance(SoundInstanceFireID)
	
	;add lingering smoke and glow to dragon carcass.
	_arcMQKillDragon.DragonHolesSmokeFXS.Play(akDragonRef)	
	
	;Start sound for smoldering dragon
	Int SoundInstanceSmolderID = _arcMQKillDragon.NPCDragonDeathSequenceSmolderLPM.Play(akDragonRef) 

	Utility.Wait(2.0)

	;increment dragon count
	;_arcMQKillDragon.DragonsAbsorbed.value = _arcMQKillDragon.DragonsAbsorbed.value + 1

	;add dragonsoul point to player
	;PlayerRef.ModActorValue("dragonsouls", _arcMQKillDragon.VoicePointsReward)
	
	;turn off effect shaders for smoldering carcass
	_arcMQKillDragon.DragonHolesSmokeFXS.Stop(akDragonRef)
	
	; Get rid of art attached to dragon and player showing streaming magic.
	_arcMQKillDragon.DragonAbsorbEffect.Stop(akDragonRef)
	_arcMQKillDragon.DragonAbsorbManEffect.Stop(PlayerRef)

	Utility.Wait(2.0)

	;Stop smoldering sound
	Sound.StopInstance(SoundInstanceSmolderID)

	; put dragon in faction so other quests know player has absorbed power
	akDragonRef.AddtoFaction(_arcMQKillDragon.MQKillDragonFaction)
	
	;Stop light emitting magic shader on dragon
	_arcMQKillDragon.DragonHolesLightFXS.Stop(akDragonRef)
	
	;World interaction function
	_arcMQKillDragon.WI.PlayerIsDoneAbsorbingPower(akDragonRef)
	
	_arcMQKillDragon.bIsAbsorbing = False
	
	;set stage for dragon soul absorb finish
	_arcDragonAttackSceneQuest.SetStage(60)
EndFunction
