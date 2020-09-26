public protocol EventsService {
    func getAllEvents(completion: @escaping DecodedCompletion<[Model.Event]>)
    func getEvent(id: String, completion: @escaping DecodedCompletion<Model.Event>)
}

