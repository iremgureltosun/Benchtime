//
//  MainView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            TabView {
                CharactersView()
                    .padding(.bottom, 10)
                    .tabItem {
                        Label("Characters", systemImage: "person")
                    }

            }
           
        }
    }
}

#Preview {
    MainView()
}
