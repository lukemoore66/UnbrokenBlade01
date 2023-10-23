;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 27
Scriptname _arc_QF__arcCalderWineQuest_0584063D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Calder
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Calder Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;calder has wine and gives to player

;charge the player
PlayerRef.RemoveItem(Gold001, 150)

;decrement wine count
_arcDialogueQuest.CalderWineWineCount -= 1

;give player wine
PlayerRef.AddItem(_arcCalderWineFood)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;calder gives wine automatically

;increment dialogue stage
_arcDialogueQuest.CalderWineDialogueStage = 1

;decrement wine count
_arcDialogueQuest.CalderWineWineCount -= 1

;force player to drink wine
PlayerRef.AddItem(_arcCalderWineFood)
PlayerRef.EquipItem(_arcCalderWineFood, abSilent = True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property _arcCalderWineFood  Auto  

Actor Property PlayerRef  Auto  

Form Property Gold001  Auto  

_arcDialogueQuestScript Property _arcDialogueQuest  Auto  
