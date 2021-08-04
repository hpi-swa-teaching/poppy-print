printing
printPragmas: aNode

	aNode primitive > 0 ifTrue: [
		(aNode primitive between: self pragmaStart and: self pragmaFinish)
			ifFalse: [
				stream crtab: 1.
				aNode printPrimitiveOn: stream]].
	aNode printPragmasOn: stream