;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname _arc_QF__arcCoinTossQuest_0558F726 Extends Quest Hidden

;BEGIN ALIAS PROPERTY InnkeeperOther
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnkeeperOther Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnkeeperTelisha
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnkeeperTelisha Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurrentLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CurrentLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CoinTossChestExisting
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CoinTossChestExisting Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CoinTossChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CoinTossChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CoinTossChestNew
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CoinTossChestNew Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerStart
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerStart Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Coin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Coin Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;shut down stage

;tidy up any uneeded references
Alias_Coin.GetReference().Delete()
Alias_MarkerStart.GetReference().Delete()
Alias_MarkerA.GetReference().Delete()
Alias_MarkerB.GetReference().Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE _arcCoinTossQuestScript
Quest __temp = self as Quest
_arcCoinTossQuestScript kmyQuest = __temp as _arcCoinTossQuestScript
;END AUTOCAST
;BEGIN CODE
;Startup Stage

;if our opponent is telisha, make sure the quest script knows
kmyQuest.IsTelisha = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE _arcCoinTossQuestScript
Quest __temp = self as Quest
_arcCoinTossQuestScript kmyQuest = __temp as _arcCoinTossQuestScript
;END AUTOCAST
;BEGIN CODE
;Startup Stage

;if our opponent is not telisha, make sure the quest script knows
kmyQuest.IsTelisha = False
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
