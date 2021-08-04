helper
startOfMethodBody: aString

	self
		init: (ReadStream on: aString asString)
		cue: (CompilationCue source: aString)
		failBlock: [^ nil].
	
	self hereType == #word ifTrue: [^ self hereEnd].
	
	(#(binary verticalBar) includes: self hereType)
		ifTrue: [
			self advance.
			^ self hereEnd].
	
	self hereType == #keyword ifTrue: [ | lastEnd |
		[self hereType == #keyword] whileTrue: [
			self advance.
			lastEnd := self hereEnd.
			self argumentName].
		^ lastEnd].
	
	^ self expected: 'Message pattern'