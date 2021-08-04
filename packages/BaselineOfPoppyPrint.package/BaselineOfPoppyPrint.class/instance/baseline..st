baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		spec
			package: 'PoppyPrint-Core' with: [spec postLoadDoIt: #postLoadCore];
			package: 'PoppyPrint-Peripherals' with: [spec requires: 'default'];
			package: 'PoppyPrint-Tests' with: [spec requires: #('default' 'peripherals')].
		
		spec
			group: 'default' with: #('PoppyPrint-Core' 'PoppyPrintPeripherals');
			group: 'peripherals' with: #('PoppyPrint-Peripherals');
			group: 'tests' with: #('PoppyPrint-Tests')]