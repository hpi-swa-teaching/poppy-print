baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		spec
			package: 'PoppyPrint-Core' with: [spec postLoadDoIt: #postloadCore];
			package: 'PoppyPrint-Tests' with: [spec requires: 'default'].
		
		spec
			group: 'default' with: #('PoppyPrint-Core');
			group: 'tests' with: #('PoppyPrint-Tests')].
	
	spec postLoadDoIt: #postLoad