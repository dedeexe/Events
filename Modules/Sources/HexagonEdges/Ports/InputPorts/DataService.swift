import Foundation
public protocol DataService {
    func getData(url: String, completion: @escaping DecodedCompletion<Data>)
}
