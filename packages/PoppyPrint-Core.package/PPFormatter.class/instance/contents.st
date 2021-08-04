accessing
contents

	^ self stream contents copy
		replaceAll: (Character value: 0)
		with: Character cr