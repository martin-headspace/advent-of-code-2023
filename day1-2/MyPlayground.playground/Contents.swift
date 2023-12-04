import Foundation

func readFromFile(atPath filename: String, ofType type: String) -> [String] {
    guard let filePath = Bundle.main.path(forResource: filename, ofType: type) else { fatalError() }
    guard let contentData = FileManager.default.contents(atPath: filePath) else { fatalError() }
    let content = String(data: contentData, encoding: .utf8)
    return content?.components(separatedBy: .newlines).map {
        $0.trimmingCharacters(in: .whitespacesAndNewlines)
    } ?? []
}

func findSpelledDigits(in input: String) -> [String] {
    let pattern = "(?:zero|one|two|three|four|five|six|seven|eight|nine)"
    
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: input.utf16.count)
        
        let matches = regex.matches(in: input, options: [], range: range)
        
        var spelledDigits = [String]()
        
        for match in matches {
            let matchRange = match.range
            let startIndex = input.index(input.startIndex, offsetBy: matchRange.lowerBound)
            let endIndex = input.index(input.startIndex, offsetBy: matchRange.upperBound)
            let matchedSubstring = String(input[startIndex..<endIndex])
            
            spelledDigits.append(matchedSubstring)
        }
        
        return spelledDigits
    } catch {
        print("Error creating regex: \(error.localizedDescription)")
        return []
    }
}

func concatenateFirstAndLastDigits(_ str: String) -> Int {
    let digits = str.compactMap { Int(String($0)) }
    let firstDigit = digits.first ?? 0
    let lastDigit = digits.last ?? 0
    let concatenatedNumber = Int("\(firstDigit)\(lastDigit)") ?? 0
    return concatenatedNumber
}
let calibrationDocument = readFromFile(atPath: "input", ofType: "txt")

var sum = 0

calibrationDocument.forEach { line in
    print(findSpelledDigits(in: line))
    sum += concatenateFirstAndLastDigits(line)
}

print("Sum of digits is:")
print(sum)
