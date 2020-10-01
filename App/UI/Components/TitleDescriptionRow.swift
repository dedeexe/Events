//
//  TitleDescriptionRow.swift
//  EventsApp
//
//  Created by User on 10/1/20.
//  Copyright © 2020 User. All rights reserved.
//

import SwiftUI

struct TitleDescriptionRow: View {
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 16) {
            Text(title).font(.headline)
            Spacer()
            Text(description).font(.callout)
        }
    }
}

struct TitleDescriptionRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TitleDescriptionRow(title: "title", description: "description")
                .previewLayout(.fixed(width: 300, height: 50))
        }
    }
}
