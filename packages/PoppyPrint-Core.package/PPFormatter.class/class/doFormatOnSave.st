preferences
doFormatOnSave

	SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #method
		change: #Modified
		using: #methodModified:.
		
	SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #method
		change: #Added
		using: #methodAdded:.
		
	self doesFormatOnSave: true