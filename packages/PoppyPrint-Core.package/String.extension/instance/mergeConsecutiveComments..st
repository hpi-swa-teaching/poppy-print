*PoppyPrint-Core
mergeConsecutiveComments: aCollection

	^ Array streamContents: [:s | | i |
		i := 1.
		[i < aCollection size] whileTrue: [
			((self at: (aCollection at: i) start) = $" and: [(self at: (aCollection at: i + 1) start) = $"])
				ifTrue: [
					s nextPut: ((aCollection at: i) start to: (aCollection at: i + 1) stop).
					i := i + 1]
				ifFalse: [s nextPut: (aCollection at: i)].
			i := i + 1].
		i = aCollection size ifTrue: [s nextPut: aCollection last]]