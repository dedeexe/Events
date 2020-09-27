//
//  EventsView.swift
//  EventsApp
//
//  Created by User on 9/26/20.
//  Copyright © 2020 User. All rights reserved.
//

import SwiftUI

struct EventsView: View {
    @ObservedObject var viewModel: EventsViewModel
    
    init(viewModel: EventsViewModel = EventsViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .center) {
            viewModel.state.data.flatMap {
                createEventList(events: $0)
            }
        }.onAppear {
            self.viewModel.getEvents()
        }
    }
    
    func createEventList(events: [Event]) -> some View {
        List {
            ForEach(events, id: \.id) { event in
                Text(event.title)
            }
        }
    }
    
//    func createErrorView(error: Error) -> some View {
//        List {
//            
//        }
//    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
