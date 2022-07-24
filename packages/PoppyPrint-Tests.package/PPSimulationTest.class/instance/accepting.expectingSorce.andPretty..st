helper
accepting: aString expectingSorce: aSourceString andPretty: aPrettyString

	| browser source pretty |
	PPFormatterConfig shouldUseDefaultAsPreferenceConfig: true.
	browser := self getBrowser.
	self setMethodContentsTo: aString of: browser using: #prettyPrint.
	source := self getSourceContentOf: browser.
	pretty := self getPrettyContentOf: browser.
	self close: browser.
	PPFormatterConfig shouldUseDefaultAsPreferenceConfig: false.
	self assert: aSourceString equals: source.
	self assert: aPrettyString equals: pretty