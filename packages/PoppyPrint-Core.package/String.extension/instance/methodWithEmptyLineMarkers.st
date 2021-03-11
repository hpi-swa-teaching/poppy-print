*PoppyPrint-Core
methodWithEmptyLineMarkers

	| parser stream |
	stream := self readStream.
	parser := PPParser new.
	parser instVarNamed: #encoder put: parser.
	parser init: stream cue: (CompilationCue source: self) failBlock: [^ nil].
	parser pattern: false inContext: nil.
	parser temporaries.
	
	^ self codeWithEmptyLineMarkersStartingAt: stream position