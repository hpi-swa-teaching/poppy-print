tests - FFI-syntax
testCdeclArgError
	"the method is found in FFI-Win32-Examples"
	(PackageInfo allPackages findFirst: [:each | each packageName beginsWith: 'FFI']) ~= 0 ifTrue: [
	self canFormat: 'XCreateGC: xDisplay with: aDrawable with: valueMask with: values
	<cdecl: X11GC ''XCreateGC'' (X11Display* X11Drawable ulong long*) module: ''X11''>
	^self externalCallFailed'
	as: 'XCreateGC: xDisplay with: aDrawable with: valueMask with: values
	<cdecl: X11GC ''XCreateGC'' (X11Display* X11Drawable ulong long*) module: ''X11''>

	^ self externalCallFailed']