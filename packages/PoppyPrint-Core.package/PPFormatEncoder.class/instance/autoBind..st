encoding
autoBind: name

	" instead of looking up variables and possibly returning the already existing node, always answer a fresh node "
	^ self newTemp: name