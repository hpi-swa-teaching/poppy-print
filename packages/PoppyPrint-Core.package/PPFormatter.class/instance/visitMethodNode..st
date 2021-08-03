visiting
visitMethodNode: aNode

	aNode selector isUnary
		ifTrue: [self stream nextPutAll: aNode selector]
		ifFalse: [
			self
				with: aNode selector keywords
				and: aNode arguments
				do: [:part :arg |
					self stream nextPutAll: part.
					self stream space.
					self visitNode: arg]
				separatedBy: [self stream space]].
	self printMethodComment: aNode.
	self printPragmas: aNode.
	self newLine.
	self indent: 1 around: [
		self newLine.
		self visitNode: aNode block]