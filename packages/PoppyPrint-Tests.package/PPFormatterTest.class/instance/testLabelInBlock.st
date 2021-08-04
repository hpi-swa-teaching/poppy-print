tests - nonFormattingLabels
testLabelInBlock

	| baseString desiredString |
	baseString := 'basicMethodName
	| instanceA |
	instanceA := 1. instanceA := 2.
	(instanceA > 0) ifTrue:[instanceA := 4. instanceA := 2.
		PPFormatter startNonFormatting.
		instanceA := 2. instanceA := 5.
		PPFormatter stopNonFormatting.].
	instanceA := 1. insanceA := 2'.
	
	desiredString := 'basicMethodName

	| instanceA |
	instanceA := 1.
	instanceA := 2.
	instanceA > 0 ifTrue: [
		instanceA := 4.
		instanceA := 2.
		PPFormatter startNonFormatting.
		instanceA := 2. instanceA := 5.
		PPFormatter stopNonFormatting].
	instanceA := 1.
	insanceA := 2'.
	
	self canFormat: baseString as: desiredString