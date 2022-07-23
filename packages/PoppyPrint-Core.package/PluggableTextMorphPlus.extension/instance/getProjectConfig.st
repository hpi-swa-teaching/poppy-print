*PoppyPrint-Core-override
getProjectConfig

	model ifNil: [^ PPFormatterConfig default].
	model editSelection = #newMessage ifTrue: [^ PPFormatterConfig packageConfigForClass: model selectedClass].
	model editSelection = #editMessage ifTrue: [
		model metaClassIndicated
			ifTrue: [^ PPFormatterConfig packageConfigForMethod: model selectedClass class >> model selectedMessageName]
			ifFalse: [^ PPFormatterConfig packageConfigForMethod: model selectedClass >> model selectedMessageName]].
	^ PPFormatterConfig default.