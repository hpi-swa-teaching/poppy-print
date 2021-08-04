baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		spec
			package: 'PoppyPrint-Core' with: [spec postLoadDoIt: #postLoadCore];
			package: 'PoppyPrint-Tests' with: [spec requires: 'default'];
			package: 'PoppyPrint-Peripherals' with: [spec requires: 'default'].
		
		spec
			group: 'default' with: #('PoppyPrint-Core');
			group: 'tests' with: #('PoppyPrint-Tests');
			group: 'peripherals' with: #('PoppyPrint-Tests')]