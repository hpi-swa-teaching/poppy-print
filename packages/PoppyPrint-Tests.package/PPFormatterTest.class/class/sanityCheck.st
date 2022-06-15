sanity check
sanityCheck
	" self sanityCheck "

	(PackageInfo named: 'Kernel') classes do: [:class | class methodsDo: [:m | self sanityCheck: m]]