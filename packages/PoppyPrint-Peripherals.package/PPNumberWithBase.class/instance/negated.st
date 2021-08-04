arithmetic
negated

	^ self class new
		number: self number negated;
		base: self base;
		leadingZeroAmount: self leadingZeroAmount;
		yourself