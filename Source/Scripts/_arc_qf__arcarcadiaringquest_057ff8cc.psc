;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname _arc_QF__arcArcadiaRingQuest_057FF8CC Extends Quest Hidden

;BEGIN ALIAS PROPERTY RingOwner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RingOwner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lockbox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lockbox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RingOwnersRing
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RingOwnersRing Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MysteriousRing
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MysteriousRing Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NewContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MoveRing
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MoveRing Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;if we are moving the ring and
;the new container is the player

;show the message
_arcARQuestRingAddedMSG.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;stop the quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;we are moving the ring

;we must store the current container on the lockbox
;as it cannot be stored on the ring itself
ObjectReference CurrentContainerRef = (Alias_Lockbox.GetReference() as _arcTelishaLockboxRefScript).CurrentContainerRef

;move the ring
CurrentContainerRef.RemoveItem(Alias_MoveRing.GetReference(), 1, True, Alias_NewContainer.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property _arcARQuestRingAddedMSG  Auto  
