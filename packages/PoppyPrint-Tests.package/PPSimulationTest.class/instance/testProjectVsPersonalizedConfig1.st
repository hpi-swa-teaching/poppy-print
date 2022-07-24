tests
testProjectVsPersonalizedConfig1

	self accepting: 'example

	{#a.#b.#c}' expectingSorce: 'example

	{#a . #b . #c}' andPretty: 'example

	{#a. #b. #c}'