helper
countTabs

	| i |
	i := index + 1.
	tabCount := 0.
	
	[i <= string size and: [(self charAt: i) = Character tab]] whileTrue: [
		tabCount := tabCount + 1.
		i := i + 1]