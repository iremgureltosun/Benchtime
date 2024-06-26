//
//  AppointmentsView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 10.06.2024.
//
import Resolver
import SwiftUI

struct AppointmentsView: View {
    @Injected var service: AppointmentsService
    
    let userId: String
    init(userId: String) {
        self.userId = userId
    }

    var body: some View {
        VStack {
            Text("Appointments")
                .font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)

            List(service.appointments, id: \.id) { user in
                HStack {
                    Text(user.customerName)
                    Spacer()
                    VStack {
                        Text(user.date)

                        Text("\(user.startTime) - \(user.endTime)")
                            .font(.caption)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
        .padding(.top, 45)
        .onAppear {
            Task {
                try await service.fetchAppointments(of: userId)
            }
        }
    }
}

#Preview {
    AppointmentsView(userId: "2")
}
