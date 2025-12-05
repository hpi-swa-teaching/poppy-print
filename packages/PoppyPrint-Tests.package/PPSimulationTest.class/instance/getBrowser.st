helper
getBrowser

	| browser |
	browser := SystemBrowser default open.
	browser selectClass: PPSimulationExample.
	browser selectMessageNamed: #example.
	^ browser