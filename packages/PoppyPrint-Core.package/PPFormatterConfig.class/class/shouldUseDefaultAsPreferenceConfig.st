accessing
shouldUseDefaultAsPreferenceConfig

	^ ShouldUseDefaultAsPreferenceConfig ifNil: [ShouldUseDefaultAsPreferenceConfig := false]