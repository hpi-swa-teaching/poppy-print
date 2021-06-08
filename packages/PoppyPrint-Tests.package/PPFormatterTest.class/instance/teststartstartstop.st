tests - nonFormattingLabels
teststartstartstop

	|baseString desiredString|
	baseString := 'basicMethodName
	| instanceA |
	instanceA := 1. insanceA := 2. 
	PPFormatter startNonFormatting.
	instanceA := 3. instanceA := 4.
	PPFormatter startNonFormatting.
	instanceA := 2. instanceA := 5.
	PPFormatter stopNonFormatting.
	instanceA := 1. insanceA := 2'.
	
	desiredString := 'basicMethodName

	| instanceA |
	instanceA := 1.
	insanceA := 2.
	PPFormatter startNonFormatting.
	instanceA := 3. instanceA := 4.
	instanceA := 2. instanceA := 5.
	PPFormatter stopNonFormatting.
	instanceA := 1.
	insanceA := 2'.
	
	self canFormat: baseString as: desiredString.