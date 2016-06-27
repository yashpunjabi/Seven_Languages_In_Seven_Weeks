# Is 0 true or false? What about the empty string? Is nil true or false?
# Support your answer with code.
0 asBoolean println
"" asBoolean println
nil asBoolean println
if(nil, "true", "false") println

"\n" println
# How can you tell what slots a prototype supports?
Object slotNames println


"\n" println
# Evaluate 1 + 1 and then 1 + "one" . Is Io strongly typed or weakly
# typed? Support your answer with code.
1 + 1 println
1 + "one" println #Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
