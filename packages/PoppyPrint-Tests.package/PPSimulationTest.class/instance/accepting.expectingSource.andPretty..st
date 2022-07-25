helper
accepting: aString expectingSource: aSourceString andPretty: aPrettyString

	| browser source pretty prettyPrinterClassSorce |
	prettyPrinterClassSorce := (Behavior >> #prettyPrinterClass) getSourceFromFile string.
	Behavior compile: 'prettyPrinterClass ^ PPFormatter'.
	PPFormatterConfig shouldUseDefaultAsPreferenceConfig: true.
	browser := self getBrowser.
	self setMethodContentsTo: aString of: browser using: #prettyPrint.
	source := self getSourceContentOf: browser.
	pretty := self getPrettyContentOf: browser.
	self close: browser.
	PPFormatterConfig shouldUseDefaultAsPreferenceConfig: false.
	Behavior compile: prettyPrinterClassSorce.
	self assert: aSourceString equals: source.
	self assert: aPrettyString equals: pretty