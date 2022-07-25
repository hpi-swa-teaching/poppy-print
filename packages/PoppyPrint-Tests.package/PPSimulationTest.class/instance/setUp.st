setUp-tearDown
setUp

	super setUp.
	PPFormatterConfig shouldUseDefaultAsPreferenceConfig: true.
	prettyPrinterClassSource := (Behavior >> #prettyPrinterClass) getSourceFromFile string.
	Behavior compile: 'prettyPrinterClass ^ PPFormatter'.