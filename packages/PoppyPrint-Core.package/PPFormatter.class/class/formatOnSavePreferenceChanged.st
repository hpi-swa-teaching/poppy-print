preferences
formatOnSavePreferenceChanged

	[
		Preferences formatOnSave
			ifTrue: [self doFormatOnSave]
			ifFalse: [self dontFormatOnSave]]
		on: MessageNotUnderstood
		do: ["Just do nothing if preference does not exist."
		]