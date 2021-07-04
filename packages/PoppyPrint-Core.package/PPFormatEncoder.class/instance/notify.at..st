testing
notify: aString at: location

	self flag: #fixme.
	" hack to enable placing empty lines inside of caseOf: blocks. "
	aString = 'Association between 0-argument blocks required'
		ifFalse: [^ super notify: aString at: location].
	^ false