*PoppyPrint-Core
codeWithEmptyLineMarkersNoPattern: aBoolean

	^ aBoolean ifTrue: [self codeWithEmptyLineMarkers] ifFalse: [self methodWithEmptyLineMarkers]