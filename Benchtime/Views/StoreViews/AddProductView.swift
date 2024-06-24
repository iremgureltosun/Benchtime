//
//  AddProductView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.06.2024.
//

import Resolver
import SwiftUI

struct AddProductView: View {
    @State var productViewState: ProductViewState = .init(selectedCategory: .electronics, title: "", price: 0, description: "")

    @Injected private var productService: ProductService

    var body: some View {
        VStack {
            HeaderView(themeStyle: .ocean, title: "Store", subtitle: "Displaying you the Fake store products")

            Slider(value: $productViewState.price, in: 0 ... 1000, step: 0.01)
                .padding()

            Text("Price: \(String(format: "%.2f", productViewState.price)) \(Constants.dollarSign)")

            HStack {
                Text("Title:")
                TextField("title", text: $productViewState.title)
            }

            HStack {
                Text("Description:")
                TextField("description", text: $productViewState.description)
            }

            HStack {
                Text("Image:")
                Text(productViewState.image)
                Spacer()
            }

            HStack {
                Text("Category:")

                Picker("Category", selection: $productViewState.selectedCategory) {
                    Text("gender").tag(Category?.none)

                    ForEach(Category.allCases, id: \.self) { option in
                        Text(option.rawValue)
                            .tag(Category?.some(option))
                    }
                }
                .tint(.blue)
                .pickerStyle(MenuPickerStyle())
                Spacer()
            }

            CustomButton(buttonTitle: "Add", themeStyle: .ocean) {
                Task {
                    try await productService.addProduct(product: productViewState.productRequest)
                }
            }
            .frame(height: 40)
        }
    }
}

#Preview {
    AddProductView()
}
