//
//  StoreView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 14.06.2024.
//

import Resolver
import SwiftUI

struct StoreView: View {
    private let listItems: [GridItem] = Array(repeating: .init(.fixed(CGFloat(100))), count: 4)
    @Injected var productService: ProductService

    var body: some View {
        VStack {
            HeaderView(themeStyle: .desert, title: "Store", subtitle: "Displaying you the Fake store products")

           // LazyVGrid(columns: listItems, spacing: 20) {
                ForEach(productService.products, id: \.self) { product in
                    getCell(for: product)
                }
           // }
        }
        .onAppear(){
            Task {
                try await productService.getAll()
            }
        }
    }

    @ViewBuilder private func getCell(for product: Product) -> some View {
        VStack {
            RemoteImageView(url: product.image, contentMode: .fit)
                .frame(width: 80, height: 80, alignment: .top)

            Text(product.title)
                .lineLimit(2, reservesSpace: true)
                .font(.caption2)
            
            Text(String(product.price))
                .font(.caption2)
        }
    }
}

#Preview {
    StoreView()
}
