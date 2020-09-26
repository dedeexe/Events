import HexagonEdges

public enum EventsServiceProvider {
    public static func `default`() -> EventsService {
        return EventsServiceWorker()
    }
}
