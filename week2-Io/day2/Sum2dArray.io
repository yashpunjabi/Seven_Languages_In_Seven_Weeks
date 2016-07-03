
addAll := method(array,
    sum := 0
    array foreach(innerArray, sum = sum + innerArray sum)
    sum
)


array := list(
list(1, 2, 3, 4),
list(1, 2, 3, 4),
list(1, 2, 3, 6)
)

addAll(array) println
