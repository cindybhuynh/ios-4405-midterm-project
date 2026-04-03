//
//  CustomDrinkView.swift
//  ios-4405-midterm-project
//
//  Created by Cindy Huynh on 4/1/26.
//

import SwiftUI

struct CustomDrinkView: View {
    @Binding var cartItems: [CartItem]
    
    @State private var selectedDrink = "Brown Sugar Milk Tea"
    let drinkOptions = ["Brown Sugar Milk Tea", "Matcha Latte", "Peach Tea"]
    
    @State private var selectedSize = "Medium"
    @State private var addBrownSugarBoba = false
    @State private var addLycheeJelly = false
    @State private var addCrystalBoba = false
    @State private var quantity = 1
    
    var unitPrice: Double {
        var base = 5.50
        if addBrownSugarBoba { base += 0.50 }
        if addLycheeJelly { base += 0.50 }
        if addCrystalBoba { base += 0.50 }
        return base
    }
    
    var totalPrice: Double {
        unitPrice * Double(quantity)
    }

    var body: some View {
        Form {
            Section("Choose Your Drink") {
                Picker("Tea Type", selection: $selectedDrink) {
                    ForEach(drinkOptions, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Size", selection: $selectedSize) {
                    Text("Small").tag("Small")
                    Text("Medium").tag("Medium")
                    Text("Large").tag("Large")
                }
            }
            
            Section("Toppings") {
                Toggle("Brown Sugar Boba (+$0.50)", isOn: $addBrownSugarBoba)
                Toggle("Lychee Jelly (+$0.50)", isOn: $addLycheeJelly)
                Toggle("Crystal Boba (+$0.50)", isOn: $addCrystalBoba)
            }
            
            Section("Order Details") {
                Stepper("Quantity: \(quantity)", value: $quantity, in: 1...10)
                
                HStack {
                    Text("Total Price")
                    Spacer()
                    Text("$\(totalPrice, specifier: "%.2f")")
                        .bold()
                }
            }
            
            Button(action: {
                for _ in 0..<quantity {
                    let newItem = CartItem(
                        name: selectedDrink,
                        price: unitPrice,
                        details: "\(selectedSize) with toppings"
                    )
                    cartItems.append(newItem)
                }
            }) {
                Text("Add \(quantity) to Cart")
                    .frame(maxWidth: .infinity)
                    .alignmentGuide(.leading) { _ in 0 }
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Build Your Own")
    }
}
