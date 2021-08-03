printing
printPragmas: aNode

	aNode primitive > 0 ifTrue: [
		(aNode primitive between: 255 and: 519)
			ifFalse: [
				self stream crtab: 1.
				aNode printPrimitiveOn: self stream]].
	aNode printPragmasOn: self stream