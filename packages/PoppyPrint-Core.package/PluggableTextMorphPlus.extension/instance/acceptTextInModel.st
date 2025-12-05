*PoppyPrint-Core-override
acceptTextInModel

	| text |
	self okToStyle ifFalse:[^super acceptTextInModel].			
	"#correctFrom:to:with: is sent when the method source is
	manipulated during compilation (removing unused temps,
	changing selectors etc). But 	#correctFrom:to:with: operates 
	on the textMorph's text, and we may be saving an unstyled 
	copy of the text. This means that these corrections will be lost
	unless we also apply the corrections to the unstyled copy that we are saving.
		So remember the unstyled copy in unstyledAcceptText, so
	that when #correctFrom:to:with: is received we can also apply
	the correction to it"
	text := textMorph asText.
	((model respondsTo: #contentsSymbol) and: [model respondsTo: #editSelection]) ifTrue: [
		(model contentsSymbol = #prettyPrint and: [model editSelection = #newMessage or: [model editSelection = #editMessage]]) ifTrue: [
			text := PPFormatter
				formatString: text asString
				class: model selectedClass
				noPattern: false
				with: self getProjectConfig]].
	unstyledAcceptText := styler unstyledTextFrom: text asText.
	[^setTextSelector isNil or:
		[setTextSelector numArgs = 2
			ifTrue: [model perform: setTextSelector with: unstyledAcceptText with: self]
			ifFalse: [model perform: setTextSelector with: unstyledAcceptText]]
	] ensure:[unstyledAcceptText := nil]