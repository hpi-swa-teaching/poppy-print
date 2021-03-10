format
formatPackage: aString

	(PackageInfo named: aString) classes do: [:class | self formatClass: class]