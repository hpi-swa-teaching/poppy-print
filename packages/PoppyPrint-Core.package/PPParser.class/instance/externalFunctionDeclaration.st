primitives
externalFunctionDeclaration
	"Parse the function declaration for a call to an external library."
	| keyWord |
	keyWord := self here asSymbol.
	self readFullFfiPrimitive.
	self addPragma: (Pragma keyword: keyWord arguments: (Array with: self here)).
	self advance.
	^true