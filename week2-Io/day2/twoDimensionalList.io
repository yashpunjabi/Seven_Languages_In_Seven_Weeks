TwoDimList := List clone
TwoDimList dim := method(x, y,
    self := TwoDimList clone
    for(i, 0, y-1,
        currentList := list()
        for(j, 0, x-1,
            currentList append(nil)
        )
        self append(currentList)
    )
    self
)

TwoDimList set := method(x, y, value,
    self at(x) atPut(y, value)
)

TwoDimList get := method(x, y,
    self at(x) at(y)
)

TwoDimList transpose := method(
    newSelf := TwoDimList dim(self size, self at(0) size)
    for(i, 0, self size - 1,
        for(j, 0, self at(i) size - 1,
            newSelf set(j, i, self at(i) at(j))
        )
    )
    newSelf
)


twoDList := TwoDimList dim(2, 3)
twoDList println
twoDList set(1, 0, "hello")
twoDList println
newTwoDList := twoDList transpose
newTwoDList println

file := File with("matrix.txt")
file open
file write(newTwoDList serialized)
file close

readMatrix := doFile("matrix.txt")
readMatrix println
