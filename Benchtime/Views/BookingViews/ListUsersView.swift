//
//  ListUsersView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 7.06.2024.
//

import SwiftUI
import Resolver

struct ListUsersView: View {
    @Injected var service: UserService
    @State var selectedUser: UserModel?

    var body: some View {
        VStack {
            HeaderView(themeStyle: .desert, title: "Users", subtitle: "Select user to see their appointments.")

            List(service.users, id: \.userId) { user in
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color(UIColor.systemGray2))

                    Text(user.userName)
                    Text(user.jobTitle)
                }
                .onTapGesture {
                    selectedUser = user
                }
            }
            .scrollContentBackground(.hidden)
        }
        .ignoresSafeArea(edges: [.top])
        .onAppear {
            Task {
                try await service.getAll()
            }
        }
        .sheet(item: $selectedUser,
               onDismiss: {
                   selectedUser = nil
               }, content: { user in
                   AppointmentsView(userId: user.userId)
                       .presentationDetents([.medium, .large])
               })
    }
}

#Preview {
    ListUsersView()
}
