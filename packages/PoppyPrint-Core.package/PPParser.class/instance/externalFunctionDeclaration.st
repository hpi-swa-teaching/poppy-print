primitives
externalFunctionDeclaration
	"Parse the function declaration for a call to an external library."
	| keyWord |
	keyWord := here asSymbol.
	self readFullFfiPrimitive.
	self addPragma: (Pragma keyword: keyWord arguments: (Array with: here)).
	self advance.
	^true