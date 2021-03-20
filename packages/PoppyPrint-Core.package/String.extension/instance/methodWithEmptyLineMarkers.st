*PoppyPrint-Core
methodWithEmptyLineMarkers

	^ self codeWithEmptyLineMarkersStartingAt: (PPParser new startOfMethodBody: self)