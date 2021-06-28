tests - nonFormattingLabels
testStartStop

	|baseString desiredString|
	baseString := 'basicMethodName
	| instanceA |
	instanceA := 1. instanceA := 2. 
	PPFormatter startNonFormatting.
	instanceA := 3. instanceA := 4.
	PPFormatter stopNonFormatting.
	instanceA := 1. instanceA := 2'.
	
	desiredString := 'basicMethodName

	| instanceA |
	instanceA := 1.
	instanceA := 2.
	PPFormatter startNonFormatting.
	instanceA := 3. instanceA := 4.
	PPFormatter stopNonFormatting.
	instanceA := 1.
	instanceA := 2'.
	
	self canFormat: baseString as: desiredString.