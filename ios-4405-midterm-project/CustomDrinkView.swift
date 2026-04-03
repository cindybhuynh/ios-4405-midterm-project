//
//  CustomDrinkView.swift
//  ios-4405-midterm-project
//
//  Created by Cindy Huynh on 4/1/26.
//

import SwiftUI

struct CustomDrinkView: View {
    @Binding var cartItems: [CartItem] // Receives cartItem
    
    // Local state for the pickers/toggles 
    @State private var selectedSize = "Medium"
    @State private var addBoba = false
    @State private var quantity = 1

    var body: some View {
        Form {
            Section("Customize Your Tea") {
                Picker("Size", selection: $selectedSize) {
                    Text("Small").tag("Small")
                    Text("Medium").tag("Medium")
                    Text("Large").tag("Large")
                }
                Toggle("Add Brown Sugar Boba", isOn: $addBoba)
                Stepper("Quantity: \(quantity)", value: $quantity, in: 1...10)
            }
            
            Button("Add to Cart") {
                let newItem = CartItem(name: "Custom Tea", price: 5.50, details: selectedSize)
                cartItems.append(newItem)
            }
        }
    }
}
