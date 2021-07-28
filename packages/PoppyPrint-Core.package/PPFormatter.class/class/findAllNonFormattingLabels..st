helper
findAllNonFormattingLabels: aString
	"Put the index positions of every nonformattinglabel (start & stop)
	in the returned dictionary. The key is the index positions and the value
	is either 1 for startNonFormatting or 2 for stopNonFormatting.
	Go through the entire String until no more occurrences are left."

	| labelPositions |
	labelPositions := Dictionary new.
	
	self
		putStartLabelsOf: aString in: labelPositions;
		putStopLabelsOf: aString in: labelPositions.
	
	^ self ensureAlternatingLabelsOf: aString in: labelPositions