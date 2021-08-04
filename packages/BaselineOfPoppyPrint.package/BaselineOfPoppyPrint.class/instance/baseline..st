baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		spec
			package: 'PoppyPrint-Core' with: [
				spec
					postLoadDoIt: #postLoadCore;
					requires: #('peripherals')];
			package: 'PoppyPrint-Peripherals';
			package: 'PoppyPrint-Tests'
				with: [spec requires: #('default' 'peripherals')].
		
		spec
			group: 'default' with: #('PoppyPrint-Core');
			group: 'peripherals' with: #('PoppyPrint-Peripherals');
			group: 'tests' with: #('PoppyPrint-Tests')]