import HexagonEdges

public enum DataServiceProvider {
    public static func `default`() -> DataService {
        return DataServiceWorker()
    }
}
