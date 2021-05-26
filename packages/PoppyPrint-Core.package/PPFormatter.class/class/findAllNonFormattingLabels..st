helper
findAllNonFormattingLabels: aString
	"Put the index positions of every nonformattinglabel (start & stop)
	in the returned dictionary. The key is the index positions and the value
	is either 1 for startNonFormatting or 2 for stopNonFormatting.
	Go through the entire String until no more occurrences are left."
	|index lpositions startlabel stoplabel|
	startlabel := '"startNonFormatting"'.
	stoplabel := '"stopNonFormatting"'.
	
	index := 1.
	lpositions := Dictionary new.
	
	[index > 0] whileTrue: [
		index := aString findString: startlabel startingAt: index.
		index > 0 ifTrue: [
			lpositions add: index->1.
			index := index + startlabel size.
			].
	].
	index := 1.
	[index > 0] whileTrue: [
		index := aString findString: stoplabel startingAt: index.
		index > 0 ifTrue: [
			lpositions add: index->2.
			index := index + stoplabel size.
			].
	].

	^lpositions.