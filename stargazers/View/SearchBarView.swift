//
//  SearchBarView.swift
//  stargazers
//
//  Created by PieroAdmin on 08/10/22.
//

import SwiftUI

struct SearchBarView: View {
    var placeholder: String = "Search .."
    @Binding var searchText: String
    
     var body: some View {
         ZStack {
             Rectangle()
                 .foregroundColor(Color("LightGray"))
             HStack {
                 Image(systemName: "magnifyingglass")
                 TextField(placeholder, text: $searchText)
                     .textFieldStyle(.roundedBorder)
             }
             .padding(.leading, 13)
         }
             .frame(height: 40)
             .cornerRadius(13)
             .padding()
     }
 }
struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
