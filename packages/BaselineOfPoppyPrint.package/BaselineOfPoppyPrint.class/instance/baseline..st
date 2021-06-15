baseline
baseline: spec
	<baseline>

	PPFormatter addFormatOnSaveToPreferences.
	
	spec for: #common do: [
		spec
			package: 'PoppyPrint-Core';
			package: 'PoppyPrint-Tests' with: [spec requires: 'default'].
		
		spec
			group: 'default' with: #('PoppyPrint-Core');
			group: 'tests' with: #('PoppyPrint-Tests')]