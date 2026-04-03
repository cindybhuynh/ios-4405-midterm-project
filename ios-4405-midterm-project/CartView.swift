//
//  CustomDrinkView.swift
//  ios-4405-midterm-project
//
//  Created by Cindy Huynh on 4/1/26.
//

import SwiftUI

struct CartView: View {
    @Binding var cartItems: [CartItem]
    
    // Calculated property for total price
    var total: Double {
        cartItems.reduce(0) { $0 + $1.price }
    }

    var body: some View {
        VStack {
            List {
                ForEach(cartItems) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text("$\(item.price, specifier: "%.2f")")
                    }
                }
                .onDelete { indexSet in
                    cartItems.remove(atOffsets: indexSet)
                }
            }
            
            VStack(spacing: 15) {
                Text("Total: $\(total, specifier: "%.2f")")
                    .font(.title2).bold()
                
                // Link to Payment Screen
//                NavigationLink(destination: PaymentView(cartItems: $cartItems)) {
//                    Text("Proceed to Checkout")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(cartItems.isEmpty ? Color.gray : Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                .disabled(cartItems.isEmpty) // Prevent checkout if empty
            }
            .padding()
        }
        .navigationTitle("Your Cart")
    }
}
