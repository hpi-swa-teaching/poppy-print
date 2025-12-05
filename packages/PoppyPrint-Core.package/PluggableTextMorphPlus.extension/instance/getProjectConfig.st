*PoppyPrint-Core-override
getProjectConfig

	(model respondsTo: #editSelection) ifFalse: [^ PPFormatterConfig default].
	model editSelection = #newMessage ifTrue: [^ PPFormatterConfig packageConfigForClass: model selectedClass].
	model editSelection = #editMessage ifTrue: [^ PPFormatterConfig packageConfigForMethod: model selectedClassOrMetaClass >> model selectedMessageName].
	^ PPFormatterConfig default.