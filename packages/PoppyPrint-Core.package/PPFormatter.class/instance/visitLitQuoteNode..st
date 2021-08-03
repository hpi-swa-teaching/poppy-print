visiting
visitLitQuoteNode: aNode

	self indent: 1 around: [aNode printKeyOn: self stream withIndent: self indent]