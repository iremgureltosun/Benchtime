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
    @Environment(\.appManager) private var applicationManager

    var body: some View {
        VStack {
            HeaderView(themeStyle: .ocean, title: "Store", subtitle: "Displaying you the Fake store products")

            HStack {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)

                Text("Add new product")
                    .font(.callout)
                    .onTapGesture {
                        applicationManager.navigate(to: .addProduct)
                    }

                Spacer()
            }
            .padding(.horizontal, 20)

            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: listItems) {
                    ForEach(productService.products, id: \.self) { product in
                        getCell(for: product)
                            .padding(8)
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
                .fill(Color.lightBlue)
                .shadow(radius: 2)
                .frame(width: 100, height: 170)

            VStack {
                Text(product.title ?? "")
                    .lineLimit(2, reservesSpace: true)
                    .font(.caption2)
                    .multilineTextAlignment(.center)

                if let image = product.image {
                    RemoteImageView(url: image, contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                }

                Text("\(String(product.price ?? 0)) \(Constants.dollarSign)")
                    .font(.caption2)
            }
        }
    }
}

private extension Color {
    static let lightBlue = Color("productBg") // Customize the RGB values as needed
}

#Preview {
    StoreView()
}
