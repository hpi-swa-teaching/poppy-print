printing
printAndVisitPartsSeperateBySpace: aNode

	self 
		with: aNode selector keywords
		and: aNode arguments
		do: [:part :arg |
			stream nextPutAll: part.
			stream space.
			self visitNode: arg]
		separatedBy: [stream space]