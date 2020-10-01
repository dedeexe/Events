import SwiftUI

struct EventsView: View {
    @ObservedObject var viewModel: EventsViewModel
    @EnvironmentObject var appState: AppState
    @State private var isDetailPresent: Bool = false
    
    init(viewModel: EventsViewModel = EventsViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {        
        VStack(alignment: .center) {
            viewModel.state.data.flatMap {
                createEventList(events: $0)
            }
            
            viewModel.state.loading.flatMap {
                createLoading(isAnimating: true)
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
                    .onTapGesture {
                        self.viewModel.selectDetailViewModel(from: eventViewModel)
                        self.isDetailPresent.toggle()
                    }
            }
            .sheet(
                isPresented: self.$isDetailPresent,
                onDismiss: {
                    self.isDetailPresent = false
                    self.viewModel.freeDetailViewModel()
                },
                content: {
                    EventDetailView(viewModel: self.viewModel.selectedDetailViewModel)
                }
            )
        }
    }
    
    func createErrorView(error: String) -> some View {
        Text(error)
    }
    
    func createLoading(isAnimating: Bool) -> some View {
        LoadingView(isAnimating: isAnimating)
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
