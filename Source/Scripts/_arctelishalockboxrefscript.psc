ScriptName _arcTelishaLockboxRefScript Extends ObjectReference
;this script is used to store the current container
;for the ring (_arcArcadiaRingRef) as it cannot be stored
;on the ring itself, due to it not casting from an ObjectReference
;when it is stored in a container

ObjectReference Property CurrentContainerRef Auto Hidden
