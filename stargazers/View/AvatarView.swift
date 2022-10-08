//
//  AvatarView.swift
//  stargazers
//
//  Created by PieroAdmin on 05/10/22.
//

import SwiftUI


struct AvatarView: View {
    @State var url: URL
    
    var body: some View {
        AsyncImage(url: url,
                   content: { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 40, maxHeight: 40)
                .cornerRadius(5)
        },
                   placeholder: {
            ProgressView()
        }
        )
    }
}

struct AvatarView_Previews: PreviewProvider {
    static let url = URL(string: "https://avatars.githubusercontent.com/u/1358172?v=4")
    static var previews: some View {
        AvatarView(url: url!)
    }
}
