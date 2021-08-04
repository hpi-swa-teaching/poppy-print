visiting
evaluateBlockStatements: aNode

	aNode statements do: [:statement |
		(self isEmptyLineMarker: statement)
			ifTrue: [self newLine]
			ifFalse: [
				self visitNode: statement.
				statement ~= aNode statements last ifTrue: [
					self stream nextPut: $..
					self newLine]].
		self
			printAllCommentsOf: statement
			lastStatement: statement = aNode statements last]