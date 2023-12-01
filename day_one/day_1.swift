import Foundation

func main() {
    // Reading in file
    do {
        let content = try readFileIn()
        let splitStrings: [Substring] = content.split(separator: "\n")
        let answer = process(splitStrings)
        print(answer)
    } catch let error {
        print(error.localizedDescription)
    }


}

func readFileIn() throws -> String {
    let filePath = CommandLine.arguments[1]
    return try String(contentsOfFile: filePath, encoding: .utf8)
}

func process(_ substrings: [Substring]) -> Int {

    var sum = 0

    for s in substrings {
        var charArray: [Character] = Array(s)

        var left = 0
        var right = charArray.count - 1

        while !charArray[left].isNumber {
            left += 1
        }

        while !charArray[right].isNumber {
            right -= 1
        }

        var number = 0

        if left == right {
            number = Int(String(charArray[left]))! * 11
        } else {
            var leftNumber = String(charArray[left])
            var rightNumber = String(charArray[right])
            var numberString = leftNumber + rightNumber

            number = Int(numberString)!
        }

        sum += number
    }

    return sum
}






main()
