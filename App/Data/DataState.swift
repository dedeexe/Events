import Foundation

enum DataState<Data> {
    case loading
    case loaded(Data)
    case error(Error)
}

extension DataState {
    var data: Data? {
        guard case DataState.loaded(let content) = self else {
            return nil
        }
        
        return content
    }
    
    var errorMessage: String? {
        guard case DataState.error(let error) = self else {
            return nil
        }
        
        return error.localizedDescription
    }
    
    var loading: Void? {
        guard case DataState.loading = self else {
            return nil
        }
        
        return ()
    }
}
