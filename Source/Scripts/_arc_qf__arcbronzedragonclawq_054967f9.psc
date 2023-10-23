;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname _arc_QF__arcBronzeDragonClawQ_054967F9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonClaw
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonClaw Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;the player has opened the puzzle door

;remove filter activation perk so the player can now
;activate the puzzle door again if it is ever needed
PlayerRef.RemovePerk(_arcBDCQuestPerk)

;stop this quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Startup Stage
;the player has forged the claw

;remove the dragon claw that the player already has
PlayerRef.RemoveItem(_arcBronzeDragonClaw, 1, True)

;add the dragon claw created by this quest to the player's inventory
;this way, it is guaranteed it is an object reference, and it is a quest
;object that cannot be dropped
ObjectReference DragonClawRef = Alias_DragonClaw.GetReference()
PlayerRef.AddItem(DragonClawRef, 1, True)
DragonClawRef.EnableNoWait()

;place explosions at player
PlayerRef.PlaceAtMe(_arcBronzeExplosion01)
PlayerRef.PlaceAtMe(_arcBronzeExplosion02)

;play explosion sound
_arcBronzeExplosionSFX.Play(PlayerRef)

;add filter activation perk so the player cannot open the door until
;the guardian has finished force greeting after the flashback
PlayerRef.AddPerk(_arcBDCQuestPerk)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment 

Sound Property _arcBronzeExplosionSFX  Auto  

Actor Property PlayerRef  Auto  

Form Property _arcBronzeDragonClaw  Auto  

Perk Property _arcBDCQuestPerk  Auto  

Explosion Property _arcBronzeExplosion01  Auto  

Explosion Property _arcBronzeExplosion02  Auto  
