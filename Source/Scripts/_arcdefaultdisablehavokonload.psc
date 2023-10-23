;this script is a parital copy and paste of defaultDisableHavokOnLoad
;it overrides the ReleaseToHavok() function and the OnActivate() event
;it now checks that the reference has it's 3D loaded before releasing to havok.
ScriptName _arcdefaultDisableHavokOnLoad Extends defaultDisableHavokOnLoad

EVENT onActivate(ObjectReference triggerRef)
	if havokonActivate == TRUE && beenSimmed == FALSE
		ReleaseToHavok()
	endif
endEVENT

FUNCTION ReleaseToHavok()
	;added section here
	If !Is3DLoaded()
		Return
	EndIf

		beenSimmed = TRUE
		objectReference myLink = getLinkedRef(linkHavokPartner)
		if myLink != NONE
			defaultDisableHavokOnLoad linkScript = myLink as defaultDisableHavokOnLoad
			if (linkScript)  && (linkScript.beenSimmed == FALSE)
				linkScript.ReleaseToHavok()
			endif
		endif
		setMotionType(Motion_Dynamic, TRUE)
		Self.ApplyHavokImpulse(0, 0, 1, 5)
; 		Debug.Trace("Released Havok.")
endFUNCTION
