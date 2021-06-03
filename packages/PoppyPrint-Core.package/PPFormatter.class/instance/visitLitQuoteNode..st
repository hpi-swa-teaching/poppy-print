visiting
visitLitQuoteNode: aNode

	self indent: 1 around: [aNode printKeyOn: stream withIndent: indent]