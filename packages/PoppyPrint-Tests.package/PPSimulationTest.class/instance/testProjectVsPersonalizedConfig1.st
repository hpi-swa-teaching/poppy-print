tests
testProjectVsPersonalizedConfig1

	self accepting: 'example

	{#a.#b.#c}' expectingSource: 'example

	{#a . #b . #c}' andPretty: 'example

	{#a. #b. #c}'