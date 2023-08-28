//
//  Background.swift
//  TaskFlow
//
//  Created by Dima on 25.08.2023.
//

import SwiftUI

struct Background: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color("BackgroundColor1"),
                                        Color("BackgroundColor2"),
                                        Color("BackgroundColor3")]),
            startPoint: .topLeading,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
