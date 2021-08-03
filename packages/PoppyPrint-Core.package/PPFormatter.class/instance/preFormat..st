printing
preFormat: aNode

	| formatter |
	^ (self preFormatCache at: aNode ifAbsentPut: [
		formatter := self class new.
		formatter parents: self parents.
		formatter indent: self indent.
		formatter preFormatCache: self preFormatCache copy.
		aNode accept: formatter.
		{formatter rawContents. self indent}]) first