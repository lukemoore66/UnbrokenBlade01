ScriptName _arcBrawlQuestScript Extends Quest  

Function RestoreHealth(Actor akActorRef)
    Float Health = akActorRef.GetActorValue("Health")
    If Health < 1.0
        Health = Math.Abs(Health) + 10.0
        akActorRef.RestoreActorValue("Health", Health)
    EndIf
EndFunction
