sanity check
sanityCheck: aMethod

	| string |
	string := PPFormatter
		formatString: aMethod getSourceFromFile
		class: aMethod methodClass
		noPattern: false.
	Compiler new
		compile: string
		in: aMethod methodClass
		notifying: nil
		ifFail: nil