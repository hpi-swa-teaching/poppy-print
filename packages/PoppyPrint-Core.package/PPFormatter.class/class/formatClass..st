format
formatClass: aClass

	aClass methodsDo: [:m | self formatMethod: m].
	
	" if we're not already doing a class side, automatically do the clas side as well "
	aClass isMeta ifFalse: [aClass theMetaClass methodsDo: [:m | self formatMethod: m]]