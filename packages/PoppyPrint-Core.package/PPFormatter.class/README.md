A PPFormatter will format a given AST in a "pretty" manner, while respecting a max line length if possible.

On it class side, there are several utility methods to quickly run over many methods.

The basic idea is that when encountering a message send, we "fork" ourselves (preFormat:), layout the receiver and arguments of the message send and then see if we can fit all of these in a single line or whether the message send will spread over multiple lines.