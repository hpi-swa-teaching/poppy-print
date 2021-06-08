tests - nonFormattingLabels
teststoponly

	|baseString desiredString|
	baseString := 'basicMethodName
	| instanceA |
	instanceA := 1. insanceA := 2. 
	instanceA := 3. instanceA := 4.
	PPFormatter stopNonFormatting.
	instanceA := 2. instanceA := 5.
	instanceA := 1. insanceA := 2'.
	
	desiredString := 'basicMethodName

	| instanceA |
	instanceA := 1.
	insanceA := 2.
	instanceA := 3.
	instanceA := 4.
	instanceA := 2.
	instanceA := 5.
	instanceA := 1.
	insanceA := 2'.
	
	self canFormat: baseString as: desiredString.