import SwiftUI

struct EventsView: View {
    @ObservedObject var viewModel: EventsViewModel
    @EnvironmentObject var appState: AppState
    
    init(viewModel: EventsViewModel = EventsViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {        
        VStack(alignment: .center) {
            viewModel.state.data.flatMap {
                createEventList(events: $0)
            }
            
            viewModel.state.errorMessage.flatMap {
                createErrorView(error: $0)
            }
        }.onAppear {
            self.viewModel.getEvents()
        }
    }
    
    func createEventList(events: [EventCardViewModel]) -> some View {
        List {
            ForEach(events, id: \.id) { eventViewModel in
                EventCardView(viewModel: eventViewModel)
                    .onTapGesture { self.appState.isDetailPresenting.toggle() }
                    .sheet(
                        isPresented: self.$appState.isDetailPresenting,
                        onDismiss: { self.appState.isDetailPresenting = false },
                        content: {
                            EventDetailView(viewModel: eventViewModel.eventDetailViewModel())
                        }
                    )
            }
        }
    }
    
    func createErrorView(error: String) -> some View {
        Text(error)
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
