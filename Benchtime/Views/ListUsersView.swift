//
//  ListUsersView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 7.06.2024.
//

import SwiftUI
import Resolver

struct ListUsersView: View {
    @State var viewModel = ListUsersViewModel()
    @Injected var service: UserService
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                viewModel.setup(with: service)
                viewModel.fetchAll()
            }
    }
}

#Preview {
    ListUsersView()
}
