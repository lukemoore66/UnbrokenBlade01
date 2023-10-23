ScriptName _arcCoinTossQuestCoinAliasScript Extends ReferenceAlias

ReferenceAlias Property MarkerA Auto
ReferenceAlias Property MarkerB Auto
_arcCoinTossQuestScript Property _arcCoinTossQuest Auto
ReferenceAlias Property Innkeeper Auto
Form Property MAGINVIllusionLight01 Auto
Sound Property _arcMAGIllusionFireLP Auto

ObjectReference CoinRef
ObjectReference MarkerARef
ObjectReference MarkerBRef
ObjectReference InnkeeperRef
ObjectReference IllusionMagicFX

Int SoundInstance = -1

Function Toss()
	
	CoinRef = GetReference()
	MarkerARef = MarkerA.GetReference()
	MarkerBRef = MarkerB.GetReference()
	InnkeeperRef = Innkeeper.GetReference()
	
	MarkerARef.MoveTo(InnkeeperRef)
	MarkerBRef.MoveTo(InnkeeperRef)
	
	RegisterForSingleUpdate(1.5)
	
	InnkeeperRef = None
EndFunction

Event OnUpdate()
	MarkerBRef.MoveToNode(CoinRef, "Root")
	
	If IsMoving()
		MarkerARef.MoveToNode(CoinRef, "Root")
		RegisterForSingleUpdate(0.5)
		Return
	EndIf
	
	_arcCoinTossQuest.SetResult(IsHeads())
	
	CoinRef = None
	MarkerARef = None
	MarkerBRef = None
	
	GoToState("")
EndEvent

Bool Function IsMoving()
	If MarkerARef.X != MarkerBRef.X
		Return True
	EndIf
	
	If MarkerARef.Y != MarkerBRef.Y
		Return True
	EndIf
	
	If MarkerARef.Z != MarkerBRef.Z
		Return True
	EndIf
	
	If MarkerARef.GetAngleX() != MarkerBRef.GetAngleX()
		Return True
	EndIf
	
	If MarkerARef.GetAngleY() != MarkerBRef.GetAngleY()
		Return True
	EndIf
	
	If MarkerARef.GetAngleZ() != MarkerBRef.GetAngleZ()
		Return True
	EndIf
	
	Return False
EndFunction

Bool Function IsHeads()
	If MarkerBRef.GetAngleX() < -90.0
		Return False
	EndIf
	
	If MarkerBRef.GetAngleX() > 90.0
		Return False
	EndIf
	
	If MarkerBRef.GetAngleY() < -90.0
		Return False
	EndIf
	
	If MarkerBRef.GetAngleY() > 90.0
		Return False
	EndIf
	
	Return True
EndFunction

Function UseAmulet()
	;get / create references
	CoinRef = GetReference()
	IllusionMagicFX = CoinRef.PlaceAtMe(MAGINVIllusionLight01, abInitiallyDisabled = True)
	
	;set up illusion magic
	IllusionMagicFX.SetScale(0.3)
	IllusionMagicFX.MoveTo(CoinRef, afZOffset = -32.0)
	IllusionMagicFX.EnableNoWait(True)
	SoundInstance = _arcMAGIllusionFireLP.Play(CoinRef)
	
	;at this point, markers a and b are perfectly lined up with the coin due to the IsMoving()
	;function in _arcCoinTossQuestCoinAliasScript
	
	;move marker A 64 units above coin and flip it over
	MarkerARef = MarkerA.GetReference()
	MarkerARef.MoveTo(CoinRef, afZOffset = 64.0)
	MarkerARef.SetAngle(CoinRef.GetAngleX(), CoinRef.GetAngleY() + 180.0, CoinRef.GetAngleZ())
	
	;flip marker b over
	MarkerBRef = MarkerB.GetReference()
	MarkerBRef.MoveTo(CoinRef)
	MarkerBRef.SetAngle(CoinRef.GetAngleX(), CoinRef.GetAngleY() + 180.0, CoinRef.GetAngleZ())
	
	;translate magic fx up for a cool effect
	IllusionMagicFX.TranslateToRef(MarkerARef, 48.0)
	
	;translate coin to marker a
	CoinRef.SetMotionType(4, True)
	CoinRef.TranslateToRef(MarkerARef, 48.0)
	GoToState("TranslateA")
EndFunction

State TranslateA
	Event OnTranslationAlmostComplete()
		CoinRef.TranslateToRef(MarkerBRef, 96.0)
		GoToState("TranslateB")
	EndEvent
EndState

State TranslateB
	Event OnTranslationComplete()
		MarkerBRef.MoveToNode(CoinRef, "Root")
		_arcCoinTossQuest.SetResult(IsHeads())
		
		CoinRef.SetMotionType(1, True)
		
		Sound.StopInstance(SoundInstance)
		SoundInstance = -1
		
		CoinRef = None
		MarkerARef = None
		MarkerBRef = None
		
		IllusionMagicFX.Disable(True)
		IllusionMagicFX.Delete()
		
		GoToState("")
	EndEvent
EndState

Event OnTranslationAlmostComplete()
	;do nothing
EndEvent
