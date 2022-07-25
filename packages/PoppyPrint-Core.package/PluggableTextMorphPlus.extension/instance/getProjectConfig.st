*PoppyPrint-Core-override
getProjectConfig

	(model isNil or: [(model respondsTo: #editSelection) not]) ifTrue: [^ PPFormatterConfig default].
	model editSelection = #newMessage ifTrue: [^ PPFormatterConfig packageConfigForClass: model selectedClass].
	model editSelection = #editMessage ifTrue: [^ PPFormatterConfig packageConfigForMethod: model selectedClassOrMetaClass >> model selectedMessageName].
	^ PPFormatterConfig default.