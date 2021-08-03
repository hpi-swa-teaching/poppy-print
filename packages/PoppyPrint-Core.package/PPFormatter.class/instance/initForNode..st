initialize-release
initForNode: aNode

	self parents: (PPParentAssocVisitor getParentsFrom: aNode)