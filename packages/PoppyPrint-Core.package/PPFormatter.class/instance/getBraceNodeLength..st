helper
getBraceNodeLength: aNode

	^ aNode elements
			inject: 0
			into: [:sum :node | sum + (self preFormat: node) size]
