A PPFormatter will format a given AST in a "pretty" manner, while respecting a max line length if possible.

On it class side, there are several utility methods to quickly run over many methods.

The basic idea is that when encountering a message send, we "fork" ourselves (preFormat:), layout the receiver and arguments of the message send and then see if we can fit all of these in a single line or whether the message send will spread over multiple lines.

## Implement Details:
* you will notice that in strings and comments we replace Character cr with Character value: 0. This is so #reindent: doesn't destroy the indentation of these multiline entities. #rawContents answers the actually stored values, #contents will replace all 0-characters with newlines again.