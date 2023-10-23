ScriptName _arcForgeFirePlateScript Extends ObjectReference

Actor Property PlayerRef Auto
Int TrapLevel
Hazard fireHazard
ObjectReference myHazardRef
Bool weaponResolved = false

Event OnCellAttach()
	TrapLevel = PlayerRef.GetLevel()
EndEvent

Auto State Inactive
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Active")
		
		If WeaponResolved == False
			ResolveLeveledHazard()
		EndIf
		
		myHazardRef = PlaceAtMe(fireHazard, 1)
		
		Utility.Wait(3.0)
		
		If myHazardRef
			myHazardRef.Disable()
			myHazardRef.Delete()
		EndIf
		
		GoToState("Inactive")
	EndEvent
EndState

State Active
	;do nothing
EndState

;=============================================
;copypasta from TrapFirePlate.psc

int property LvlThreshold1 auto
int property LvlThreshold2 auto
int property LvlThreshold3 auto
int property LvlThreshold4 auto
int property LvlThreshold5 auto
hazard property TrapFirePlateFXHaz01 auto
hazard property TrapFirePlateFXHaz02 auto
hazard property TrapFirePlateFXHaz03 auto
hazard property TrapFirePlateFXHaz04 auto
hazard property TrapFirePlateFXHaz05 auto
hazard property TrapFirePlateFXHaz06 auto

Function ResolveLeveledHazard ()
	;Trace("ResolveLeveledWeapon")
	int damageLevel
	damageLevel = CalculateEncounterLevel(TrapLevel)
	
	; weapon lvlWeaponM = LvlWeaponM1
	; weapon lvlWeaponL = LvlWeaponL1
	; weapon lvlWeaponR = LvlWeaponR1
	hazard LvlHazard = TrapFirePlateFXHaz01
	
	if (damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2)
		; lvlWeaponM = LvlWeaponM2
		; lvlWeaponL = LvlWeaponL2
		; lvlWeaponR = LvlWeaponR2
		LvlHazard = TrapFirePlateFXHaz02
		;Trace("damage threshold =")
		;Trace("2")
	endif
	if (damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3)
		;lvlWeaponM = LvlWeapon3
		LvlHazard = TrapFirePlateFXHaz03
		;Trace("damage threshold =")
		;Trace("3")
	endif
	if (damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4)
		;lvlWeaponM = LvlWeapon4
		LvlHazard = TrapFirePlateFXHaz04
		;Trace("damage threshold =")
		;Trace("4")
	endif
	if (damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5)
		;lvlWeaponM = LvlWeapon5
		LvlHazard = TrapFirePlateFXHaz05
		;Trace("damage threshold =")
		;Trace("5")
	endif
	if (damageLevel > LvlThreshold5)
		;lvlWeaponM = LvlWeapon6
		LvlHazard = TrapFirePlateFXHaz06
		;Trace("damage threshold =")
		;Trace("6")
	endif
	
	; ballistaWeaponM = lvlWeaponM
	; ballistaWeaponL = lvlWeaponL
	; ballistaWeaponR = lvlWeaponR
	fireHazard = LvlHazard
	weaponResolved = True
EndFunction
