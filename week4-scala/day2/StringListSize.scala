val stringList = List("this is madness", "no, this is scala!")
val totalSize = (0 /: stringList) {(sum, string) => sum + string.size}
println(totalSize) //should be 33
