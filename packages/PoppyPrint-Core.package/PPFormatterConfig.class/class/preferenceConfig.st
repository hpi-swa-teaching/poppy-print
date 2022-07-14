config
preferenceConfig

	^ self default
		dotAtEndOfMethod: self dotAtEndOfMethod;
		formatToMaxLineWidth: self formatToMaxLineWidth;
		maxLineWidth: self maxLineWidth;
		spaceBeforeComma: self spaceBeforeComma;
		spaceBeforePointInArray: self spaceBeforePointInArray