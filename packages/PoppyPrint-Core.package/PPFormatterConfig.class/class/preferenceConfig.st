config
preferenceConfig

	self shouldUseDefaultAsPreferenceConfig ifTrue: [^ PPFormatterConfig default].
	"The Personalized Config is the Default Config for now. In later Issues we want this Method to return the Config specified in the Prefrence Browser."
	^ PPFormatterConfig default