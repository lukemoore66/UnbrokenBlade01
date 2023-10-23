ScriptName _arcDispelRuneTrigRefScript Extends ObjectReference

Actor Property PlayerRef Auto
Spell Property _arcDispelRuneSpell Auto
Explosion Property _arcDispelRuneExplosion Auto
Light Property DLC01IdealMasterCrystalLight Auto
Sound Property _arcDispelRuneExplosionBuildSFX Auto
Sound Property AMBRumbleShake Auto
Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto

State Complete
	;do nothing
EndState

Auto State Waiting
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, \
		Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		
		Spell kSourceSpell = akSource as Spell
		
		If !kSourceSpell
			Return
		EndIf
		
		If akSource != _arcDispelRuneSpell
			Return
		EndIf
		
		GoToState("Complete")
		
		PlayerRef.UnequipSpell(_arcDispelRuneSpell, 0)
		PlayerRef.UnequipSpell(_arcDispelRuneSpell, 1)
		PlayerRef.RemoveSpell(_arcDispelRuneSpell)
		
		ObjectReference MarkerRef = GetlinkedRef(LinkCustom01)
		ObjectReference LightRef = MarkerRef.PlaceAtMe(DLC01IdealMasterCrystalLight)
		
		Game.ShakeCamera(PlayerRef, 0.25, 5.0)
		
		;shake for 5.4 secs (duration of _arcDispelRuneExplosionBuildSFX)
		Game.ShakeController(0.33, 0.33, 5.0)
		
		;disable rune loop sound marker
		GetlinkedRef(LinkCustom02).DisableNoWait()
		
		_arcDispelRuneExplosionBuildSFX.PlayAndWait(MarkerRef)
		
		MarkerRef.PlaceAtMe(_arcDispelRuneExplosion)
		
		;stagger player
		MarkerRef.KnockAreaEffect(1.0, 1024.0)
		
		;play rumble
		AMBRumbleShake.Play(MarkerRef)
		
		LightRef.Delete()
		
		GetlinkedRef().EnableNoWait()
		
		;turn off the candle if it is on
		_arcFireCandleActScript CandleRef = GetLinkedRef(LinkCustom03) as _arcFireCandleActScript
		
		If CandleRef.CandleOn
			CandleRef.Activate(PlayerRef)
		EndIf
	EndEvent
EndState
