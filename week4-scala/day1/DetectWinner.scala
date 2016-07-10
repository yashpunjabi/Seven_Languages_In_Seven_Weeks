val PLAYER1_CHAR = 'X'
val PLAYER2_CHAR = '0'
val BLANK_CHAR = ' '
val VALID_CHARS = Set(PLAYER1_CHAR, PLAYER2_CHAR, BLANK_CHAR)

val rows = Array(
    Array('X', 'X', 'X'),
    Array(' ', ' ', ' '),
    Array(' ', ' ', ' '))
detectWinner(rows)

val cols = Array(
    Array('O', ' ', ' '),
    Array('O', ' ', ' '),
    Array('O', ' ', ' '))
detectWinner(cols)

val diags = Array(
    Array('X', ' ', ' '),
    Array(' ', 'X', ' '),
    Array(' ', ' ', 'X'))
detectWinner(diags)

val otherDiags = Array(
    Array(' ', ' ', 'O'),
    Array(' ', 'O', ' '),
    Array('O', ' ', ' '))
detectWinner(otherDiags)

val tie = Array(
    Array('X', 'X', 'O'),
    Array('O', 'O', 'X'),
    Array('X', 'X', 'O'))
detectWinner(tie)

val empty = Array(
    Array(' ', ' ', ' '),
    Array(' ', ' ', ' '),
    Array(' ', ' ', ' '))
detectWinner(empty)



def detectWinner(board: Array[Array[Char]]) {
    if (invalid(board)) {
        throw new IllegalArgumentException
    }

    if (checkRows(board)) {
        println(" due to rows")
        return
    }

    if (checkColumns(board)) {
        println(" due to cols")
        return
    }

    if (checkDiagonals(board)) {
        println(" due to diags")
        return
    }

    if (checkForTie(board)) {
        println("It's a tie!")
        return
    }

    println("No winner detected")
}

def invalid(board: Array[Array[Char]]): Boolean = {
    if(board.length != 3) {
        return true
    } else {
        board.foreach { row =>
            if (row.length != 3) {
                return true
            }
            if (row.forall(elem => !(VALID_CHARS contains elem))) {
                return true
            }
        }
    }
    return false
}

def checkRows(board: Array[Array[Char]]): Boolean = {
    board.foreach { row =>
        if (row.forall(elem => (elem == row(0) && elem != BLANK_CHAR))) {
            print(row(0) + " wins!")
            return true
        }
    }
    return false
}

def checkColumns(board: Array[Array[Char]]): Boolean = {
    val board_t = board.transpose
    return checkRows(board_t)
}

def checkDiagonals(board: Array[Array[Char]]): Boolean = {
    val diag = new Array[Char](board.length)
    val otherDiag = new Array[Char](board.length)
    for (i <- 0 until board.length) {
        for (j <- 0 until board(i).length) {
            if (i == j) {
                diag(i) = board(i)(j)
            }
            if (i + j == board.length - 1) {
                otherDiag(i) = board(i)(j)
            }
        }
    }
    if (diag.forall(elem => (elem == diag(0) && elem != BLANK_CHAR))) {
        print(diag(0) + " wins!")
        return true
    }
    if (otherDiag.forall(elem => (elem == otherDiag(0) && elem != BLANK_CHAR))) {
        print(otherDiag(0) + " wins!")
        return true
    }
    return false
}

def checkForTie(board: Array[Array[Char]]): Boolean = {
    for (i <- 0 until board.length) {
        if (board(i) contains BLANK_CHAR) {
            return false
        }
    }
    return true
}
