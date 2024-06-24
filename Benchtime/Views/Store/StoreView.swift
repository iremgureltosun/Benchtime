//
//  StoreView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 14.06.2024.
//

import Resolver
import SwiftUI

struct StoreView: View {
    private let listItems: [GridItem] = Array(repeating: .init(.fixed(CGFloat(100))), count: 3)
    @Injected var productService: ProductService

    var body: some View {
        VStack {
            HeaderView(themeStyle: .desert, title: "Store", subtitle: "Displaying you the Fake store products")
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: listItems, spacing: 20) {
                    ForEach(productService.products, id: \.self) { product in
                        getCell(for: product)
                    }
                }
            }
        }
        .ignoresSafeArea(edges: [.top])
        .onAppear {
            Task {
                try await productService.getAll()
            }
        }
    }

    @ViewBuilder private func getCell(for product: Product) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.blue.opacity(0.1))
                .shadow(radius: 2)
                .frame(height: 170)
            VStack {
                RemoteImageView(url: product.image, contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 22))

                Text(product.title)
                    .lineLimit(3, reservesSpace: true)
                    .font(.caption2)
                
                Text("\(String(product.price))  $")
                    .font(.caption2)
            }.padding(.top, 20)
        }
    }
}

#Preview {
    StoreView()
}
