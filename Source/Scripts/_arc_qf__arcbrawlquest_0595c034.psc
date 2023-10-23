;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 67
Scriptname _arc_QF__arcBrawlQuest_0595C034 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Opponent
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Opponent Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OpponentFriend
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OpponentFriend Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;start up stage
;always run this fragment

;remove player's weapons
PlayerRef.EquipItem(Unarmed, abSilent = True)

;get opponent ref
Actor OpponentRef = Alias_Opponent.GetReference() as Actor

;make sure opponent doesn't run
Opponent.SetConfidence(4.0)

;enable bleedout dialogue for opponent
OpponentRef.AllowBleedoutDialogue(True)

;start unarmed combat
OpponentRef.EquipItem(Unarmed, abSilent = True)
OpponentRef.StartCombat(PlayerRef)

;start the follower manager quest so that followers / commanded actors
;will not fight the opponent
_arcFollowerManagerQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
;reset opponent back to before the brawl

;get opponent reference
Actor OpponentRef = Alias_Opponent.GetReference() as Actor

;set opponent back to default confidence
Opponent.ResetConfidence()

;disable bleedout dialogue for opponent
OpponentRef.AllowBleedoutDialogue(False)

;stop the follower manager quest so that followers
;will return to normal behaviour
_arcFollowerManagerQuest.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
;force greet end fragment
;opponent is eivind

;signal that combat with eivind is complete in _arcFlashbackQuest001
_arcFlashbackQuest001.SetStage(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_61
Function Fragment_61()
;BEGIN CODE
;if eivind is the opponent

;set eivind back to being an ally
Eivind.SetAlly(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN AUTOCAST TYPE _arcBrawlQuestScript
Quest __temp = self as Quest
_arcBrawlQuestScript kmyQuest = __temp as _arcBrawlQuestScript
;END AUTOCAST
;BEGIN CODE
;opponent friend is bleeding out

;restore health
kmyQuest.RestoreHealth(Alias_OpponentFriend.GetReference() as Actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_60
Function Fragment_60()
;BEGIN CODE
;if eivind is the opponent
;if eivind hasn't already been set back to being an ally in stage 40

;set eivind back to being an ally
Eivind.SetAlly(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;player cheated

;make it so the opponent can cheat too
(Alias_Opponent.GetReference() as Actor).UnequipItem(Unarmed, abSilent = True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
;opponent friend exists

;get opponent friend ref
Actor OpponentFriendRef = Alias_OpponentFriend.GetReference() as Actor

;make sure opponent friend doesn't run
OpponentFriend.SetConfidence(4.0)

;start unarmed combat
OpponentFriendRef.EquipItem(Unarmed, abSilent=True)
OpponentFriendRef.StartCombat(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
;force greet end fragment
;opponent is telisha
;player lost
;don't do anything other than set up tavern trespass

;set up tavern trespass quest
_arcTavernTrespassQuest.EnableTrespass(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN AUTOCAST TYPE _arcBrawlQuestScript
Quest __temp = self as Quest
_arcBrawlQuestScript kmyQuest = __temp as _arcBrawlQuestScript
;END AUTOCAST
;BEGIN CODE
;opponent is bleeding out

;restore health
kmyQuest.RestoreHealth(Alias_Opponent.GetReference() as Actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE _arcBrawlQuestScript
Quest __temp = self as Quest
_arcBrawlQuestScript kmyQuest = __temp as _arcBrawlQuestScript
;END AUTOCAST
;BEGIN CODE
;player won
;this stage is set on the opponent's alias script in the OnBleedout event
;conditionalizes force greet dialogue

;stop the player's combat alarm, this stops the friend / opponent attacking
PlayerRef.StopCombatAlarm()

;evaluate the opponent friend's package if they exist
;this will make them put thier weapon away, stop combat and flee to the opponent
;this is all accomplished in _arcBrawlQuestOpponentFriendFleeToOpponentNoCombat
Alias_OpponentFriend.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;opponent friend exists

;get opponent friend ref
Actor OpponentFriendRef = Alias_OpponentFriend.GetReference() as Actor

;stop combat alarm for opponent friend
OpponentFriendRef.StopCombatAlarm()

;evaluate opponent friend package
OpponentFriendRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;start up stage

;eivind is opponent

;make sure Eivind is no longer an ally
Eivind.SetAlly(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;bleedout finished
;forcegreet start
;this stage is set at the start of phase 3 of of _arcBrawlQuestScene

;stop combat alarm for player
PlayerRef.StopCombatAlarm()

;get opponent reference
Actor OpponentRef = Alias_Opponent.GetReference() as Actor

;stop combat alarm for opponent
OpponentRef.StopCombatAlarm()

;wait for the bleedout camera to reset
Utility.Wait(0.5)

;always enable the player's controls
Game.EnablePlayerControls()

;evaluate opponents package
OpponentRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;opponent friend exists

;make it so the opponent friend can cheat
(Alias_OpponentFriend.GetReference() as Actor).UnequipItem(Unarmed, abSilent = True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
;combat is complete
;the player is bleeding out
;this stage is set at the end of phase 1 of _arcBrawlQuestScene

;disable player controls
Game.DisablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
;reset opponent friend back to before the brawl

;set opponent friend back to default confidence
OpponentFriend.ResetConfidence()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;force greet end fragment
;opponent is calder
;player lost

;send out the letter, have calder leave
_arcQuest001.SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
;force greet end fragment
;opponent is calder
;player won

;have calder give the player the ring
_arcQuest001.RingGiver = 4
_arcQuest001.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;force greet end fragment
;opponent is telisha
;player won

;telisha gives the player the ring
_arcQuest001.RingGiver = 3
_arcQuest001.SetStage(70)

;set up tavern trespass quest
_arcTavernTrespassQuest.EnableTrespass(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;player lost
;this stage is set in the player's alias script in the OnBleedout() event
;also the OnLocationChange() event
;it conditionalizes force greet dialogue for all fragments in this stage regardless
;of if this fragment runs

;if the player and the opponent are not in the same location at this point;
;we can assume the player left the fight without finishing

;stop the scene early, this will force set the stage to 50 when it ends
_arcBrawlQuestScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN AUTOCAST TYPE _arcBrawlQuestScript
Quest __temp = self as Quest
_arcBrawlQuestScript kmyQuest = __temp as _arcBrawlQuestScript
;END AUTOCAST
;BEGIN CODE
;player is bleeding out

;restore health
kmyQuest.RestoreHealth(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcBrawlQuestOpponentAliasScript Property Opponent Auto

_arcBrawlQuestOpponentAliasScript Property OpponentFriend Auto

Weapon Property Unarmed  Auto  

Actor Property PlayerRef  Auto  

_arcTavernTrespassQuestScript Property _arcTavernTrespassQuest Auto

_arcQuest001Script Property _arcQuest001  Auto  

Quest Property _arcFlashbackQuest001  Auto  

_arcQuestActorFollowerAliasScript Property Eivind Auto

Scene Property _arcBrawlQuestScene  Auto  

Quest Property _arcFollowerManagerQuest  Auto  
