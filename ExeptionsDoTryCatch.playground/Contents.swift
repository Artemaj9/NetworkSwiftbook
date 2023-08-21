import UIKit

enum CalcError: Error {
    case notInteger
    case notNumber
}


func half(_ value: Any) throws -> Int? {
    if let intValue = value as? Int {
        return intValue / 2
    } else if let doubleValue = value as? Double {
        throw CalcError.notInteger
    } else {
        throw CalcError.notNumber
    }
}



let value = 16.0

do {
    let someValue = try half(value)
    print(someValue)
} catch {
    print("Got some error: \(error)")
}

// try
//try?
//try! - не надо использовать!
