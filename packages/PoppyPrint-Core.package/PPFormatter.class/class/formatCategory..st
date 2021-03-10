format
formatCategory: aString

	(SystemOrganizer default classesIn: aString) do: [:class | self formatClass: class]