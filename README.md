# Poppy Print

A small, opinionated pretty printer for Squeak/Smalltalk.

### Install
```
Metacello new baseline: 'PoppyPrint'; repository: 'github://tom95/poppy-print'; load.
```

### Example

```
PPFormatter formatPackage: 'PoppyPrint'.
PPFormatter formatMethod: PoppyPrint >> #initialize.
```

If you find any methods that don't format well, please open a Github issue or contribute a test case.
