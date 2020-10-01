import SwiftUI

struct EventDetailHeaderView: View {
    let viewModel: EventDetailHeaderViewModel
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Spacer()
                Text(viewModel.event.title)
                    .font(.title)
                    .foregroundColor(Color.white)
                Spacer()
            }
            .background(
                DownloadPhotoView(viewModel: viewModel.photoViewModel())
            )
        }
    }
}

struct EventDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EventCardView(
                viewModel: EventCardViewModel(
                    event: Event(
                        id: "1",
                        people: [Person(picture: "", name: "Person 01", eventId: "1", id: "1")],
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
        }.previewLayout(.fixed(width: 400, height: 150))
    }
}
