format
formatClass: aClass

	aClass methodsDo: [:m |
		aClass compile: (self formatString: m getSourceFromFile class: aClass noPattern: false)]