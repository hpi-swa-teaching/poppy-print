helper
accepting: aString expectingSource: aSourceString andPretty: aPrettyString

	| browser source pretty |
	browser := self getBrowser.
	self setMethodContentsTo: aString of: browser using: #prettyPrint.
	source := self getSourceContentOf: browser.
	pretty := self getPrettyContentOf: browser.
	self close: browser.
	self assert: aSourceString equals: source.
	self assert: aPrettyString equals: pretty