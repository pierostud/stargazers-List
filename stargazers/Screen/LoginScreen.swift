//
//  LoginScreen.swift
//  stargazers
//
//  Created by PieroAdmin on 07/10/22.
//

import SwiftUI

struct LoginScreen: View {
    @AppStorage("username") var username: String = ""
    @State private var password: String = ""
    @State var showingRepoSearchScreen = false
    
    var body: some View {
        
            ZStack {
                Color("sfondoCard")
                VStack {
                    Image("GithubLogo")
                        .resizable()
                        .frame(height: 200)
                        .padding()
                    
                    LoginInputView(username: $username, password: $password)
                        .fullScreenCover(isPresented: $showingRepoSearchScreen) {
                            RepoSearchScreen()
                        }

                    Spacer()
                    
                    AccediButtonView(text: "Accedi", action: {
                        UserManager().save(User(username: username, password: password))
                        showingRepoSearchScreen = true
                    })
                }.padding(.vertical, 30)
                .padding()
               
            }.edgesIgnoringSafeArea(.all)

    }
    
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

