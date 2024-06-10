//
//  ListUsersView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 7.06.2024.
//

import Resolver
import SwiftUI

struct ListUsersView: View {
    @State var viewModel = ListUsersViewModel()
    @Injected var service: UserService

    var body: some View {
        VStack {
            HeaderView(themeStyle: .desert, title: "Users", subtitle: "Select user to see their appointments.")

            List(viewModel.users, id: \.userId) { user in
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color(UIColor.systemGray2))

                    Text(user.userName)
                    Text(user.jobTitle)
                }
                .onTapGesture {
                    viewModel.selectedUser = user
                }
            }
            .scrollContentBackground(.hidden)
        }
        .ignoresSafeArea(edges: [.top])
        .onAppear {
            viewModel.setup(with: service)
            viewModel.fetchAll()
        }
        .sheet(item: $viewModel.selectedUser,
               onDismiss: {
                   viewModel.selectedUser = nil
               }, content: { user in
                   AppointmentsView(userId: user.userId)
                       .presentationDetents([.medium, .large])
               })
        
    }
}

#Preview {
    ListUsersView()
}
