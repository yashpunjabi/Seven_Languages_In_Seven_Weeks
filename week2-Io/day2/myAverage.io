List myAverage := method(sum / size)

list(1, 2, 3) myAverage println
#list() myAverage println


List myAverage = method(
    acc := 0
    for(i, 0, size - 1,
        if(at(i) isKindOf(Number) not, Exception raise("List has non-number values"))
        acc = acc + at(i)
    )
    acc / size
)

list(1, 2, 3) myAverage println
#list(1, 2, "string") myAverage println
