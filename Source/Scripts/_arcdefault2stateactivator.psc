ScriptName _arcDefault2StateActivator Extends Default2StateActivator Conditional

;the reference may stay resident on memory, so OnLoad() may not fire
;in the parent script (default2StateActivator)
Event OnCellAttach()
	If IsDisabled()
		Return
	EndIf

	While !Is3DLoaded()
		Utility.Wait(0.1)
	EndWhile

	SetDefaultState()
EndEvent

Event OnLoad()
	;this overrides the default OnLoad() event to do nothing
	;in the parent script. It now uses OnCellAttach()
	;in this script instead.
EndEvent

;this is a copy / paste from the USSEP version of the parent script (default2StateActivator)
;with the USSEP fixes removed. This way, the state of the activator will always be set
;whenever the function is called from this script
Function SetDefaultState()
	if (isOpen)
		;USLEEP 3.0.9 Bug #21999: added this check to prevent the 'open' animation from being called on references that are open already:
		;if USLEEP_IsOpenByDefault == false
			playAnimationandWait(startOpenAnim, openEvent)
		;endif

		if (zInvertCollision == FALSE)
			;trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		else
			;trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		endif

		myState = 0
	Else

		;USLEEP 3.0.9 Bug #21999: added this check to prevent the 'close' animation from being called on references that are closed already:
		;if USLEEP_IsOpenByDefault
			playAnimationandWait(closeAnim, closeEvent)
		;endif
		
		if (zInvertCollision == FALSE)
			;trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		else
			;trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		endif

		myState = 1
	EndIf
EndFunction
