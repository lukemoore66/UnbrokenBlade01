ScriptName _arcCoinTossQuestScript Extends Quest Conditional

Int Property CoinTossResult = -1 Auto Conditional Hidden
Int Property CoinTossChoice = -1 Auto Conditional Hidden
Int Property CoinTossWon = -1 Auto Conditional Hidden

Int Property CoinTossDisplay001 = 0 Auto Conditional Hidden
Int Property CoinTossDisplay010 = 0 Auto Conditional Hidden
Int Property CoinTossDisplay100 = 0 Auto Conditional Hidden

Int Property TelishaPlayed = 0 Auto Conditional Hidden
Int Property TelishaTotal = 0 Auto Conditional Hidden

Int Property CoinTossGold Auto Hidden

Bool Property IsTelisha = False Auto Hidden

ObjectReference Property PlayerRef Auto
GlobalVariable Property _arcCoinTossGold Auto
GlobalVariable Property _arcCoinTossGold010Percent Auto
GlobalVariable Property _arcCoinTossGold020Percent Auto
GlobalVariable Property _arcCoinTossGold050Percent Auto
GlobalVariable Property _arcCoinTossGold100Percent Auto
_arcCoinTossQuestCoinAliasScript Property Coin Auto
ReferenceAlias Property CoinTossChest Auto
Form Property Gold001 Auto
_arcCoinTossQuestInnkeeperAliasScript Property Innkeeper Auto
Scene Property _arcCoinTossQuestScene Auto
Sound Property ITMGoldDown Auto
Message Property _arcCoinTossQuestHeadsWinMSG Auto
Message Property _arcCoinTossQuestHeadsLoseMSG Auto
Message Property _arcCoinTossQuestTailsWinMSG Auto
Message Property _arcCoinTossQuestTailsLoseMSG Auto

ObjectReference Property CoinRef Auto Hidden

Function Begin(Int aiCoinTossChoice)
	;failsafe in case innkeeper is in a scene
	;this is very unlikely, but we do not want to lock controls unless
	;we are 100% sure we should
	;fail silently
	
	If Innkeeper.GetReference().GetCurrentScene()
		Return
	EndIf
	
	CoinRef = Coin.GetReference()
	CoinTossChoice = aiCoinTossChoice
	
	Game.DisablePlayerControls()
	
	_arcCoinTossQuestScene.Start()
EndFunction

Function Toss()
	Innkeeper.Toss()
EndFunction

Function SetResult(Bool aiIsHeads)
	CoinTossResult = aiIsHeads as Int
	
	If CoinTossChoice == CoinTossResult
		CoinTossWon = 1
		Return
	EndIf
	
	CoinTossWon = 0
EndFunction

Function UseAmulet()
	Coin.UseAmulet()
EndFunction

Function CalculateGold()
	Float InnkeeperGold = CoinTossChest.GetReference().GetItemCount(Gold001)
	Float PlayerGold = PlayerRef.GetItemCount(Gold001)

	If PlayerGold >= InnkeeperGold
		_arcCoinTossGold010Percent.SetValue(Math.Ceiling(InnkeeperGold * 0.1))
		_arcCoinTossGold020Percent.SetValue(Math.Ceiling(InnkeeperGold * 0.2))
		_arcCoinTossGold050Percent.SetValue(Math.Ceiling(InnkeeperGold * 0.5))
		_arcCoinTossGold100Percent.SetValue(InnkeeperGold)
	Else
		_arcCoinTossGold010Percent.SetValue(Math.Ceiling(PlayerGold * 0.1))
		_arcCoinTossGold020Percent.SetValue(Math.Ceiling(PlayerGold * 0.2))
		_arcCoinTossGold050Percent.SetValue(Math.Ceiling(PlayerGold * 0.5))
		_arcCoinTossGold100Percent.SetValue(PlayerGold)
	EndIf
	
	SetDisplayMask()

	UpdateCurrentInstanceGlobal(_arcCoinTossGold010Percent)
	UpdateCurrentInstanceGlobal(_arcCoinTossGold020Percent)
	UpdateCurrentInstanceGlobal(_arcCoinTossGold050Percent)
	UpdateCurrentInstanceGlobal(_arcCoinTossGold100Percent)
EndFunction

Function SetDisplayMask()
	Int TotalGold = _arcCoinTossGold100Percent.GetValueInt()
	
	If TotalGold >= 100
		CoinTossDisplay100 = 1
		CoinTossDisplay010 = 1
		CoinTossDisplay001 = 1
		Return
	EndIf
	
	If TotalGold >= 10 && TotalGold < 100
		CoinTossDisplay100 = 0
		CoinTossDisplay010 = 1
		CoinTossDisplay001 = 1
		Return
	EndIf
	
	If TotalGold >= 1 && TotalGold < 10
		CoinTossDisplay100 = 0
		CoinTossDisplay010 = 0
		CoinTossDisplay001 = 1
		Return
	EndIf
	
	CoinTossDisplay100 = 0
	CoinTossDisplay010 = 0
	CoinTossDisplay001 = 0
EndFunction

Function EvaluateResult()
	_arcCoinTossGold.SetValue(CoinTossGold)
	UpdateCurrentInstanceGlobal(_arcCoinTossGold)

	;if the player won
	If CoinTossWon == 1
		;if the result was heads
		If CoinTossResult == 1
			_arcCoinTossQuestHeadsWinMSG.Show()
		Else
			_arcCoinTossQuestTailsWinMSG.Show()
		EndIf
		
		CoinTossChest.GetReference().RemoveItem(Gold001, CoinTossGold, True, PlayerRef)
		SetTelishaTotal(IsTelisha, CoinTossGold)
	Else
		;if the result was heads
		If CoinTossResult == 1
			_arcCoinTossQuestHeadsLoseMSG.Show()
		Else
			_arcCoinTossQuestTailsLoseMSG.Show()
		EndIf
		
		PlayerRef.RemoveItem(Gold001, CoinTossGold, True, CoinTossChest.GetReference())
		SetTelishaTotal(IsTelisha, -CoinTossGold)
	EndIf
	
	ITMGoldDown.Play(PlayerRef)
EndFunction

Function SetTelishaTotal(Bool abIsTelisha, Int aiCoinTossGold)
		If abIsTelisha
			TelishaPlayed = 1
			TelishaTotal += aiCoinTossGold
		EndIf
EndFunction

Function Finish()
	EvaluateResult()
	
	CoinRef.Disable()
	
	CoinRef = None
	
	CoinTossResult = -1
	CoinTossChoice = -1
	CoinTossWon = -1
	
	Game.EnablePlayerControls()
EndFunction
