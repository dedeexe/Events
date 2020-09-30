import SwiftUI

struct EventCardView: View {
    
    let viewModel: EventCardViewModel
    
    
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                Text(viewModel.event.title)
                    .font(.headline)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                HStack(spacing: 60) {
                    TitleDescriptionView(title: "Data", description: viewModel.event.date)
                    Spacer()
                    TitleDescriptionView(title: "Preço", description: viewModel.event.price)
                }.padding([.leading, .trailing], 16)
            }
            .frame(minHeight: 150)
            .background(
                DownloadPhotoView(viewModel: viewModel.photoViewModel())
            )
            .padding(8)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct TitleDescriptionView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(Color.white)
            
            Text(description)
                .font(.footnote)
                .foregroundColor(Color.white)
        }
    }
}

struct EventCardView_Previews: PreviewProvider {
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
