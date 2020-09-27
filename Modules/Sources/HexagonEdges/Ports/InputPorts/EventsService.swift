public protocol EventsService {
    func getAllEvents(completion: @escaping DecodedCompletion<[InputModel.Event]>)
    func getEvent(id: String, completion: @escaping DecodedCompletion<InputModel.Event>)
}

