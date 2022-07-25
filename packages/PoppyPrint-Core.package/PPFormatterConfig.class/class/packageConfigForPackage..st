config
packageConfigForPackage: aPackage
	
	| classesInPackage ppConfigMethods config |
	classesInPackage := aPackage classes.
	ppConfigMethods := self getClassMethodsWithPragma: #ppProjectConfig inClasses: classesInPackage.
	ppConfigMethods size = 0 ifTrue: [^ self default].
	ppConfigMethods size = 1 ifFalse: [self error: 'More than one Config found in Package: ', aPackage asString].
	config := ppConfigMethods first methodClass soleInstance perform: ppConfigMethods first selector with: nil.
	config class = PPFormatterConfig ifFalse: [self error: 'Config returned by ', ppConfigMethods first selector asString,' is not of Type PPFormatterConfig.'].
	^ config