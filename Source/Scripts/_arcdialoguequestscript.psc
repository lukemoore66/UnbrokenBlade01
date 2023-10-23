ScriptName _arcDialogueQuestScript Extends Quest Conditional

;persistent conditional variables needed for calder's dialogue to
;function correctly regarding _arcCalderWineQuest
Int Property CalderWineDialogueStage = 0 Auto Conditional Hidden
Int Property CalderWineWineCount = 3 Auto Conditional Hidden
Float Property CalderWineNextMiddas = 0.0 Auto Conditional Hidden

;enumerate who the hanging victim is for dialogue topics during _arcQuest003
;this value is set in stage 170 of _arcQuest002
;affected topics:
;_arcDialogueQuestEivindTelishaDeadBranchTopic,
;_arcDialogueQuestEivindTelishaNotDeadBranchTopic,
;_arcDialogueQuestTelishaThanksBranchTopic
;0 = no victim, 1 = telisha, 2 = halvar, 3 = calder
;4 = player has been paid by telisha
Int Property VictimDialogueStatus = 0 Auto Conditional Hidden

;persistent variables to for the messenger of death's
;dialogue to function in _arcMessengerOfDeathQuest
;matches the trigger number, 0 will disable
Int Property MessengerForceGreet = 1 Auto Conditional Hidden
Form[] Property MessengerDeadActors Auto Hidden
