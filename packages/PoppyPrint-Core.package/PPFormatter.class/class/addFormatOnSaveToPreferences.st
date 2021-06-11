preferences
addFormatOnSaveToPreferences

	Preferences
		addPreference: #formatOnSave
		categories: #(PoppyPrint)
		default: false
		balloonHelp: 'Enables PoppyPrinting of methods on saving.'
		projectLocal: false
		changeInformee: #PPFormatter
		changeSelector: #formatOnSavePreferenceChanged.