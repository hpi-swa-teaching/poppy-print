tests - pointyBraceBug
testPointyBraces
	"the method is found in FFI-Win32-Examples"
	(PackageInfo allPackages findFirst: [:each | each packageName startsWith: 'FFI']) ~= 0 ifTrue: [
	self canFormat: 'getFocus
	"Return the HWND currently having the input focus"
	<apicall: Win32Window ''GetFocus'' (void) module: ''user32.dll''>
	^self externalCallFailed'
	as: 'getFocus
	"Return the HWND currently having the input focus"
	<apicall: Win32Window ''GetFocus'' (void) module: ''user32.dll''>

	^ self externalCallFailed']