ScriptName _arcSnowIceWraithRefScript Extends ObjectReference

Explosion Property _arcSnowIceWraithExplosion Auto

Event OnDeath(Actor akKiller)
	PlaceAtMe(_arcSnowIceWraithExplosion)
EndEvent
