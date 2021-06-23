tests - nonFormattingLabels
testStartStopStop

	|baseString desiredString|
	baseString := 'basicMethodName
	| instanceA |
	instanceA := 1. instanceA := 2. 
	PPFormatter startNonFormatting.
	instanceA := 3. instanceA := 4.
	instanceA := 1. instanceA := 8.
	PPFormatter stopNonFormatting.
	instanceA := 2. instanceA := 5.
	PPFormatter stopNonFormatting.
	instanceA := 1. instanceA := 2'.
	
	desiredString := 'basicMethodName

	| instanceA |
	instanceA := 1.
	instanceA := 2.
	PPFormatter startNonFormatting.
	instanceA := 3. instanceA := 4.
	instanceA := 1. instanceA := 8.
	PPFormatter stopNonFormatting.
	instanceA := 2.
	instanceA := 5.
	instanceA := 1.
	instanceA := 2'.
	
	self canFormat: baseString as: desiredString.