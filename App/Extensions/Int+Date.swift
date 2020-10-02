import Foundation

extension Int {
    var timestampDate: String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}
