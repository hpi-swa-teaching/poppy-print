examples
exampleMorphDoLayoutIn
	"Example code taken from Morph>>doLayoutIn:"

	| box priorBounds fullBounds layoutBounds |
	layoutBounds := 0.
	
	"0) Quick return. No children means no effect in layout policies. Use #minWidth and #minHeight to implement #shrinkWrap for morphs without submorphs."
	self hasSubmorphs ifFalse: [^ fullBounds := self outerBounds].
	
	"X.1) Prepare redraw. Testing for #bounds or #layoutBounds would be sufficient to figure out if we need an invalidation afterwards but #outerBounds is what we need for all leaf nodes so we use that"
	priorBounds := self outerBounds.
	
	"1) Give our children a chance to manually adjust *before* layout (cell) computation. This allows morphs to layout in their owner without having to use a layout policy."
	self submorphsDo: [:m | m ownerChanged].
	
	"2) Compute the new layout. This goes down the entire morph hierarchy. See #layoutInBounds: and #minExtent, which are the usual layout-policy callbacks."
	self layoutPolicy ifNotNil: [:layout |
		"2.1) Compute the new layout."
		self removeProperty: #doLayoutAgain.
		layout layout: self in: layoutBounds.
		
		"2.2) Do one additional run on the layout if requested in #layoutInBounds:."
		(self hasProperty: #doLayoutAgain) ifTrue: [
			self removeProperty: #doLayoutAgain.
			layout flushLayoutCache.
			layout layout: self in: layoutBounds].
		self assert: (self hasProperty: #doLayoutAgain) not].
	
	"3) Watch out for minimal extent and apply #shrinkWrap constraints."
	self adjustLayoutBounds.
	
	"4) Compute and set the new full bounds. IMPORTANT to finish layout computation."
	fullBounds := self privateFullBounds.
	
	"X.2) Redraw."
	box := self outerBounds.
	box = priorBounds ifFalse: [self invalidRect: (priorBounds quickMerge: box)]