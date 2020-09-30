import Foundation

extension Double {
    var currency: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(floatLiteral: self)) ?? ""
    }
}
