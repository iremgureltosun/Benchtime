//
//  FormattedPillfield.swift
//  Benchtime
//
//  Created by Tosun, Irem on 25.06.2024.
//
import SwiftUI

//struct ValidatingPillField: View {
//    private let validator: RegexValidator
//    private let placeholderText: String
//    private let type: PillFieldType
//    private let themeStyle: ThemeStyle
//
//    init(validator: RegexValidator, placeholderText: String, type: PillFieldType, themeStyle: ThemeStyle) {
//        self.validator = validator
//        self.placeholderText = placeholderText
//        self.type = type
//        self.themeStyle = themeStyle
//    }
//
//    var body: some View {
//        TextField(placeholderText, text: $field.value)
//            .padding()
//            .background(Color(.systemGray6))
//            .cornerRadius(10)
//            .overlay(
//                HStack {
//                    Spacer()
//                    type.image
//                        .resizable()
//                        .frame(width: 30, height: 30)
//                        .foregroundColor(themeStyle.colorCatalog.backgroundColor)
//                        .padding(.trailing, 10)
//                }
//            )
//            .onChange(of: field.value, initial: false) { oldValue, newValue in
//                if !field.validator.validate(newValue) {
//                    field.value = oldValue
//                }
//            }
//    }
//}
//
//#Preview {
//    ValidatingPillField(field: FieldValidator(validator: RegexValidator(pattern: "^[0-9]{0,5}$"), ""), placeholderText: "Enter a 5 digit number", type: .searchIcon, themeStyle: .ocean)
//}
