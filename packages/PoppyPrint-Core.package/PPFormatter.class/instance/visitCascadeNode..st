visiting
visitCascadeNode: aNode

	self visitNode: aNode receiver.
	self indent: 1 around: [
		aNode messages
			do: [:message |
				self newLine.
				(self isEmptyLineMarker: message)
					ifFalse: [
						self visitNode: message.
						(message ~= aNode messages last) ifTrue: [stream nextPut: $;]]]]