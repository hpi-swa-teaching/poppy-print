helper
close: aBrowser

	self setMethodContentsTo: 'example

	"This Method will be rewritten in PPSimulationTest"'
		of: aBrowser
		using: #source.
	(aBrowser dependents at: 1) delete