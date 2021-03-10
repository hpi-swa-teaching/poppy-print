format
formatCategory: aString

	(self systemOrganizer classesIn: aString) do: [:class |
		self formatClass: class]