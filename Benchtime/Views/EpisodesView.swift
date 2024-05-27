//
//  EpisodesView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.05.2024.
//

import SwiftUI

struct EpisodesView: View {
    let episode: Episode
    var body: some View {
        VStack {
            RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/)
                .strokeBorder(style: StrokeStyle())
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(height: 90)
        }
    }
}

