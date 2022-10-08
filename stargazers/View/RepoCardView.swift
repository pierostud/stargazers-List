//
//  RepoCardView.swift
//  stargazers
//
//  Created by PieroAdmin on 04/10/22.
//

import SwiftUI

struct RepoCardView: View {
    var repository: RepositoryViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.white)

            HStack {
                VStack(alignment: .leading) {
                    Text(repository.fullName)
                        .foregroundColor(.blue)
                    if let desc = repository.desc {
                       Text(desc)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                    }
                    HStack {
                        Image(systemName: "star")
                        Text("\(repository.stars)")
                            .foregroundColor(.black)
                        if let language = repository.language {
                            Label {
                                Text(language)
                                    .foregroundColor(.black)
                            } icon: {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(Color.red)
                            }
                        }
                    }
                }
                Spacer()
            }.padding()
        }
        .shadow(radius: 10)
        .padding(.vertical, 6)

    }
}

struct RepoCardView_Previews: PreviewProvider {
    static var previews: some View {
        RepoCardView(repository: .preview)
    }
}

