printing
preFormat: aNode

	| formatter |
	^ (preFormatCache at: aNode ifAbsentPut: [
		formatter := self class new.
		formatter parents: parents.
		formatter indent: indent.
		self currentLineLength timesRepeat: [formatter stream nextPut: $ ].
		formatter preFormatCache: preFormatCache copy.
		aNode accept: formatter.
		{formatter rawContents allButFirst: self currentLineLength. indent}]) first