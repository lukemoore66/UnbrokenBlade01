ScriptName _arcEivindNavigateQuestScript Extends Quest Conditional

ObjectReference Property PlayerRef Auto
Scene Property _arcEivindNavigateQuestScene Auto

Float Property DestRefPosX Auto Hidden
Float Property DestRefPosY Auto Hidden

Float Property BearingAngle = 0.0 Auto Hidden Conditional

Float xComponent
Float yComponent

Function CalculateBearingAngle()
	xComponent = DestRefPosX - PlayerRef.GetPositionX()
	yComponent = DestRefPosY - PlayerRef.GetPositionY()

	;the following is an implementation of the arctan2 function
	;it handles all division by zero cases, as well as the undefined case
	If xComponent > 0.0
		BearingAngle = Math.ATan(yComponent / xComponent)
		Return
	EndIf
	
	If xComponent < 0.0 && yComponent >= 0.0
		BearingAngle = Math.ATan(yComponent / xComponent) + 180.0
		Return
	EndIf	
		
	If xComponent < 0.0 && yComponent < 0.0
		BearingAngle = Math.ATan(yComponent / xComponent) - 180.0
		Return
	EndIf
	
	If xComponent == 0.0 && yComponent > 0.0
		BearingAngle = 90.0
		Return
	EndIf
	
	If xComponent == 0.0 && yComponent < 0.0
		BearingAngle = -90.0
		Return
	EndIf
	
	BearingAngle = 0.0
EndFunction
