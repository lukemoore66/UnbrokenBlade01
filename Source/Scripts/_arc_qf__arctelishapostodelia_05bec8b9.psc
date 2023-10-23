;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 34
Scriptname _arc_QF__arcTelishaPostOdelia_05BEC8B9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ShrineEnableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShrineEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmuletPlaque
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmuletPlaque Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lockbox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lockbox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JulienneLylvieve
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JulienneLylvieve Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LetterNotFavoured
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LetterNotFavoured Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faida
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Faida Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Beirand
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Beirand Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sketch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sketch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ValidActor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ValidActor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Valronis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Valronis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Telisha
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Telisha Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sayma
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sayma Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BitsAndPiecesCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BitsAndPiecesCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LetterFavoured
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LetterFavoured Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BitsAndPieces
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BitsAndPieces Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;if telisha is dead and
;she was not killed by valronis and
;she had her sketch or
;she had her amulet

;enable the shrine marker
Alias_ShrineEnableMarker.GetReference().Enable(False)

;go to stage 30
;this will place the amulet and sketch as needed
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;put telisha's sketch on the table if it is in the lockbox

;remove sketch from the lockbox and delete it
Alias_Lockbox.GetReference().RemoveItem(_arcTelishaSketch)

;enable the copy at the shrine
Alias_Sketch.GetReference().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;if there are no valid actors to give the letter

;enable the letter
Alias_Letter.GetReference().EnableNoWait()

;complete and stop the quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;if telisha is dead and
;she was not killed by valronis and
;she doesn't have her sketch and
;she doesn't have her amulet

;stop the quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;put telisha's amulet on the table if it was still on her

;remove it from telisha
Alias_Telisha.GetReference().RemoveItem(_arcTelishaAmulet)

;place a new copy at shrine
ObjectReference AmuletRef = Alias_AmuletPlaque.GetReference().PlaceAtMe(_arcTelishaAmulet, 1, True, True)

;let the plaque know that it has an amulet mounted
(Alias_AmuletPlaque.GetReference() as _arcTelishaPlaqueActScript).AmuletRef =  AmuletRef
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;stop the quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;if telisha is alive

;move telisha to bits and pieces and disable her
;this stops her lantern from being lit
;she has now gone into hiding
Telisha.TryMoveTo(Alias_BitsAndPiecesCenterMarker.GetReference(), False)

;go to stage 10, this will allow the relevant NPCs to hand out the letter
;or it will place the letter in the four shields if no valid npcs exist

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
;complete and stop the quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;this stage is set at the end of _arcTelishaPostOdeliaQuestLetterHolderBranchTopic
;once the letter holder has finished talking to the player

;enable the letter and give it to the player
ObjectReference LetterRef = Alias_Letter.GetReference()
LetterRef.EnableNoWait()
PlayerRef.AddItem(LetterRef)

;stop the quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Form Property _arcTelishaSketch  Auto  

Form Property _arcTelishaAmulet  Auto  

ObjectReference Property PlayerRef  Auto  

_arcQuestActorAliasScript Property Telisha Auto
