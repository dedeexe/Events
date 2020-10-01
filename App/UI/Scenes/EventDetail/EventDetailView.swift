import SwiftUI

struct EventDetailView: View {
    var viewModel: EventDetailViewModel
    
    init(viewModel: EventDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {        
        List {
            eventHeaderSection
            informationSection
            locationSection
            peopleSection
        }
    }
    
    var eventHeaderSection: some View {
        EventDetailHeaderView(viewModel: viewModel.eventDetailHeaderViewModel())
            .frame(height: 250)
            .clipped()
            .listRowInsets(EdgeInsets())
    }
    
    var informationSection: some View {
        VStack(spacing: 16) {
            Text(viewModel.event.description).font(.body)
            TitleDescriptionRow(title: "Data", description: viewModel.event.date)
            TitleDescriptionRow(title: "Preço", description: viewModel.event.price)
        }
    }
    
    var locationSection: some View {
        LocationView(viewModel: viewModel.locationViewModel())
            .frame(height: 150)
            .listRowInsets(EdgeInsets())
    }
    
    var peopleSection: some View {
        VStack {
            Text("Participantes")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.personViewModels(), id: \.id) { viewModel in
                        PersonView(viewModel: viewModel)
                            .frame(width: 120, height: 130)
                    }
                }
            }
        }
        .listRowInsets(EdgeInsets())
        .padding([.top], 16)
    }

}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(viewModel:
            .init(event:
                .init(
                    id: "1",
                    people: [
                        Person(picture: "", name: "Person 01", eventId: "1", id: "1"),
                        Person(picture: "", name: "Person 02", eventId: "1", id: "2")
                    ]
                    ,
                    date: "20/10/2020",
                    description: "A brief description about the event",
                    image: "",
                    longitude: -1.1,
                    latitude: -2.2,
                    price: "R$ 5,90",
                    title: "A good Event"
                )
            )
        )
    }
}
