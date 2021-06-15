baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		spec
			package: 'PoppyPrint-Core' with: [
				spec
					preLoadDoIt: #preLoad;
					postLoadDoIt: #postLoad];
			package: 'PoppyPrint-Tests' with: [spec requires: 'default'].
		
		spec
			group: 'default' with: #('PoppyPrint-Core');
			group: 'tests' with: #('PoppyPrint-Tests')]