;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname _arc_TIF__05776C8B Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
_arcDialogueQuest.VictimDialogueStatus = 4

If akSpeaker.GetItemCount(_arcTelishaAmulet)
    ;the following loads the amulet's 3D, making it a valid item within the world
    ;and the added item message is shown to the player
    
    akSpeaker.RemoveItem(_arcTelishaAmulet)
    ObjectReference AmuletRef = PlayerRef.PlaceAtMe(_arcTelishaAmulet, abInitiallyDisabled = True)
    AmuletRef.SetPosition(PlayerRef.X, PlayerRef.Y, -1024.0)
    AmuletRef.Enable(False)
    PlayerRef.AddItem(AmuletRef)
    
    Return
EndIf

PlayerRef.AddItem(Gold001, 500)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcDialogueQuestScript Property _arcDialogueQuest  Auto  

ObjectReference Property PlayerRef  Auto  

Form Property _arcTelishaAmulet  Auto  

Form Property Gold001  Auto  
