tests - pointyBraceBug
testPointyBraces
	"the method is found in FFI-Win32-Examples"

	(Installer new allPackages includes: #ffi)
		ifTrue: [
			self
				canFormat: 'getFocus 
	"Return the HWND currently having the input focus"
	<apicall: Win32Window ''GetFocus'' (void) module: ''user32.dll''>
	^self externalCallFailed'
				as: 'getFocus
	"Return the HWND currently having the input focus"
	<apicall: Win32Window ''GetFocus'' (void) module: ''user32.dll''>

	^ self externalCallFailed']