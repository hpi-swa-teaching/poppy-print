printing
indent: aNumber around: aBlock

	self indent: self indent + aNumber.
	aBlock value.
	self indent: self indent - aNumber