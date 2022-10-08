//
//  StargazerCardView.swift
//  stargazers
//
//  Created by PieroAdmin on 05/10/22.
//

import SwiftUI

struct StargazerCardView: View {
    var stargazer: StargazerViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.white)

            HStack(alignment: .top) {
                if let url = stargazer.avatarUrl {
                    AvatarView(url: url)
                }
                Text("\(stargazer.login)")
                Spacer()
            }.padding()
        }
        .shadow(radius: 10)
        .padding(.vertical, 2)
    }
}

struct StargazerCardView_Previews: PreviewProvider {
    static var previews: some View {
        StargazerCardView(stargazer: .preview)
    }
}

