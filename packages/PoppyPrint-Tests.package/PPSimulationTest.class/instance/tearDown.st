setUp-tearDown
tearDown

	[PPFormatterConfig shouldUseDefaultAsPreferenceConfig: false.
	Behavior compile: prettyPrinterClassSource] ensure: [super tearDown]