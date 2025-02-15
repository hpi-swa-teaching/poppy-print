tests - projectConfig
testGetProjectConfigOfMethod

	self
		assert: (PPSimulationExample poppyConfig: PPSimulationExample >> #example) instanceVariableValues
		equals: (PPFormatterConfig packageConfigForMethod: PPSimulationExample >> #example) instanceVariableValues