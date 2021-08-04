printing
printPragmas: aNode

	aNode primitive > 0 ifTrue: [
		(aNode primitive between: self pragmaStart and: self pragmaFinish)
			ifFalse: [
				self stream crtab: 1.
				aNode printPrimitiveOn: self stream]].
	aNode printPragmasOn: self stream