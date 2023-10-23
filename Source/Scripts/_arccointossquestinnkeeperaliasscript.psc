ScriptName _arcCoinTossQuestInnkeeperAliasScript Extends ReferenceAlias

Idle Property IdlePointClose Auto
String Property NodeName = "NPC L Hand [LHnd]" Auto Hidden
_arcCoinTossQuestScript Property _arcCoinTossQuest Auto
ReferenceAlias Property MarkerStart Auto
_arcCoinTossQuestCoinAliasScript Property Coin Auto


Function Toss()
	;get / create references
	Actor InnKeeperRef = GetReference() as Actor
	ObjectReference MarkerStartRef = MarkerStart.GetReference()
	
	;start to toss the coin, this has a 1.5s delay to wait for animations etc...
	Coin.Toss()
	
	;play flip animation and wait until innkeeper's hand is in position
	InnKeeperRef.PlayIdle(IdlePointClose)
	Utility.Wait(0.7)
	
	;if the innkeeper has a hand node
	;else fall back onto an approximation of where their hand may be
	If InnKeeperRef.HasNode(NodeName) == True
		MarkerStartRef.MoveToNode(InnKeeperRef, NodeName)
		MarkerStartRef.SetPosition(MarkerStartRef.X, MarkerStartRef.Y, (MarkerStartRef.Z + 6.0))
	Else
		MarkerStartRef.MoveTo(InnKeeperRef, 28.0 * Math.Sin(InnKeeperRef.GetAngleZ()), \
		28.0 * Math.Cos(InnKeeperRef.GetAngleZ()), InnKeeperRef.GetHeight() - 42.0)
	EndIf
	
	;randomize the start of the coin toss
	MarkerStartRef.SetAngle(Utility.RandomFloat(-90.0, 90.0), Utility.RandomFloat(-90.0, 90.0), \
	Utility.RandomFloat(0.0, 360.0))
	
	;toss the coin
	_arcCoinTossQuest.CoinRef.MoveTo(MarkerStartRef)
	_arcCoinTossQuest.CoinRef.Enable()
	Utility.Wait(0.01)
	_arcCoinTossQuest.CoinRef.ApplyHavokImpulse(Math.Sin(InnKeeperRef.GetAngleZ()) * 0.1, \
	Math.Cos(InnKeeperRef.GetAngleZ()) * 0.1, 1.0, 10.0)
EndFunction
