oldDiv := Number getSlot("/")
Number / = method(n, if(n == 0, 0, self oldDiv(n)))

(4 / 0) println
(4 / 1) println
(4 / 3) println
