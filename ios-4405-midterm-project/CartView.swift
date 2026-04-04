//
//  CartView.swift
//  ios-4405-midterm-project
//
//  Created by Cindy Huynh on 4/1/26.
//

import SwiftUI

struct CartView: View {
    @Binding var cartItems: [ShopItem]
    @Environment(\.dismiss) var dismiss
    
    var total: Double {
        cartItems.reduce(0) { $0 + $1.price } // calculates total price
    }

    var body: some View {
        VStack {
            List {
                ForEach(cartItems) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text("$\(item.price, specifier: "%.2f")") // %.2f format specifier for cost in dollars
                    }
                }
                .onDelete { indexSet in
                    cartItems.remove(atOffsets: indexSet)
                }
            }
            
            VStack(spacing: 10) {
                Text("Total: $\(total, specifier: "%.2f")").font(.title2).bold()
                
                NavigationLink(destination: PaymentView(cartItems: $cartItems)) {
                    Text("Proceed to Checkout").padding().frame(maxWidth: .infinity)
                        .background(cartItems.isEmpty ? .gray : Color(red: 0.404, green: 0.745, blue: 0.851))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.disabled(cartItems.isEmpty) // prevents checkout if cart is empty

                Button("Add More Items") {
                    dismiss() // returns to ContentView
                }
                .padding(.top, 5)
            }
            .padding()
        }
        .navigationTitle("Your Cart")
    }
}
