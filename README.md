# Poppy Print

A small, opinionated pretty printer for Squeak/Smalltalk. Tested with Squeak6-trunk and Squeak5.3.

> NOTE: this is a beta release. The printer may accidentally produce malformed code at this point. Please report any misbehavior you notice.

### Install
```smalltalk
Metacello new baseline: 'PoppyPrint'; repository: 'github://tom95/poppy-print/packages'; load.
```

If you want to use Poppy Print instead of the default pretty printer, run:
```smalltalk
Behavior compile: 'prettyPrinterClass ^ PPFormatter'.
" undo: "
Behavior compile: 'prettyPrinterClass ^ self compilerClass'.
```

### Example

```smalltalk
PPFormatter formatPackage: 'PoppyPrint'.
PPFormatter formatMethod: PoppyPrint >> #initialize.
```

If you find any methods that don't format well, please open a Github issue or contribute a test case.
