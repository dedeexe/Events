import SwiftUI
import Combine

struct AppMainView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        EventsView()
//        EventDetailView(viewModel:
//            .init(event:
//                .init(id: "1",
//                      people: [
//                        .init(picture: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                              name: "White Cat 1",
//                              eventId: "1",
//                              id: "1"),
//                        .init(picture: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                              name: "White Cat 2",
//                              eventId: "1",
//                              id: "2"),
//                        .init(picture: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                              name: "White Cat 3",
//                              eventId: "1",
//                              id: "3"),
//                        .init(picture: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                              name: "White Cat 4",
//                              eventId: "1",
//                              id: "4"),
//                        .init(picture: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                              name: "White Cat 5",
//                              eventId: "1",
//                              id: "5"),
//                        .init(picture: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                              name: "White Cat 6",
//                              eventId: "1",
//                              id: "6"),
//                        .init(picture: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                              name: "White Cat 7",
//                              eventId: "1",
//                              id: "7"),
//                        .init(picture: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                              name: "White Cat 8",
//                              eventId: "1",
//                              id: "8"),
//                        .init(picture: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                              name: "White Cat 9",
//                              eventId: "1",
//                              id: "9"),
//                        .init(picture: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                              name: "White Cat 10",
//                              eventId: "1",
//                              id: "10"),
//                        .init(picture: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                              name: "White Cat 11",
//                              eventId: "1",
//                              id: "11"),
//                        .init(picture: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                              name: "White Cat 12",
//                              eventId: "1",
//                              id: "12"),
//                        .init(picture: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                              name: "White Cat 13",
//                              eventId: "1",
//                              id: "13"),
//                        .init(picture: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                              name: "White Cat 14",
//                              eventId: "1",
//                              id: "14"),
//                        .init(picture: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                              name: "White Cat 15",
//                              eventId: "1",
//                              id: "15")
//                    ],
//                      date: "10/10/2020",
//                      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//                      image: "https://aliancatraducoes.com/wp-content/uploads/2019/10/o-que-sao-cat-tools.jpg",
//                      longitude: 0.0,
//                      latitude: 0.0,
//                      price: "R$ 40,00",
//                      title: "Cat Cat Cat. A White Cat"
//                )
//            )
//        )
    }
}

struct AppMainView_Previews: PreviewProvider {
    static var previews: some View {
        AppMainView()
    }
}
