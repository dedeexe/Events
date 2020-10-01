import SwiftUI
import Combine

struct PersonView: View {
    var viewModel: PersonViewModel
    
    var body: some View {
        VStack {
            DownloadPhotoView(viewModel: viewModel.photoViewModel())
                .scaledToFit()
                .clipShape(Circle())
                .clipped()
            Text(viewModel.person.name).font(.footnote)
            Spacer()
        }.padding(4)
    }
}

struct PersonView_Previews: PreviewProvider {
    class MockedAdapter: ImageDownloadAdapter {
        func getImage(at url: String) -> AnyPublisher<Image, Error> {
            Future<Image, Error> { $0(.success(Image.personPlaceholder)) }
                .eraseToAnyPublisher()
        }
    }
    
    static var previews: some View {
        PersonView(viewModel:
            PersonViewModel(person:
                .init(picture: "", name: "Person 01", eventId: "1", id: "1"),
                    adapter: MockedAdapter()
            )
        ).previewLayout(.fixed(width: 130, height: 130))
    }
}
