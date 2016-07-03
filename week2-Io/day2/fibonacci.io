fib := method(n,
    n1 := 1
    n2 := 1
    sum := 1
    if(n < 2, sum)
    for(i, 3, n,
        sum = n1 + n2
        n1 = n2
        n2 = sum)
    sum
)

fib(8) println


recursiveFib := method(n,
    if(n <= 2, 1, recursiveFib(n-1) + recursiveFib(n-2))
)

recursiveFib(8) println
