;----------------------------------------------------------

;1 ring
;	spear 1 = 10:30
;	spear 2 = 12:00
;	spear 3 = 1:30
;	spear 4 = 3:00
;	spear 5 = 4:30
;	spear 6 = 6:00
;	spear 7 = 7:30
;	spear 8 = 9:00

;there are 4 groups of 3 rings
;	group 1 = rings 1 2 3
;	group 2 = rings 4 5 6
;	group 3 = rings 7 8 9
;	group 4 = rings 10 11 12

;----------------------------------------------------------

;we want each set of 3 spears to activate clockwise
;start at 10:30 and work around to 9:00

;we want it to stagger activation of each group by 2 clock ticks
;meaning the activation pattern will be as follows:
;	spear 1 (10:30) on group 1 activates
;	spear 3 (1:30) on group 2
;	spear 5 (4:30) on group 3
;	spear 7 (7:30) on group 4
	
;	spear 2 (12:00) on group 1 activates
;	spear 4 (3:00) on group 2
;	spear 6 (6:00) on group 3
;	spear 8 (9:00) on group 4
	
;	spear 3 (1:30) on group 1 activates
;	spear 5 (4:30) on group 2
;	spear 7 (7:30) on group 3
;	spear 9 (10:30) on group 4
	
;	spear 4 (3:00) on group 1 activates
;	spear 6 (6:00) on group 2
;	spear 8 (9:00) on group 3
;	spear 2 (12:00) on group 4
	
;	spear 5 (4:30) on group 1 activates
;	spear 7 (7:30) on group 2
;	spear 1 (10:30) on group 3
;	spear 3 (1:30) on group 4
	
;	spear 6 (6:00) on group 1 activates
;	spear 8 (9:00) on group 2
;	spear 2 (12:00) on group 3
;	spear 4 (3:00) on group 4
	
;	spear 7 (7:30) on group 1 activates
;	spear 1 (10:30) on group 2
;	spear 3 (1:30) on group 3
;	spear 5 (4:30) on group 4
	
;	spear 8 (9:00) on group 1 activates
;	spear 2 (12:00) on group 2
;	spear 4 (3:00) on group 3
;	spear 6 (6:00) on group 4

;----------------------------------------------------------

;spears will be activated via activation parent for each spear
;in ring 1, the following pattern will apply:

;---------------------------
;spear 1 on ring 1 activates
;---------------------------
;	Group 1
;		spear 1 on ring 2
;		spear 1 on ring 3

;	Group 2
;		spear 3 on ring 4
;		spear 3 on ring 5
;		spear 3 on ring 6

;	Group 3
;		spear 5 on ring 7
;		spear 5 on ring 8
;		spear 5 on ring 9

;	Group 4
;		spear 7 on ring 10
;		spear 7 on ring 11
;		spear 7 on ring 12

;---------------------------
;spear 2 on ring 1 activates
;---------------------------
;	Group 1
;		spear 2 on ring 2
;		spear 2 on ring 3

;	Group 2
;		spear 4 on ring 4
;		spear 4 on ring 5
;		spear 4 on ring 6

;	Group 3
;		spear 6 on ring 7
;		spear 6 on ring 8
;		spear 6 on ring 9

;	Group 4
;		spear 8 on ring 10
;		spear 8 on ring 11
;		spear 8 on ring 12

;---------------------------
;spear 3 on ring 1 activates
;---------------------------
;	Group 1
;		spear 3 on ring 2
;		spear 3 on ring 3

;	Group 2
;		spear 5 on ring 4
;		spear 5 on ring 5
;		spear 5 on ring 6

;	Group 3
;		spear 7 on ring 7
;		spear 7 on ring 8
;		spear 7 on ring 9

;	Group 4
;		spear 1 on ring 10
;		spear 1 on ring 11
;		spear 1 on ring 12

;---------------------------
;spear 4 on ring 1 activates
;---------------------------
;	Group 1
;		spear 4 on ring 2
;		spear 4 on ring 3

;	Group 2
;		spear 6 on ring 4
;		spear 6 on ring 5
;		spear 6 on ring 6

;	Group 3
;		spear 7 on ring 7
;		spear 7 on ring 8
;		spear 7 on ring 9

;	Group 4
;		spear 1 on ring 10
;		spear 1 on ring 11
;		spear 1 on ring 12

;---------------------------
;spear 5 on ring 1 activates
;---------------------------
;	Group 1
;		spear 5 on ring 2
;		spear 5 on ring 3

;	Group 2
;		spear 7 on ring 4
;		spear 7 on ring 5
;		spear 7 on ring 6

;	Group 3
;		spear 1 on ring 7
;		spear 1 on ring 8
;		spear 1 on ring 9

;	Group 4
;		spear 3 on ring 10
;		spear 3 on ring 11
;		spear 3 on ring 12

;---------------------------
;spear 6 on ring 1 activates
;---------------------------
;	Group 1
;		spear 6 on ring 2
;		spear 6 on ring 3

;	Group 2
;		spear 8 on ring 4
;		spear 8 on ring 5
;		spear 8 on ring 6

;	Group 3
;		spear 2 on ring 7
;		spear 2 on ring 8
;		spear 2 on ring 9

;	Group 4
;		spear 4 on ring 10
;		spear 4 on ring 11
;		spear 4 on ring 12

;---------------------------
;spear 7 on ring 1 activates
;---------------------------
;	Group 1
;		spear 7 on ring 2
;		spear 7 on ring 3

;	Group 2
;		spear 1 on ring 4
;		spear 1 on ring 5
;		spear 1 on ring 6

;	Group 3
;		spear 3 on ring 7
;		spear 3 on ring 8
;		spear 3 on ring 9

;	Group 4
;		spear 5 on ring 10
;		spear 5 on ring 11
;		spear 5 on ring 12

;---------------------------
;spear 8 on ring 1 activates
;---------------------------
;	Group 1
;		spear 8 on ring 2
;		spear 8 on ring 3

;	Group 2
;		spear 2 on ring 4
;		spear 2 on ring 5
;		spear 2 on ring 6

;	Group 3
;		spear 4 on ring 7
;		spear 4 on ring 8
;		spear 4 on ring 9

;	Group 4
;		spear 6 on ring 10
;		spear 6 on ring 11
;		spear 6 on ring 12

ScriptName _arcTrapShaftSpearActRefScript Extends ObjectReference

Keyword Property LinkCustom01 Auto

Bool Property Active = False Auto Hidden

Int ActivationCounter = 0

Auto State Active
	Event OnActivate(ObjectReference akActionRef)
		If !Active
			Active = True
			
			;this enables the camera shake trigger via enable parent
			EnableNoWait()
			
			OnUpdate()
			
			Return
		EndIf
		
		GoToState("Inactive")
		
		Active = False
		
		;this disables the camera shake trigger via enable parent
		DisableNoWait()
		
		UnregisterForUpdate()
		
		ActivationCounter = 0
		
		;activate the portcullis poles at the end of the shaft
		GetLinkedRef(LinkCustom01).Activate(Self)
	EndEvent

	Event OnUpdate()
		;use modular arithmetic to activate each spear in order
		GetNthLinkedRef((ActivationCounter % 8) + 1).Activate(Self)
		
		ActivationCounter += 1
		
		RegisterForSingleUpdate(2.0)
	EndEvent
EndState

State Inactive
	;do nothing
EndState
