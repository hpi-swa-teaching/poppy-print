as yet unclassified
newTypeNamed: aString force: aBool
	| sym type referentClass pointerType StructTypes2 |
	sym := aString asSymbol.
	"We had no idea where those StructTypes got initialized, so we had to get creative..."
	StructTypes2 := StructTypes.
	StructTypes2 at: #X11Drawable put: X11Drawable.
	"explanation: The StructTypes dictionary maps every goddamn data type to itself, except X11Drawable, which is mapped to void 	for unknown reasons. This messed up some formats, so we decided to make a little change to the dictionary."
	type := StructTypes at: aString ifAbsent:[nil].
	type == nil ifFalse:[^type].
	referentClass := Smalltalk at: sym ifAbsent:[nil].
	(referentClass isBehavior and:[referentClass includesBehavior: ExternalStructure])
		ifFalse:[referentClass := nil].
	"If we don't have a referent class and are not forced to create a type get out"
	(referentClass == nil and:[aBool not]) ifTrue:[^nil].
	type := self basicNew compiledSpec: 
		(WordArray with: self structureSpec).
	pointerType := self basicNew compiledSpec: 
		(WordArray with: self pointerSpec).
	type setReferencedType: pointerType.
	pointerType setReferencedType: type.
	type newReferentClass: referentClass.
	pointerType newReferentClass: referentClass.
	pointerType byteAlignment: self pointerAlignment.
	StructTypes at: sym put: type.
	^type