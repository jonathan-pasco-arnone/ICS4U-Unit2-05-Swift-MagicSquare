//
// This program prints out
// the Magic Sqaures.
//
// @author  Jonathan Pasco-Arnone
// @version 1.0
// @since   2021-12-11

import Foundation

func genSquare(square: [Int], currentSquare: [Int], index: Int) {
    var nonLetSquare: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var nonLetCurrentSquare: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    for counter in 0..<NINE {
        nonLetSquare[counter] = square[counter]
        nonLetCurrentSquare[counter] = currentSquare[counter]
    }

    for counterTwo in 0..<NINE where nonLetCurrentSquare[counterTwo] == 0 {
        nonLetCurrentSquare[counterTwo] = 1
        nonLetSquare[index] = counterTwo + 1
        if index < EIGHT {
            genSquare(square: nonLetSquare, currentSquare: nonLetCurrentSquare, index: (index + 1))
        } else if isMagic(preSquare: nonLetSquare) {
            printMagicSquare(outputSquare: nonLetSquare)
        }
        nonLetCurrentSquare[counterTwo] = 0
    }
}

func isMagic(preSquare: [Int]) -> Bool {
    // returns true or false for whether or not array is a magic square
    let row1: Int = preSquare[0] + preSquare[1] + preSquare[2]
    let row2: Int = preSquare[THREE] + preSquare[FOUR] + preSquare[FIVE]
    let row3: Int = preSquare[SIX] + preSquare[SEVEN] + preSquare[EIGHT]
    let col1: Int = preSquare[0] + preSquare[THREE] + preSquare[SIX]
    let col2: Int = preSquare[1] + preSquare[FOUR] + preSquare[SEVEN]
    let col3: Int = preSquare[2] + preSquare[FIVE] + preSquare[EIGHT]
    let diag1: Int = preSquare[0] + preSquare[FOUR] + preSquare[EIGHT]
    let diag2: Int = preSquare[2] + preSquare[FOUR] + preSquare[SIX]

    return row1 == MAGICNUM && row2 == MAGICNUM && row3 == MAGICNUM
        && col1 == MAGICNUM && col2 == MAGICNUM
        && col3 == MAGICNUM && diag1 == MAGICNUM && diag2 == MAGICNUM
}

func printMagicSquare(outputSquare: [Int]) {
    print("\n*****")
    for count in 0..<9 {
        if count == THREE || count == SIX {
            print("")
            print(outputSquare[count], terminator: " ")
        } else {
            print(outputSquare[count], terminator: " ")
        }
    }
    print("\n*****")
}

let THREE: Int = 3
let FOUR: Int = 4
let FIVE: Int = 5
let SIX: Int = 6
let SEVEN: Int = 7
let EIGHT: Int = 8
let NINE: Int = 9
let MAGICNUM: Int = 15

let magicSquare: [Int] = [1, 2, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE]
let extraArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
print("\n")
print("All Possible Magic Squares (3x3):\n")
genSquare(square: magicSquare, currentSquare: extraArray, index: (0))
