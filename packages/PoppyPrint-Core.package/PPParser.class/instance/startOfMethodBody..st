helper
startOfMethodBody: aString

	self init: (ReadStream on: aString asString) cue: (CompilationCue source: aString) failBlock: [^ nil].
	
	hereType == #word ifTrue: [^ hereEnd].
	
	(hereType == #binary or: [hereType == #verticalBar]) ifTrue: [
		self advance.
		^ hereEnd].
	
	hereType == #keyword ifTrue: [ | lastEnd |
		[hereType == #keyword] whileTrue: [
			self advance.
			lastEnd := hereEnd.
			self argumentName].
		^ lastEnd].
	
	^ self expected: 'Message pattern'