//
//  WelcomeView.swift
//  stargazers
//
//  Created by PieroAdmin on 09/10/22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to Stargazers!")
                .font(.largeTitle)

            Text("Please search a repository from Github; swipe from the left edge to show the search bar.")
                .foregroundColor(.secondary)
        }
    }
}
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
