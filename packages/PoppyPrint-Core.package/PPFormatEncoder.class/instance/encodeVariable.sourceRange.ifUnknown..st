encoding
encodeVariable: name sourceRange: range ifUnknown: action

	" instead of looking up variables and possibly returning the already existing node, always answer a fresh node "
	^ self global: nil name: name